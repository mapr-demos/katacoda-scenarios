
There are typically two phases in machine learning:
* Data Discovery: The first phase involves analysis on historical data to build and train the machine learning model.
* Analytics Using the Model: The second phase uses the model in production on new data.

In production, models need to be continuously monitored and updated with new models when needed.
<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/TypicalMLphases.png?raw=true width=400 height=400">

In Step 1 of this HOL we will use Spark SQL for data discovery of the flights dataset stored on the MapR distributed file system. 

For each step of the HOL follow the instructions on the left frame before running the Zeppelin notebook code. After finishing the notebook, click on continue on the left frame, and follow the next instructions before running another notebook. 

***Wait about 5 minutes for Zeppelin to download and install. note this is temporary***

## Copying and working with Files on MapR XD
[MapR XD Distributed File and Object Store](https://mapr.com/products/mapr-xd/) is designed to support trillions of files, and combine analytics and operations into a single platform. MapR XD supports industry standard protocols and APIs, including POSIX, NFS, S3, and HDFS. It's easy to interact with MapR XD using traditional filesystem commands. This is possible because MapR XD is POSIX compliant, which means files and directories in MapR XD have all the characteristics you're accustomed to seeing in conventional filesystems. So, you can edit files, move files, change permissions, and so on all with traditional utilities like, `vi`, `mv`, `chmod`, etc. The ability to treat MapR XD like a conventional Unix filesystem and still benefit from features like exabyte-scale, multi-cloud mirroring, and failure recovery, means you can do things that are impossible with non-POSIX filesystems, like Hadoop, AWS S3, and Azure Blob Storage. 

Make a directory for data on MapR XD: `mkdir /mapr/demo.mapr.com/user/mapr/data`{{execute}}

Copy flight data file from the local Linux filesystem to MapR XD: `cp ~/flightdata2018.json.gz /mapr/demo.mapr.com/user/mapr/data`{{execute}}

Copy airports data file from the local Linux filesystem to MapR XD: `cp ~/airports.json /mapr/demo.mapr.com/user/mapr/data`{{execute}}

Unzip the flights data file on MapR XD:
`gunzip /mapr/demo.mapr.com/user/mapr/data/flightdata2018.json.gz`{{execute}}

Look at the end of the flights data file on MapR XD:
`tail /mapr/demo.mapr.com/user/mapr/data/flightdata2018.json`{{execute}}

## Using Apache Spark SQL to explore the flight dataset on MapR XD

<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/LoadData-Frame.png?raw=true width=500 height=500 ">

These lab exercises use Spark in Apache Zeppelin notebooks.
1. To run this exercise, click on the Zeppelin tab on the right.
2. This should take you to a Zeppelin page with a list of notebooks, if you do not see the list, click refresh.
3. Open the FlightDelay1SparkDatasets notebook. ✈️
4. Follow the Notebook lab instructions. Click on the READY > arrows in the notebook (on the right of the code paragraphs) to run the Spark code. 

## Summary After Running the Zeppelin Notebook
You have now learned how to load data into Spark Datasets and DataFrames and how to explore tabular data with Spark SQL. These code examples can be reused as the foundation to solve many types of business problems. 
Click continue before running the next notebook.



