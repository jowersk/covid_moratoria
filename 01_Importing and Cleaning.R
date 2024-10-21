# Install packages
install.packages("readxl")
install.packages("dplyr") 
install.packages("lubridate") 
install.packages("tidyr")


# Load the packages
library(readxl)
library(dplyr)
library(lubridate)
library(tidyr)

# Import the specific sheet from the Excel file
file_path <- "jowers_state_evic_policies.xlsx" # Update the file path to the correct location
sheet_name <- "Clean Data for Import"

# Read the sheet into a data frame
evic_policy_data <- read_excel(
                               path = file_path, 
                               sheet = sheet_name, 
                               col_types = c(
                                 "text",
                                 "text", 
                                 "text", 
                                 "text",
                                 "text", 
                                 "text", 
                                 "date",   
                                 "date",   
                                 "date" 
                               ))

# View the data
head(evic_policy_data)

# Rename columns to make them easier to use
evic_policy_data <- evic_policy_data %>%
  rename(
    Adoption_Date = `Adoption Date if Retroactive`,
    First_Date_Effect = `Updated First Date of Effect`,
    Last_Date_Effect = `Updated Last Date of Effect`
  )

# Clean the data by converting renamed columns to Date format
evic_policy_data <- evic_policy_data %>%
  mutate(
    # Convert 'Adoption_Date', 'First_Date_Effect', and 'Last_Date_Effect' to Date format
    Adoption_Date = as.Date(Adoption_Date, format = "%Y-%m-%d"),
    First_Date_Effect = as.Date(First_Date_Effect, format = "%Y-%m-%d"),
    Last_Date_Effect = as.Date(Last_Date_Effect, format = "%Y-%m-%d")
  )

# Use case_when to conditionally update 'First_Date_Effect' where 'Retroactive' == "R"
evic_policy_data <- evic_policy_data %>%
  mutate(
    First_Date_Effect = case_when(
      Retroactive == "R" & !is.na(Retroactive) ~ Adoption_Date, # Replace with 'Adoption_Date' if Retroactive is "R"
      TRUE ~ First_Date_Effect # Keep original value otherwise
    )
  )

# View the cleaned and updated data
head(evic_policy_data)

# Drop the Retroactive and Adoption Date variables
evic_policy_data <- evic_policy_data %>%
  select(-Retroactive, -Adoption_Date)

# Create a binary flag for gaps between 'Last_Date_Effect' of one observation and 'First_Date_Effect' of the next observation
evic_policy_data <- evic_policy_data %>%
  # Group by 'State', 'State Abbreviation', and 'State FIPS Code'
  group_by(State, `State Abbreviation`, `State FIPS Code`) %>%
  # Arrange by 'First_Date_Effect' to ensure the dates are in order within each state
  arrange(First_Date_Effect, .by_group = TRUE) %>%
  # Calculate the difference in days between 'Last_Date_Effect' and the next 'First_Date_Effect'
  mutate(date_diff = as.numeric(difftime(lead(First_Date_Effect), Last_Date_Effect, units = "days"))) %>%
  # Create the binary variable indicating if there is a gap greater than 1 day
  mutate(gap_flag = ifelse(is.na(date_diff) | date_diff <= 1, 0, 1)) %>%
  mutate(gap_flag = max(gap_flag)) %>%
  # Ungroup after the operation
  ungroup()


# View the updated data
head(evic_policy_data)

new_evic_policy_data <- evic_policy_data %>%
  # Group by 'State', 'State Abbreviation', 'State FIPS Code', and 'gap_flag'
  group_by(State, `State Abbreviation`, `State FIPS Code`, gap_flag) %>%
  # Use reframe to ensure appropriate output format and retain Date format
  reframe(
    First_Date_Effect = case_when(
      gap_flag == 0 ~ min(First_Date_Effect, na.rm = TRUE),  # Earliest date if gap_flag == 0
      TRUE ~ First_Date_Effect                               # Keep original date if gap_flag != 0
    ),
    Last_Date_Effect = case_when(
      gap_flag == 0 ~ max(Last_Date_Effect, na.rm = TRUE),   # Latest date if gap_flag == 0
      TRUE ~ Last_Date_Effect                                # Keep original date if gap_flag != 0
    )
  ) %>%
  # Ensure columns are of Date type (sometimes needed after summarization)
  mutate(
    First_Date_Effect = as.Date(First_Date_Effect),
    Last_Date_Effect = as.Date(Last_Date_Effect)
  )



# View the updated data
head(new_evic_policy_data)

# Add a variable to indicate if the row is the first, second, etc., policy in each state using the state abbreviation
new_evic_policy_data <- new_evic_policy_data %>%
  # Group by State (this ensures row numbering restarts within each state)
  group_by(State, `State Abbreviation`, `State FIPS Code`) %>%
  # Create a policy number like 'CA-1', 'CA-2', etc., specific to each state
  mutate(policy_number = paste0(row_number())) %>%
  # Ungroup after creating the policy number
  ungroup()

# View the updated data with the state-based policy number
head(new_evic_policy_data)

# Check the structure to verify the added column
str(new_evic_policy_data)

# Save evic_policy_data as CSV
write.csv(evic_policy_data, "evic_policy_data.csv", row.names = FALSE)

# Pivot to wide format, spreading policies across columns
wide_data <- new_evic_policy_data %>%
  pivot_wider(
    names_from = policy_number,    # Use numeric policy number (1, 2, 3) as the column suffix
    values_from = c(First_Date_Effect, Last_Date_Effect, gap_flag) # Values to spread
  )

# View the transformed wide data
head(wide_data)

# Check the structure to verify the wide format
str(wide_data)

# Drop the Gap Flag variables
wide_data <- wide_data %>%
  select(-starts_with("gap_flag"))

# Handle Inf and -Inf by replacing them with NA
wide_data <- wide_data %>%
  mutate(
    First_Date_Effect_1 = case_when(
      is.infinite(First_Date_Effect_1) ~ as.Date(NA),  # Replace Inf with NA and preserve Date format
      TRUE ~ First_Date_Effect_1                      # Keep original values otherwise
    ),
    Last_Date_Effect_1 = case_when(
      is.infinite(Last_Date_Effect_1) ~ as.Date(NA),  # Replace Inf with NA and preserve Date format
      TRUE ~ Last_Date_Effect_1                      # Keep original values otherwise
    )
  )

# Save wide_data as CSV
write.csv(wide_data, "wide_data.csv", row.names = FALSE)