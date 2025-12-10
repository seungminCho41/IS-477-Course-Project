Final Project Report

Title: Analyzing the impact of Academic Proficiency, Graduation/Dropout, and Student Expenditures on Median Income

Contributors: 
William Tang:
Project plan: Finding the dataset, and writing the “Overview”, “Gaps”, ‘Dataset” sections
Status Update: Writing “Updated Timeline”, “Task Updates”, “Updated Responsibilites”, Researching Dataset licensing
Final Project Report: Creating the visualizations and regression model, writing the “Summary”, “Future Work”, and “Findings” sections 
Min Cho - .

Summary: 
	The purpose of our project is to determine the relationship between a variety of factors including: academic proficiency rates, graduation/dropout rates, expenditures on students; on median household  income. The reason why our project is particularly important is because, since we believe there is a strong correlation between the high school graduation, academic achievement, resources provided per student and wealth, we wanted to provide future researchers and policy makers with the information and the analysis to determine which factors had the greatest impact on income and encourage more resources to be allocated towards education and stronger factors. Another motivation of ours was, because we are exclusively using information pertinent to Illinois in our analysis, we wanted to highlight the relationship between those factors and income in Illinois so educators and policy makers in Illinois will have a better idea on how to support Illinoisans on a county-to-county basis.
	The primary research question that we are pursuing with our project is: how does academic proficiency, graduation rates, and per student expenditures impact the median income on a county to county basis? Two secondary research questions that we also pursued is: what is the impact of per pupil expenditures on income? Additionally, are the relationships between income and academic proficiency stronger or weaker across different subjects?
	The reason that we find the first secondary research question to be important is because we want to know how much of a correlation exists between more school funding and the median household income. If the correlation between school funding and median household income is strong, that would demonstrate the heavy impact that more funding can have on the future wealth of a community. This in turn can encourage policy makers to allocate either additional funds to schooling or focus more funding to lower-income communities; which in turn can positively impact the future wealth of said communities. On the other hand, if there seems to be a weak correlation between funding and household income, that could suggest that either funding to schooling is inefficiently spent or allocated; which would encourage policy makers to determine methods in which to make each dollar spent on schooling more impactful. Additionally, our research will provide more visualization regarding the distribution of federal and state/local funding across Illinois, this can further give policy makers an idea about the discrepancies in funding across Illinois counties and take actions to reduce funding differences across counties. 
	Further, the reason why we find the second research question to be important is because determining the academic proficiency which has the greatest impact in predicting future median household income can help policy makers focus more funding and resources on some academic proficiencies over others. Since school systems often have to balance funding between different subjects and programs, giving educators and policy makers an idea as to which subjects and their related programs had the most positive impact on their communities allows them to better allocate limited resources to better impact their communities. 
	Ultimately, with this project, we seek to both create a model and visualize relationships between median household income and a variety of socioeconomic factors related to schooling. The model and visualizations can be used by future educators, policymakers, and researchers to determine which subjects to focus schooling most on, how much funding to provide to schools to maximize benefit, etc. so that communities across Illinois can benefit in the long-term from greater wealth. 

Data profile: 
	The two datasets I used in my project were the Illinois Report Card 2023 from ISBE and the 2023 ACS income estimates from the U.S. Census  Bureau. Both datasets are  public, but they have different structure, format, and purpose. We needed to figure out how each dataset was organized  and what variables it consisted of in order to merge them together at the county level. 
The ISBE Report Card was a  huge Excel workbook with multiple sheets. The main three sheets were used. The general sheet had 4707 rows and 1257 columns  consisting of school and district identifiers, names, city, county, enrollment, and lots of general information. The finance Sheet had 4707 rows with 69 columns with lots of different per-pupil spending measures  at the federal and state/local level. The ELA_Math_Science had  4705 rows and 284 columns containing district-level proficiency percentages for English, Math, and  Science.
The ACS dataset came from the ACS API. I stored it as a CSV called income_df which had 102 rows and 5 columns with each row representing each Illinois county. The variables were county name,  median household  income, state, FIPS and county FIPS. 
	The unit of observation in our project was each county in Illinois. Both dataset included county-level information for each variable. So after some cleaning, I was able to create a merged dataset with 84 counties with 9 variables of interest. Out of 102 counties, 18 were  dropped because there were missing variables on both dataset. 
	The variables used from ISBE  were the net graduation rate, dropout rate, per-pupil federal and state/local expenditure, and ELA/Math/Science proficiency. From ACS, we used the Medial income per household. All percentages were converted into float proportions to keep the variable names and metrics simple and straightforward. 

