### Task Status Updates 
Completed: 
1. Finding the two datasets to link:
	One dataset of the Illinois State Board of Education (2023) and another from the US Census Bureau (2023) was already sourced and we have cleaned and merged the two datasets. The ISBE dataset follows the format of an excel spreadsheet and the US Census Bureau dataset follows a json format. Both datasets were accessed under the principle of fair use, meaning that we can utilize the datasets for educational purposes.
	Artifacts (included in separate GitHub folder) associated with Task Update #1:
2023 Illinois Report Card (ISBE Raw Data):
23-RC-Pub-Data-Set.xlsx 
2023 US Census Bureau Information:
https://api.census.gov/data/2023/acs/acs5/subject?get=NAME,S1901_C01_012E&for=county:*&in=state:17

2. Determination of Dataset Licensing:
2023 ISBE Report Card: According to the ISBE website “Data & Accountability” page, ISBE indicates that all reports, including the 2023 Illinois Report Card, are provided to the public to ensure that the public has direct access to public information. The ISBE website does not provide a specific license for this information, but it includes 6 principles of expected data usage including: Data Accuracy, Privacy Protection, Non-commercial use. This dataset is used for educational purposes only and meets the 6 principles, the link to the ISBE’s “Data & Accountability” page is included below.
Link:https://www.isbe.net/Pages/Data-Analysis-Reports.aspx#:~:text=ISBE%20authorizes%20the%20user%20to,research%20based%20upon%20these%20data.

2023 US Census Bureau: Similar to the ISBE Report Card, census.gov is a government website and the “License Information and Disclaimer” page on census.gov indicates that no license is given to census,gov datasets. 
Link: https://www.census.gov/data/software/x13as/disclaimer.html


3. Integrating the two datasets via Python:
	We followed a multi-step process to integrate the two datasets in Python, we will discuss first how we extracted the inputs of the eventual regression model from the ISBE report card:
