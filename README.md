# Project: Can you recognize the emotion from an image of a face? 
<img src="figs/CE.jpg" alt="Compound Emotions" width="500"/>
(Image source: https://www.pnas.org/content/111/15/E1454)

### [Full Project Description](doc/project3_desc.md)

Term: Fall 2020

+ Project 3 Team 2
+ Team members
	+ Tianle Zhu 
	+ Zhenglei Chen 
	+ Mingzhi Zhang 
	+ Luyao Sun
	+ Mina Jiang 

+ **Project summary**: In this project, we created a classification engine for facial emotion recognition. We implemented a Gradient Boosting Machine (GBM) to train a baseline model on 3000 facial images with the extracted features to recognize the emotion from new facial images. Before the modeling, we did data preprocessing. Due to the fact that our data contains high dimensional features, we used Principal component analysis (PCA) to reduce the dimensional data by selecting the most important principal components that capture maximum information. Moreover, our data is imbalanced, so we tried the oversampling technique such as the weighted and smote method to deal with the issue. For the modeling, we tried several models(SVM, VGG16, KNN, Random Forest) and according to the accuracy, AUC score, training time, and testing time, we found SVM improve the baseline model the most. 
<img src="figs/predictiveprogram.png" width="500"/>

+ **Project Results**: The following table is our model results. 
  + Comparing to other models, XGB with smote model achieve the highest accuracy 81.33% and AUC score 0.818 in the testing data. Thus, we choose XGB with smote model as our advanced model.
<img src="figs/results.png" width="1000"/>

   

+ **Contribution statement**: ([default](doc/a_note_on_contributions.md)) All team members contribute to this project. All team members approve our work presented in this GitHub repository including this contributions statement. 
  + Tianle Zhu: implemented SVM models and VGG16 model. Improved the SVM model by adding PCA and weighted the imbalanced training data in the main_SVM.Rmd file. Fine-tune the VGG16 models by trying different hyper parameters in the VGG16 Model.ipynb. I also organized the github repository, debugged the code from Main.file and write the README files. Participated in every stage of the proejct's discussion.
  + Zhenglei Chen: developed baseline classification model GBM and presented project 3. Participated in every stage of the proejct's discussion.
  + Mingzhi Zhang: Implemented XGBoost model with different methods to deal with imbalanced training data, including re-weighting method and re-sampling method with SMOTE. Fine-tuned the XGBoost model using cross-validation. Prepared the code for the in-class testing. Participated in every stage of the proejct's discussion.
  + Luyao Sun: involved in every stage of the project's development and discussion, constructed Random Forest model, tuning the hyperparameter, cross validation and integrated the model into main_rf file.
  + Mina Jiang: developed the K Nearest Neighbors model and implemented related procedures such as cross validation for finding the best parameter and outputting the corresponding results. Contributed to analysis of the disadvantages of this model during the stage of presentation preparation. Paticipated in every discussion stage.

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