Variable Definitions
GradRate_Total represents the percentage of first-time 9th grades who graduate within 4 years. 
DropRate_Total represents the percentage of students in grades 9-12 who leave school without completing a high school program. 
The ELA/MATH/Science proficiency means the percentage of students who scored level 4 or higher on Illinois Assessment of Readiness for each subject. 
The IAR tries to assess whether students are performing above or under the expected grade level on math, reading, and science. 
Perpupil_Federal/StateLocal are how much funding each county receives per student. 
Median_Income refers to median household income in the past 12 months. 
County_Clean are cleaned version of county names to match ISBE and ACs data. 

Metadata differences 
	The ISBE report card comes as school-and district level records in Illinois. It has a large pool of variables (academic performance, expenditures,  demographics) and  metrics  such as graduation rate, proficiency, expenditure). ISBE  publishes the definition of its variables and formulas for metrics in  the “Report Card Metrics” documentation. On the other hand, The ACS data  is a household-level  survey  aggregated to county level. It clearly defines its variables and geographies with detailed explanations of methodology, sampling design, and error margins. The two dataset can merge together through their common factor of county variable. 

Purpose of Each Dataset
	The  main purpose of the ISBE  report card is public reporting and accountability. Illinois wants parents, districts, and policymakers to see how each school/district is performing academically and financially. 
	ACS is based on a national survey designed to measure things like income, education, housing, employment, etc for every county in the United States. Its goal is to provide recent socioeconomic estimates for local governments, researchers, and policymakers for funding and analysis. 

Limitation and Biases 
	Some ISBE metrics are missing which resulted in dropping 18 counties from the final dataset. Thus, the analysis does not include all Illinois counties. ISBE and ACS recorded their data in different ways. ACS data is also not a full census. It is an estimate based on a survey. As a result, the data come with margins of error especially in less populated counties and I would have to account for it when making conclusions. 

Data quality:
This section goes over the overall quality of the datasets I used, what kinds of issues I ran into while cleaning them, and the specific steps I took to make sure the final dataset is actually usable. My goal was to end up with a clean, consistent dataset at the county level for all of Illinois, so I focused on fixing missing values, normalizing county names, and removing anything that would break the merge or introduce noise in the analysis.
	There were a total of 24 missing data from the dataset. The majority of the missing data were concentrated in DropoutRate_Total (16 counts) and Median_Income(5 counts). All other variables had either zero or exactly one missing value. For variables with 1 missing value, we conducted median imputation because it allows us to keep more counties without distorting the distribution. For DropoutRate and Median Income data, their missing count was substantial so imputation would introduce too much artificial data. Also, there was no point in keeping counties that were missing Median_Income because the entire goal of the project is to compare educational variables against median income. 
While looking through the merged dataset, there weren't any noticeable outliers present. 
	In terms of semantic cleaning, the most important part was normalizing the county names for both ACS and ISBE dataset. If these values do not match exactly, the merge produces mismatched rows, missing income data, or duplicated county entries. Although both consist of counties inside Illinois they format county names differently. For example, the ACS dataset had county names as “Adams, Illinois” while the ISBE dataset was named “Adams.” We removed the extra text, punctuation, and whitespaces from the ACS data and uppercased them for both. Thus, every county name across both dataset followed the same format and saved to County_Clean. Additionally, some counties contained multiple school districts. To avoid duplication, we used group by function to aggregate education variables to one row per county and averaged the data. 