The ISBE report card contains a number of different sheets such as “General”, “Finance”, “SAT”, etc. The purpose of our project is to determine the relationship between graduation, dropout, academic proficiency rates with income, and second purposes include determining the relationship of expenditures and county  income and subject matter strength (ELA, Math, Science) on county income. The ISBE report primarily contains the inputs of an eventual regression model we will create (graduation rates, academic proficiency rates, dropout, rates) in different sheets, which we will extract.
Through examining the different sheets, we determined that the sheets: “General”, contains the most information on dropout and graduation rates (with numerous columns referring to such information), “ELA Math Science” includes metrics exclusively focused on the science, reading, and math proficiencies of students. Information from these two sheets will provide the inputs to our main regression model.
Our secondary research purpose is to determine the relationship between expenditures and income. The “Finance” sheet contains information about how much the state/federal government spends per student (information which may not be directly related to academic proficiency, this will be used as an input to determine the relationship between expenditures and county income.
Within each sheet, there is a substantial number of potentially relevant columns. We looked through the excel sheets and determined that, for the “General” sheet, columns with “graduation” and “dropout” would be most relevant for informing us on graduation and dropout rates. For the “ELA Math Science” sheet, columns with “proficiency” and “growth” would be most relevant to gather academic proficiency information. For the “Finance” sheet, columns with names including “expenditure” and “revenues” would be most useful in informing us about the financial resources the student is provided.
We searched each sheet for column names which include their relevant words and outputted them in a list. For example, for the “General” sheet, we created a list containing all the column names with “graduation” and “dropout”. 
After looking at the relevant column names for each of the three sheets. From “General” sheet, we created a sub-dataset with the "High School 4-Year Graduation Rate -Total", and the "High School Dropout Rate - Total" columns to include in our final dataset to inform us about the graduation and dropout rate by county. We used the 4 year graduation rate rather than any other graduation rate (for example the 6 year rate) since we believed the 4 year rate was the most relevant. From the “Finance” sheet, we created a sub-dataset with the “$ Total Per-Pupil Expenditure” for the federal, state level and the subtotal column. We included the federal and state level information to ensure a full picture as to the financial resources provided per student. From the “ELA Math Science” sheet, we created a sub-dataset with the ELA, Math, Science % proficiency rate. We decided to focus exclusively on proficiency rates rather than others since some variables like “SAT” apply more towards upperclassmen, and proficiency scores in contrast seem more generalized to include students of all age groups. In addition to columns that would eventually be relevant to the model, we also included the “county” column of each of the sheets on their respective sub-datasets; this is because we will eventually use the county name to merge with the census information.
In all three sub-datasets, we aggregated the information by County names. As such, we had three datasets which contained the mean information on academic proficiency, expenditure, etc. information for each of Illinois’ counties.
We will now discuss the integration process for the US Census Bureau information.
Since the 2023 US Census Bureau dataset contains information related to all the US and we just want information from Illinois for an apples to apples comparison with the ISBE dataset information; we used an api key which exclusively contained information for Illinois counties to load the dataset.
Since the dataset did not have column names and the first row contained the dataset names, we removed the first row and added names to columns. To help merge the dataset with the ISBE dataset later, the county names had to be in the same format so we reformatted the name so that each dataset would just have the name of the county exclusively (ex. “Adams” for Adams county). 
	Finally we completed two steps to merge the two datasets:
Since the information from ISBE was currently divided into three datasets which each contain information from each of the three sheets. Created a new dataset which merged on “county” for each of the three of the datasets.
We then used this merged dataset and merged it with the dataset containing the census bureau information (which contains information about income). The cleaning steps that we took during this step is explained below; but this merge of the final two datasets created the dataset that we will be using for the regression analysis later.

4. Data Cleaning 
Cleaned ACS income dataset
After loading the data, we removed the first row because it contains column names. 
Then, we cleaned the county names to match the education dataset. We replaced county names like ‘Cook County, Illinois” to “COOK”. 
We also converted the median income data to integers so we can run statistical models and calculations in the future. 
Clean both county columns in ACS income dataset and education dataset to match. (Uppercase and strip spaces) 
Rename Columns for clarity
Removed $ and % signs from the columns for consistency in names. 
Converted the column names in a more concise way for readability. 
“High School 4-Year Graduate Rate - Total” to “GradRate_Total” 
Converted columns with Percent values to proportions to scale for linear regression in the future. 
Missing Value found: 


Column
#of Missing values
DropoutRate_Total: 16
PerPupil_Federal: 1
PerPupil_StateLocal: 1
Science_Proficiency: 1
Median Income: 5

Columns with 1 missing value (PerPupil_Federal, PerPupil_StateLocal, Science_Proficiency) were imputed with median value. Safe because variability remains intact; does not distort distribution.
Columns with lots of missing values(DropoutRate_Total, Median Income) were dropped because these variables are core predictors/outcomes, dropping avoids biased regression and prevents imputation from distorting the target variable.


____________________________________________________________________________
Update Timeline:
Week 8-9: Analysis, Workflow Automation, Visualization
Perform further analysis of the merged dataset, create regression model, generate visualizations
Use Snake-Make or another script for workflow automation
Document data lineage, workflow processes, etc. and visualize in the form of a diagram
Updating metadata and ensuring ethical/reproducibility requirements met

Week 10-11: Final Project Submission
Prepare final README.md report consisting of:
Title
Contributors
Summary
Data Profile
And all other components/requirements outlined in the “Course Project Instructions"
Commit all items to GitHub and tag release as “final-project”
____________________________________________________________________________
Status Summary:
Finding Datasets → Completed  
Dataset Licensing Review → Completed  
Column Selection & Feature Engineering → Completed  
Cleaning & Merge → Completed  
Missing Data Resolution → Completed  
Exploratory Visualizations → Planned 
Regression & Modeling → Planned  
Workflow Automation → Planned  
Final Write-Up + README → Planned  

____________________________________________________________________________
Artifact References 
- `illinois_cleaned_county_data.csv` (final dataset)
- `23-RC-Pub-Data-Set.xlsx` (raw ISBE dataset, stored in /raw/)
- ACS API query embedded in notebook (outputs to dataframe `income_df`)
____________________________________________________________________________
Ethics/Security 
No private data used
Only aggregated county-level data
No student-identifying variables ⇒ compliant with FERPA
____________________________________________________________________________
Updated Responsibilities (correction from previous Status-Report):
Seungmin Cho:
Using regression analysis to determine the relationship between per-pupil expenditures and county income
Using regression analysis to determine strength of relationship between subjects such as Math, ELA, and Science and county income
Writing out sections of the final project report
William Tang:  
Creating the regression model which highlights the relationship between the high school graduation, dropout, and academic proficiency rates in a county and the county income. 
Creating a visualization demonstrating data lineage, workflow processes, etc.; likely in the form of a diagram.
Writing out sections of the final project report
____________________________________________________________________________
Contributions:
William Tang:
	* Wrote multiple sections of the report: Updated timeline, task updates, updated responsibilities.
	* Organized meetings with Seungmin to work on the project.
	* Researched dataset licensing determination for the datasets.
