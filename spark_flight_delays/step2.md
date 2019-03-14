In Step 2 of this HOL we will use Spark Machine Learning on historical flight data to train a machine learning model to predict flight delays, and store this model on the MapR distributed file system for use in the next step (Note you can not do Step 3 without storing the model). 

<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/TypicalMLphases.png?raw=true width=400 height=400">

Spark ML provides a uniform set of high-level APIs, built on top of DataFrames. Having ML APIs built on top of DataFrames provides the scalability of partitioned data processing with the ease of SQL for data manipulation. We will use transformers to get a DataFrame with a features vector column. We will use an estimator to train a model, which can transform input data to get predictions.
<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/LoadDataTransforms.png?raw=true width=400 height=400">

We will use an ML Pipeline to pass the data through transformers in order to extract the features and an estimator to produce the model.
<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/Pipeline.png?raw=true width=400 height=400">

We will fit or train the ML pipeline on training Data, this returns a pipeline model which we will evaluate with test data. Finally we will store the pipeline model on the MapR XD distributed file store for use in the next step.

<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/pipelinefittest.png?raw=true width=400 height=400">

## Using Apache Spark Machine Learning Notebook 
1. To run this exercise, click on the black Zeppelin tab on the right, scroll to the top, click on the blue Zeppelin icon. 
2. This should take you to a Zeppelin page with a list of notebooks.
3. Open and the FlightDelay2SparkMachineLearning notebook. ✈️
4. Follow the Notebook lab instructions. Click on the READY > arrows to run the Spark code paragraphs. 

## Summary
Apache Spark provides an excellent framework for building solutions to business problems that can extract value from massive, distributed datasets. Machine learning algorithms cannot answer all questions perfectly. But they do provide evidence for humans to consider when interpreting results, assuming the right question is asked in the first place. In this example, we could get better flight delay predictions with more timely information, such as weather,  holidays, incoming flight delays, carrier, airplane and airport problems.

Click continue before running the next notebook.