For syntactic cleaning, we renamed some column names to be shorter and intuitive for understanding. For example, column names such as “High School 4-Year Graduation Rate - Total” were renamed to GradRate_Total. We removed the header artifacts from the ACS API because we don’t need them. Also, median income data was converted from string to integer to be used in a regression model later. 
Some limitations are that our project doesn't represent all counties in Illinois due to dropping 16 counties due to missing data. Because we analyzed data on a county level, it doesn’t represent inequality present in high income suburbs and lower income towns within the same county. ACS median income data is an estimate based on survey collection, so there may be some sampling error present. 
Some strengths of the dataset are that they come from trusted public sources and are aligned based on county as a consistent measure. Also, there are no missing data after cleaning. There were some weaknesses as well. Some counties were dropped in the process of cleaning missing data. Finance variables may not perfectly represent real spending because finance varies across different districts within the county. 
Overall, after addressing missing values and correcting syntactic/semantic issues, the final dataset is clean, consistent, and ready for analysis.

Findings:
Prior to answering the primary research question, we first wanted to explore our secondary research questions. Namely, we wanted to first discover the relationship between federal/state local expenditures and median income by county, then we wanted to discover the relationship between academic proficiencies and median household income.
Expenditure - Median Income Visualizations
	The first visualization that we generated was between all the variables of our dataset except county. Using the pairplot, we immediately noticed that there seemed to be a relatively positive relationship between most of the predictor variables we would be using in our regression model later (ex. Graduation rate, academic proficiencies, etc.) and median income. In fact, the only two numeric variables that did not seem to have a positive relationship with income and dropout rate and per-pupil expenditure via federal funds. A negative relationship between dropouts and median income makes good sense, a higher rate of dropout typically means that students don’t complete high school, which could negatively impact the wage potential of said students. That said, the negative relationship between federal expenditure per student was notable as one would expect that the more that was spent on students from a federal level would lead to more increased opportunities and support for students which would lead to increased median household income in the long term. 
	Looking more into depth into the relationship between expenditures and median household income, the first scatterplot we generated demonstrated the relationship between federal expenditures and household income. At first glance, we noticed the sharp negative relationship between the two variables, with a correlation coefficient of -0.459. We found this notable because one would typically expect that higher expenditures per student would positively impact income potential. We looked into the possible reasoning behind this trend and, according to the Learning Policy Institute, federal funding for schooling is typically focused on Title 1 funding, which focuses on bridging wealth disparities by focusing funding on areas of higher poverty and need (Learning Policy Institute, 2025). This would provide an explanation as to why there is a negative relationship between federal funding and median household income: federal funding is more allocated towards providing resources to lower income communities. Another key thing we noticed by comparing this scatterplot and the scatterplot between state/local funding and median income (which we will discuss next), is how low federal funding is compared to state/local funding across counties in Illinois. In fact, comparing the ranges of the graphs, federal funding by county follows a range of around $0 - $3500 per student while state/local funding by county follows a range of $5000 - $18000. The Learning Policy Institute further explains that federal funding has, on average across the nation, fallen to just 8% of school funding. In relation to our secondary research question, this could mean that federal funding is relatively weak in predicting median income relative to state/local funding.
	The next graph depicts the relationship between state/local funding and median household income. From the outset, we can determine that there is positive correlation between state/local funding and median income, and there is further a correlation coefficient of 0.416 between the two variables. There seems to be a moderately strong correlation between state/local funding and median household income, which could suggest a causal relationship between more state/local funding per student and the income of a community. As noted previously, state/local funding plays a much larger role in funding that federal funding on a county-by-county basis, which could mean that state/local funding is a much stronger predictor for community wealth than federal funding. 
