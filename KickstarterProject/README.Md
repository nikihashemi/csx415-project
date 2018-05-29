README
----------

#### Date: 29-May-2018

Purpose: The purpose of this project is to predict which Kickstarter Projects will be 80 - 99 percent funded. 

Note: This project uses the Project Template format

Please use the following instructions to properly load and run this project:

    1. Read the Project Proposal in the "reports" to get a better understanding of the purpose of this project
    2. Set working directory to the KickstarterProject file
    3. Ensure that ProjectTemplate is installed, then run: load.project()
    4. Unbundle packrat
    3. Load gbm.fit.rda from "pkgs/model/data"
    4. Ensure the working directory is set to "KickstarterProject/data" folder
    5. Run score.R script located in "pkgs/model/R" folder
    6. The output will be a data frame with names of Kickstarter Projects that are predicted to be 80 - 99 percent funded
