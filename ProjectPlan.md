# Income & School Performance in Illinois (IS 477)

## 1) Overview
The project that we will be pursuing is an analysis of the relationship between a county’s high school graduation and educational proficiency rate on the median income of the county across Illinois. 

We strongly believed that there is a potential relationship between high school graduation and median income, especially since graduation is a requirement in the United States and many higher-paying jobs are limited to high school graduates exclusively in the United States, and we wanted to examine the strength of the relationship in this project. 

We hope that the analysis pursue in this project will give potential future observers and researchers a better understanding of the impact that the pursuit of high school education, and higher education, has on future income. Researchers will then be able to further analyze the extent to which higher education impacts future income, while other parties, such as the government, can take actions to substantially improve accessibility to higher education. 

Additionally, our research can further outline trends between the accessibility of education, income, and socioeconomic traits within Illinois counties; which can further provide insight as to how to provide support to communities to both government and charitable organizations. 

---

## 2) Research Question

**Primary Research Question:**  
How does county-level household income relate to high school graduation, dropout, and academic proficiency across Illinois?

**Secondary Research Questions:**  
- Does per-pupil expenditure mediate or moderate the relationship between income and outcomes?  
- Are relationships stronger for some subjects (ELA vs. Math vs. Science)?

---

## 3) Team

**Seungmin Cho:**  
- Finding the Dataset  
- Cleaning and Merging Dataset  
- Writing the Research Question, Timeline, and Constraints  

**William Tang:**  
- Finding the Dataset  
- Writing the Overview, Dataset, and Gaps  

---

## 4) Dataset
In our project we utilized two datasets:  

1. **Illinois Report Card (ISBE, 2023):**  
   - Contains graduation rate, dropout rate, Math/Reading/Science proficiency rates, etc.  
   - 104 rows and 8 features.  
   - Each row represents an Illinois county, and most rows have completed information regarding general socioeconomic and education information.  
   - Additional features include federal and state expenditures per pupil.  
   - This dataset provides a broad degree of information surrounding the wealth and resources available to students in each Illinois county and provides information related to that county’s general education performance.

2. **U.S. Census Bureau (2023):**  
   - Contains information on every county in the United States pertaining to median income.  
   - Merged with ISBE dataset by specified county.  

Using a dataset that contains median income is highly relevant to our research because it is a relatively good metric as to the level of wealth within a county, which is highly correlated with the outcomes of students who studied, graduated, and lived in the counties.

---

## 5) Timeline

### Week 1–2 → Team Formation
**Tasks:**
- Form a team of 2 members or request approval to work individually.  
- Create a Canvas group and GitHub repository.  
- Add all team members to the repo and submit URL to Canvas.

### Week 3–4 → Project Plan Development
**Tasks:**
- Collect/acquire at least two datasets from distinct trustworthy sources.  
- Document ethical, legal, and licensing constraints.  
- Begin basic profiling and metadata documentation.  
- Draft `ProjectPlan.md` in your repo with the following:
  - Overview and research question(s)
  - Roles and responsibilities
  - Two datasets identified (different sources/formats)
  - Timeline
  - Constraints and gaps

### Week 6–7 → Integration, Cleaning & Interim Report
**Tasks:**
- Integrate datasets using Python (Pandas) or SQL.  
- Perform data cleaning: missing values, outliers, syntax/semantic corrections.  
- Assess and document data quality results.  
- Update `StatusReport.md`:
  - Status updates on each task
  - Updated timeline and any changes from plan  
- Push repo updates, tag release as status-report.  
- **Deliverable:** Interim Status Report (~1000–1500 words).

### Week 8–9 → Analysis, Workflow Automation, Visualization
**Tasks:**
- Perform analysis and generate visualizations.  
- Build Snakemake or Run-All script for workflow automation.  
- Document data lineage and provenance.  
- Create or update metadata (data dictionary, codebook).  
- Ensure all ethical and reproducibility requirements are met.

### Week 10–11 → Final Project Submission
**Tasks:**
- Prepare final `README.md` (final report) containing:
  - Title, contributors
  - Summary, data profile, quality assessment
  - Findings & visualizations
  - Future work and reproducibility steps
  - References  
- Upload data to Box and link it in the README.  
- Push all artifacts (scripts, results, docs) to GitHub.  
- Tag release as final-project.

### Week 12 → Reflection & Wrap-Up
**Tasks:**
- Review grading rubric and feedback.  
- Prepare a short reflection (optional) summarizing lessons learned.  
- Ensure all contributions are properly documented for transparency.

---

## 6) Gaps
There are certainly a number of potential gaps within and outside of the dataset itself.  

- **Missing Data:**  
  There are a few rows with missing pieces of information. Though the pieces of missing data is usually not material, as only around 5 rows have 1 or 2 missing pieces of information each out of a dataset with 104 rows in total; the decreased information pertaining those specific counties may make any model that we create to put less emphasis on those counties relative to other counties.  

- **Population Movement Bias:**  
  A potentially more notable gap, however, relates to the predictiveness efficacy of the model pertaining to certain counties. Ultimately, a key goal of our research is to determine how the dropout and other educational/socioeconomic factors in a county play a role in the median wealth of that county. That said, more populous counties in Illinois, such as Cook County where Chicago is located, will typically have large populations from other Illinois counties/out of state living in them. Since those people will have an impact on the median income on highly populous counties without having been educated in them, this increases the risk of a skew.  

  That said, a factor that substantially mitigates this risk is the fact that, for most counties, the population that resides in that county was raised/received an education in that county; which means the information in the dataset will more heavily represent that population within the county. Furthermore, it would be substantially more difficult to take into account populations moving across different counties/states, so predicting the general relationship between education within a county and the effect it has on income would be most effectively implemented this way.

---

## 7) Constraints
Some of the constraints are:  

- **Aggregation bias:** Because data is being analyzed at a county level, patterns observed may not be applied to individual students.  
- **Missing data:** Some missing data will be imputed with justification.  
- **Cross-source inconsistency:** There could be limitations in compatibility because ISBE and ACS reference the same year (2023) but are from different data-generating processes. Thus, they are not from the same raw data which may introduce some inconsistencies during comparison.

---

## 8) References

- Illinois State Board of Education. *Illinois Report Card (2023).*  
  https://www.isbe.net/pages/illinois-state-report-card-data.aspx  

- U.S. Census Bureau. *American Community Survey (2023), Table S1903.*  
  https://api.census.gov/data/2023/acs/acs5/subject?get=NAME,S1903_C01_012E&for=county:*&in=state:17