Academic Proficiency - Median Income Visualizations
	The next three visualizations we created were between the three academic proficiency ratings and median income. 
	The first scatterplot we created was between math proficiency and median income, there is a strong positive correlation between the two variables, with a correlation coefficient of 0.546. A notability that we found in the graph was the seemingly low rate of Math proficiency across counties. Even in higher income counties, Math proficiency did not exceed 0.45, and this trend repeated across ELA and Science as well as demonstrated in their graphs which we will discuss later. According to Illinois Policy, the low rates of proficiency in 2023 can be explained by a wide range of factors including: chronic absenteeism and the after effects of the pandemic (Illinois Policy, 2023). Regarding the relationship between math proficiency and median household income, outside of a few outliers, most points seem to follow the positive trend; increases in proficiency were generally reflected with higher household incomes with counties with median household incomes of $50,000 with around a 0.15 math proficiency rate and counties with median household incomes of $100,000 possessing proficiencies within the 0.35-0.45 range.
	The next two scatterplots we created were between ELA proficiency and median income and Science proficiency and median income, both of which had weaker positive relationships with 0.387 and 0.280 as correlation coefficients respectively. As discussed prior, both proficiencies seem to have low overall maximums, with ELA proficiency rate as 0.45 for the best performing county for ELA and 0.7 being the Science proficiency rate for best performing county for science: which is explained by the factors explained by Illinois Policy (chronic absenteeism, pandemic effects, etc.). 
	Ultimately, based on the visualizations, it seems that Math proficiency seemed to have the strongest relationship of any proficiency rating with median household income, which could even point to a causal relationship. This analysis is reduced, however, by the fact that low proficiencies prevailed across counties in Illinois, which means that we can’t really generalize how higher proficiencies would be related to median income. For example, since the county with the best math proficiency rate had a rate of around 0.45, we can’t really determine what the relationship between math proficiency and median household income would be unless we extrapolated the trends of lower math proficiencies, which wouldn’t be accurate for our analysis.
Regression Model
	Finally, for our findings, we also created a Regression model which would map out how well each of the predictor variables (graduation/dropout/academic proficiency rates and federal/state funding) would predict income. The equation that was generated via our regression model was: 

Predicted Median Household Income = 8,521.8345 + 47,980(Graduation Rate) - 211,400(Dropout Rate) - 5.3242(PerPupil_Federal) + 2.0155(PerPupil_StateLocal) + 85,320(Math_Proficiency) - 4,133.5151(Science_Proficiency) - 26,200(ELA_Proficiency)

	The strongest predictors of median household income were Graduation Rate, Dropout Rate, State/Local Funding per pupil, and Math/ELA proficiency. It is important to note that even though the coefficient related to state/local funding is small, the reason why it is more impactful than, say, federal funding which has a higher coefficient, is because student/local funding is represented by much higher values than federal funding. Additionally, it is important to note that the reason why graduation, dropout, and math/ela have very high coefficients is because they are represented by percentages and not high-value integers. 
	Before we discuss our conclusion, there are a number of constraints of our model that we would like to note however. The most important constraint is that some of the coefficients do not make sense from a general perspective. For example, more funding per student federally and a higher ELA or Science proficiency rating should not negatively impact predicted median household income. Regarding federal funding, we have already established previously that the negative relationship between federal funding and median household income has more to do with federal funding being more focused on supporting currently disadvantaged communities than being indicative of what the median household income would look like over time as a result of federal funding. Additionally, it does not make sense that a higher ELA/Science proficiency should negatively impact median household income. The reason why the science/ela coefficients could be negative is to offset some of the effects of the other variables and their coefficients, this would be reasonable but still negatively impacts the practicability of the model. 
Based on the results of our regression model, we conclude that the graduation rate, state/local funding, math proficiency positively impact median household income while federal funding, dropout rate, science/ela rates negatively impact median household income. The strongest variables in predicting median household income are graduation rate and math proficiency and dropout rate. Graduation rate and math proficiency justifiably strongly impact median household income positively, as higher graduation rates mean that students are more likely able pursue additional opportunities and higher math proficiency likewise improves the skillsets of students. Dropout rate also justifiably strongly impacts median household income negatively, as students who drop out of high school likely have fewer opportunities. Additionally, we would like to note our model had a RMSE of $8020, which would suggest that our model would be moderately ineffective when used in practice. 

