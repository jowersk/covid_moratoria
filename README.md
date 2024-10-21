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

This project builds upon the foundational work of Benfer et al., which cataloged COVID-19 eviction moratoria across the U.S. While both datasets document actions taken by governors, legislators, and local authorities, our dataset expands to include non-COVID-19 measures such as cold-weather eviction bans and utility disconnection protections. Our decision to create an independent dataset arose from discrepancies we identified in earlier versions of Benfer et al.'s data. Specifically, we were interested in capturing any action that resulted in the suspension of evictions or utility disconnections, regardless of whether it was tied to the pandemic.

In addition to eviction moratoria, we examined utility disconnection policies (files to be updated with these later), particularly non-disconnection measures during extreme temperatures (both high and low). Our data incorporates these seasonal disconnection protections, which vary by state and are typically enforced during certain months to protect vulnerable populations. For more details, see: Government compilation of state seasonal disconnection policies. We also aimed to account for whether the utilities commissions that acted had the authority to regulate both private and public utilities within a given area. Utility commissions often have limited jurisdiction, meaning their regulatory actions may apply only to specific types of utilities, typically private utilities, while public utilities, such as those run by municipalities or cooperatives, may fall outside their scope. In many cases, whether protections were enforced in a particular county depended on whether the area was primarily served by a private utility, which falls under the commission's regulatory oversight, or by a public utility, which may operate independently of state-level regulation. This distinction was critical in determining whether moratoria or other consumer protections applied in a given region.

Our process involved:

- Reviewing each state's policies in-depth (e.g., COVID-related, cold weather bans, extreme weather protections).
- Referencing orginal data sources (e.g., the orders, legislation, etc.) to create specific citations to them to document our decisions and verifying data accuracy.
- Accounting for whether utility disconnection policies applied to private or public utilities (or other limitations on the scope of a specific order on utility disconnections). 

The primary purpose of our database is to create a more comprehensive picture of eviction and utility disconnection moratoria across all U.S. states, covering measures related to both the COVID-19 pandemic and other emergency conditions.

## R Code

The R scripts used to clean and process the eviction moratoria (and utility disconnection data) are also available in this repository. The code includes data transformation steps for both long and wide formats, ensuring traceability of the cleaning process.

## Citations to Other Work

- Benfer, Emily, and Koehler, Robert. Eviction Moratoria & Housing Policy: Federal, State, Commonwealth, and Territory: 2023.02.01 Moratoria  Supportive Measures Datasets.xlsx. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], 2023-02-06. https://doi.org/10.3886/E157201V2-139166. 

## Contact

For questions or further information, please contact Kay Jowers at kay.jowers@duke.edu.
