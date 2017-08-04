# MVPA-Light
Lightweight Matlab toolbox for multivariate pattern analysis (MVPA)

# Installation
Download the toolbox and unzip it in your desired directory or (better) check it out using Git. In Matlab, you can add the MVPA-Light folder and all its subfolders to the Matlab path using

addpath(genpath('my-path-to/MVPA-Light/'))

The Git repository is split into two branches, the master branch (recommended for use) and the devel branch (not recommended for use). The latter is the development branch that contains new features that are either under construction or not tested. In contrast, the master branch is the stable branch that should always work - if it does not, there's a bug so please report it.

# Overview
MVPA-Light is meant to be a light-weight multivariate pattern analysis (MVPA) toolbox in Matlab, with a focus on the multivariate classification of ERPs/ERFs and oscillations. Rather than solving all decoding problems, it focuses on a few issues such as time generalisation while maintaining a code base that is hopefully well-documented and easily comprehensible.

For Fieldtrip users, the use of the toolbox will be familiar: The first argument to the main functions is a configuration struct that contains all the parameters. However, MVPA-Light does not require or use Fieldtrip, so it is compatible with other toolboxes as well. 

Classifiers can be trained and tested directly using the train_* and test_* functions. However, for classification across time and time generalisation, dedicated functions should be used instead. Cross-validation and data resampling methods are implemented in these functions.

# Classifiers

### take from wiki page and then extend here


# testing and training 

A classifier is the main workhorse of MVPA. Its task is to take input data such as EEG activity, called 'features' in machine learning, and predict the class label ... 


however, in order to learn ... 
The process of tuning a classifier to do its job by exposing it to data is knowed as 'training'. During training, the classifier learns which features are important and which are not.

For more details (on LDA), see [1] --- Blankertz et al

Linear Discriminant Analysis (LDA) (equivalent to Fisher's Discriminant Analysis for two classes), linear support vector machines (SVM), and logistic regression, are all linear classifiers that perform classification by means of a linear hyperplane. The only ...
As a rule of thumb, ... 

# Cross-validation/Resampling methods

a complex classifier (such as kernel SVM) can easily learn to perfectly discriminate a specific dataset. However, the same classifier will perform very poorly when applied to a new dataset, called D2. The reason is that the classifier has not learnt ... Instead, it has overadapted to the 


complex methods tend to overfit the data ... 

...
To get a realistic estimate of the classifier performance, a classifier should be applied to a new dataset that has not been used for learning.


# Classification across time
In many EEG/MEG experiments, data is split into epochs representing individual trials. 
 has a trial structure ... 


* Classification across time (mv_classify_across_time): 

* Time x time generalisation (mv_classify_timextime)

* Time x time generalisation using two datasets (mv_classify_timextime_two_datasets): 



# Time x time generalisation