Future work:
	In the future, some of the work that we think would be relevant to our project would be improved upon the practicability and predictive value of our model. Regarding practicability, we noted in our findings that a lot of variable coefficients did not make much sense. For example, ELA and Science proficiency rates should, theoretically, positively impact the median household income; especially considering the fact that each individually is positively correlated with median household income as demonstrated by their visualizations independently. However, in our model, Science proficiency and Reading proficiency actually decreases the predicted value from our model, so theoretically, everything else held equal, a county with an average Science and ELA proficiency rate of 100% would have a lower predicted income than one with the two proficiency rates at 0%, which makes little sense in context. Additionally, as mentioned earlier, federal funding which provides additional resources to students should positively impact median household income as well, however, due to the fact federal funding is more directed towards lower income communities, the model is skewed towards federal funding having a negative impact on household income. The model, as it currently stands, can be improved upon by modifying the coefficients of some of the variables so that they make more sense in practice, namely by giving positive coefficients to the ELA proficiency rate, Science proficiency rate, and federal funding. Doing this would also impact the coefficients of the other variables and they should retain their predictability as well, for example, modifying the federal funding coefficient to make it positive shouldn’t make another variable have a negative coefficient. Modifying the coefficients so that they make more sense logically is important because it makes the model more useful, currently, a reader using the model may believe that Science and ELA proficiency negatively affects household income; however, the reason why the coefficients are negative have more to do with balancing the model than making logical sense. Hence, modifying the coefficients would make the model more useful, perhaps less useful overall since the total RMSE may increase but the components of the model would make more sense when read. 
	Another avenue of improvement of the model would be to reduce the RMSE, currently the RMSE of our model stands at $8020, given that the mean median household income is $68,687.82; an RMSE of $8020 means that the usefulness of the model is substantially reduced. For our model, we used Ordinary Least Squared Regression for our model, but in the future we or future researchers may use different types of regression models or data cleaning methods to make the model more useful for predictions. 
	Regarding the usage of the model itself, we do believe that the model and visualizations that we created would be moderately useful to future researchers, policy makers, and educators. Regarding the visualizations that we created, we think that the most useful visualizations that can be used by researchers are federal and state/local funding per student vs median household income. The reason why we found those two visualizations particularly useful for future users is because, not only do they demonstrate the impact that funding can have on median household income, but they also demonstrate how funding between different counties can vary widely between different counties as demonstrated by how the x-values of the points on both graphs are widely distributed. This shows that funding per student seems to differ widely across different counties, which is something that policymakers should consider addressing to promote more equality in terms of funding. Policymakers can use the visualizations to determine where funding per student by county should gravitate towards, obviously with consideration to the socioeconomic conditions of each county. On the other hand, we don’t believe that the visualizations of academic proficiencies vs median household income should taken into as much account, due to the conditions in 2023, many of the proficiencies are lesser than what they would have been which means that we don’t believe that the graph would be as useful in determining which proficiencies school districts should focus more on. In other words, we think that the visualizations pertaining to academic proficiencies would be better if more recent information is used since the 2023 proficiencies were more impacted by the pandemic and its aftereffects. Regarding the model, we think that it would be somewhat useful, we think that the model would be somewhat useful in predicting what the median household income could look like based on a variety of different factors, however this is held back by the high RMSE and because some of the coefficients do not make substantial sense. We think that, before using our model, future users should modify the model so that the coefficients make more sense and there is a lower RMSE. If the model is used to help inform policy, a RMSE of $8,000 has the possibility of significantly impacting policy adversely, but reducing the RMSE to around $500 or lower would mean that the model would be much better at predicting the median household income of a county. In that case, the model would be better at indicating how much resources would be needed in order to reach goals and what proficiencies should be focused on. All in all, the model currently is somewhat effective in accurately predicting median household income, but needs modification to be put into practice.
 
Reproducing: 
	This section will explain how to reproduce our project from scratch. It has instructions of where the data comes from, how it was cleaned, the structure of the workflow, where the outputs are stored, and what the software environment is required. Users will be able to clone my repository, download my data, run scripts/notebooks, and regenerate the exact results. 
Project Folder Structure: 

IS-477-Course-Project/
│
├── data_raw/    
├── data_clean/    
├── results/       
├── notebooks/       
├── workflow/      
│
├── ProjectPlan.md
├── StatusReport.md
├── README.md
└── requirements.txt

