# 2020 COVID-19 Eviction Moratoria and Utility Disconnection Policies 

## Overview

This repository contains data and code related to a comprehensive study of eviction moratoria and utility disconnection policies implemented in response to the COVID-19 pandemic and other emergency conditions, including extreme weather. The goal of the study is to provide a detailed understanding of housing stabilization policies across the United States, expanding beyond COVID-specific measures to include broader eviction prevention and utility disconnection protections.

## Files

1. jowers_state_evic_policies.xlsx
This file contains the full dataset on state-level eviction moratoria, including citations and explanations for any differences between our dates and those used in Benfer et al.'s data. For more information on why we make this comparison, see the Methodology notes below.  

2. new_evic_policy_data.csv
This file presents the eviction moratoria data in a long format, focusing on the dates associated with each state's moratoria. It provides a simplified view of the policies without citations or explanatory notes.

3. wide_data.csv
This file offers a wide format version of the eviction moratoria data, consolidating key dates for each state into a more compact representation. It is useful for cross-state comparisons or more streamlined analyses.

## Methodology

### Eviction Moratoria Database Development
This project builds upon the foundational work of Benfer et al., which cataloged COVID-19 eviction moratoria across the U.S. Both datasets capture actions taken by governors, legislators, and local authorities, with ours capturing as well as non-COVID-19 measures such as cold-weather eviction and utility disconnection bans. Our motivation for creating our own data was because we noticed discrepancies between what was in early versions of Benfer et al.'s data and what we were interested in coding--we were most interested in knowing when any action resulted in the stoppage of evictions or disconnections regardless of whether it was specific to the pandemic. 

### Utility Disconnection Policies (files to be added)
In addition to eviction moratoria, we examined utility disconnection policies, particularly non-disconnection measures during extreme temperatures (both high and low). Our data incorporates these seasonal disconnection protections, which vary by state and are typically enforced during certain months to protect vulnerable populations. For more details, see: Government compilation of state seasonal disconnection policies.

Our process involved:
- Reviewing each state's policies in-depth (e.g., COVID-related, cold weather bans, extreme weather protections).
- Referencing orginal data sources (e.g., the orders, legislation, etc.) to create specific citations to them to document our decisions and verifying data accuracy. 

The primary purpose of our database is to create a more comprehensive picture of eviction moratoria across all U.S. states, covering measures related to both the COVID-19 pandemic and other emergency conditions.

## R Code

The R scripts used to clean and process the eviction moratoria and utility disconnection data are also available in this repository. The code includes data transformation steps for both long and wide formats, ensuring traceability of the cleaning process.

## Citations


## Contact

For questions or further information, please contact Kay Jowers at kay.jowers@duke.edu.
