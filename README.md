# LOG6307_Replica_Project

1. To clone all the repos, we execute the script clone_git_repo_X.sh. To speed things up, we exectue all the scripts in parallel using this command

    find . -name "clone_git_repo_?.sh" -print0 | xargs -0 -n 1 -P 5 bash

    where P indicates the parallelism degree

2. Once we have cloned the repos, we will use the count_Iac_files_per_dir.sh and count_puppet_files.sh scripts to calculate the ratios
of the puppet files in the repo and print only those whose ratios are at least 11%. We execute the 2 scripts this way

    ./count_Iac_files_per_dir.sh ./Mirantis count_puppet_files.sh

3. Next, after getting the repos candidates, we will exacute git_log_branches.sh to get the commits and their commit dates.
We will export the results to a csv file.

4. We will run repo_mining.ipynb notebook against the csv file to extract only the repos that have at least 2 commits per month.
At the end we get another list that we will use in the next step.

5. We run git_log_pp_commits.sh to only retrieve messages from commits that affected puppet files.

6. We run also gh_repo_issue.sh to list the issues of the repo candidates

7. The feature_importance.ipynb notebook is used to compute the feature importance of each identified property provided by the Random
Forest-based prediction model.

8. The scott_knott_ft_Imp.ipynb notebook (in R) is used to apply the Scott–Knott test to statistically identify which properties have greater feature importance.

9. The pca_analysis.ipynb notebook is used to apply Principal Component Analysis (PCA) to reduce dimensionality.

10. In ml_models.ipynb notebook,  we use 5 ML algorithms to construct defect prediction models: Logistic Regression, CART, Naive Bayes, KNN and Random Forest.

11. In scott_knott_ml.ipynb notebook (in R), we apply the scott_knott test to compare prediction performance measures: precision, recall, AUC, and F-measure.