Data Sources and Retrieval 
ISBE Report Card Data (Manually Downloaded) 
Source: Illinois State Board of Educationo (2023 Report Card)
Filename: 23-RC-Pub-Data-Set.xlsx
Saved in data_raw/ 
Loaded it using pd.ExcelFile() and extracted General, Finance, and ELA Math Science Sheets 
ACS Median Household Income Data (Retrieved via API) 
I pulled county-level median household income for Illinois through the U.S. Census ACS 5-year API 
URL:https://api.census.gov/data/2023/acs/acs5/subject?get=NAME,S1901_C01_012E&for=county:*&in=state:17
API returns: county name, median household incomoe, state FIPS, county FIPS 
Header row was removed and converted income data fromo string to integer
Data Cleaning, Normalization, and Merging
All cleaning steps are documented in final_notebook.ipynb
Use helper function find_columns() to identify key columns we want to identify in our project 
Used .groupby to aggregate counties with multiple rows (due to multiple districts) into single line by and averaging the data. 
Normalized County names from both datasets so merging is possible 
ACS income data 
Remove " County, Illinois"
Convert to uppercase
Strip whitespace
Store as County_Clean
ISBE education data: 
Convert to uppercase
Strip whitespace
Store as County_Clean 
Merging 
First merged three ISBE subsets (general, finance, proficiency) into merged_edu, then merged that with income data 
Handling Missing values 
Variables with exactly 1 missing value were imputed using median:
PerPupil_Federal
PerPupil_StateLocal
Science_Proficiency
Counties missing DropoutRate_Total (16) or Median_Income (5) were dropped entirely.
Final dataset contains complete cases for all variables.
Saving Final Dataset 
Output saved to: illinois_cleaned_county_data.csv
Code, Notebooks, and Workflow Scripts: 
Notebooks 
Final_notebook.ipynb 
Cleaning, merging, normalization workflow 
Visualizations.ipynb
correlation matrix, scatterplots, regression model 
Workflow scripts 
My project includes a workflow script that automatically re-runs all of the notebooks needed to reproduce the full analysis. The script is located in the workflow/ directory and is named run_all.sh.
This script uses jupyter nbconvert to execute two notebooks in the correct order:
notebooks/final_notebook.ipynb – runs the final cleaned analysis and produces the final dataset and summary outputs.
notebooks/Visualizations.ipynb – generates all figures, scatterplots, regression visuals, and exploratory analysis.
This provides a complete, automated workflow for reproducing every figure, dataset, and result used in my project.
Results 
Contains:
Final Merged Dataset 
Pairplot
Correlation chart
Scatterplots 
Regression Model
All figures generated from Visualizations.ipynb was saved in this folder 
Output Data & Box Folder 
All cleaned data and analysis output files have been uploaded to Box Illinois
Box Folder Link: https://uofi.box.com/s/p8b8test55utm9qelwlgz8yjhr4jvftk
Software Environment and Dependancies 
I used system Python 3.9.6 
Primary Libraries 
Pandas
Numpy
Matplotlib
Seaborn
Scikit-learn
Statsmodels 
Requirements.txt lists every Python package and version that my project uses. Someone else can create the exact same environment by running: pip install -r requirements.txt
Since both the ISBE dataset and the Illinois Report Card dataset are governmental datasets, they have no licenses associated with them and are free to use by the public. According to the ISBE website “Data & Accountability” page, ISBE indicates that all reports, such as the 2023 Illinois Report Card, are provided to the public to ensure that the public has direct access to public information. The ISBE website does not provide a specific license for this information, but it includes 6 principles of expected data usage including: Data Accuracy, Privacy Protection, Non-commercial use. This dataset is used for educational purposes only and meets the 6 principles, the link to the ISBE’s “Data & Accountability” page is included below. Link:https://www.isbe.net/Pages/Data-Analysis-Reports.aspx#:~:text=ISBE%20authorizes%20the%20user%20to,research%20based%20upon%20these%20data.


References: 

Illinois State Board of Education. Illinois Report Card (2023).
https://www.isbe.net/pages/illinois-state-report-card-data.aspx


U.S. Census Bureau. American Community Survey (2023), Table S1903.
https://api.census.gov/data/2023/acs/acs5/subject?get=NAME,S1903_C01_012E&for=county:*&in=state:17
How money matters: Education funding and student outcomes. Learning Policy Institute. (2025, April 9). https://learningpolicyinstitute.org/product/how-money-matters-factsheet#:~:text=What%20factors%20influence%20education%20funding,universally%20available%20high%2Dquality%20preschool
Schmid, H. (2023, October 30). Illinois student proficiency up in 2023, but two-thirds still read below grade level. Illinois Policy. https://www.illinoispolicy.org/illinois-student-proficiency-up-in-2023-but-two-thirds-still-read-below-grade-level/
 
