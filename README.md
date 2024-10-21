#COVID-19 Eviction Moratoria and Utility Disconnection Policies

##Overview

This repository contains data and code related to a comprehensive study of eviction moratoria and utility disconnection policies implemented in response to the COVID-19 pandemic and other emergency conditions, including extreme weather. The goal of the study is to provide a detailed understanding of housing stabilization policies across the United States, expanding beyond COVID-specific measures to include broader eviction prevention and utility disconnection protections.

##Files

1. jowers_state_evic_policies.xlsx
This file contains the full dataset on state-level eviction moratoria, including citations and explanations for any differences between our dates and those used in Benfer et al.'s seminal analysis. The dataset captures actions taken by governors, legislators, and local authorities, as well as non-COVID-19 measures such as cold-weather eviction bans.

2. new_evic_policy_data.csv
This file presents the eviction moratoria data in a long format, focusing on the dates associated with each state's moratoria. It provides a simplified view of the policies without citations or explanatory notes.

3. wide_data.csv
This file offers a wide format version of the eviction moratoria data, consolidating key dates for each state into a more compact representation. It is useful for cross-state comparisons or more streamlined analyses.

##Methodology

Eviction Moratoria Database Development
This project builds upon the foundational work of Benfer et al., which cataloged COVID-19 eviction moratoria across the U.S. Our enhanced database extends this work by:

Including all eviction prevention measures (e.g., COVID-related, cold weather bans, extreme weather protections).
Reviewing each state's policies in-depth and cross-referencing multiple data sources.
Verifying data accuracy through a legal review process to ensure consistency with state laws and policies.
The primary purpose of our database is to create a more comprehensive picture of eviction moratoria across all U.S. states, covering measures related to both the COVID-19 pandemic and other emergency conditions.

Utility Disconnection Policies
In addition to eviction moratoria, we examined utility disconnection policies, particularly non-disconnection measures during extreme temperatures (both high and low). Our data incorporates these seasonal disconnection protections, which vary by state and are typically enforced during certain months to protect vulnerable populations.

State-level and state-by-week fixed effects were employed in our analysis to absorb variations in these consumer protection programs and to account for seasonal policies where no specific COVID-19-related utility moratoria were enacted.

For more details, see: Government compilation of state seasonal disconnection policies.

##R Code

The R scripts used to clean and process the eviction moratoria and utility disconnection data are also available in this repository. The code includes data transformation steps for both long and wide formats, ensuring traceability of the cleaning process.

##Citations


##Contact

For questions or further information, please contact Kay Jowers at kay.jowers@duke.edu.
