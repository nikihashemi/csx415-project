### Assets List:  Updated 23-April-2018

#### This assets document will serve as a list of assets used during the Kickstarter Project. This list will include inputs, outputs, path to the file and a short description.

#### Inputs: data and code

    * Data: ks-projects-201612.csv and ks-projects-201801.csv in "data" folder. 
    * Exploratory Data Analysis (EDA): eda.R in "src" folder
    * Naive model: eda.R in "src" folder
    * Code for Linear Regression Models: LinearRegression.R in "src" folder
    * Code for Tree Models: Tree.R in "src" folder

#### Outputs: plots, visualizations
    
    * Frequency bar graphs: located in "graphs" folder
        * Train_Frequency_Category: bar graph of the 15 most popular project categories
        * Train_Frequency_Failed: bar graph of the 15 categories with the most failed projects
        * Train_Frequency_FilmVideo: bar graph of the film and videos subcategory
        * Train_Frequency_Music: bar graph of the music subcategory
        * Train_Frequency_State: bar graph of the state of the project (failed, successful, canceled, etc)
        * Train_Frequency_Successful: bar graph of the project categories that were most successful
        * Train_Frequency_Year: bar graph of the number of projects that had a deadline in each year
    * Histograms: located in "graphs" folder
        * Train_Histogram_Backers: histogram of the number of backers in the train dataset
        * Train_Histogram_LogBackers: histogram of log(backers) in the train dataset
        * Train_Histogram_Pledged: histogram of the pledged amount in the train dataset
        * Train_Histogram_LogPledged: histogram of the log(pledged) amount in the train dataset
    * Scatter plots: located in "graphs" folder
        * Train_Scatter_LogPledged_LogBackers: scatter plot with linear regression line of log(backers) vs. log(pledged)
    * Tree plots: located in "graphs" folder
        * Train_RegressionTree: regression tree diagram with number pledged as the response variable
        * Train_classTree: class tree diagram with the state as the response variable
    
    
#### Documentation

    * Model Evaluations (R Markdown Documents): located in "model performance" folder
        * model-performance-rpart
        * model-performance-linear
    * Overall Project Performance: csx415-projects folder
    * Project Proposal (Formal Problem Statement): csx415-projects folder
    

