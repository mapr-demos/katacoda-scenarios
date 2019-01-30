The MapR data platform is a single system that allows you to access data using three distinct ways.
You can store data in conventional files, as message streams or as noSQL tables. All of your data is
arranged in directories and sub-directories just like in a conventional file system and all are subject
to consistent controls on who can see, access or update what.

You can learn more by looking at these following links:

1. [MapR XD Distributed File and Object Store](https://mapr.com/products/mapr-xd/)
2. [MapR Database](https://mapr.com/products/mapr-db/)
3. [MapR Event Store for Apache Kafka](https://mapr.com/products/mapr-streams/)

In this tutorial you will explore each way to store and access data on a single-node MapR cluster.

<p align="center"><img src="https://github.com/mapr-demos/katacoda-scenarios/blob/master/mapr-intro/assets/mapr_logo.png?raw=true" width=40%></p>

Before you begin you need to tell the system who you are. Run the following command to login: 

`maprlogin password -user mapr`{{execute}} 

This is a toy cluster that won't last long, so you can use the password `mapr`{{execute}}. In a real cluster you would authenticate using Kerberos granted credentials or using a realistically complex password.

Verify that you've authenticated yourself to the cluster by running the following [maprcli](https://mapr.com/docs/61/ReferenceGuide/maprcli-REST-API-Syntax.html) command: `maprcli node list -columns ip`{{execute}}. 

MapR can be administered using the `maprcli` command (like we just did) or with a web interface known as the MapR Control System (MCS). [Click here to open MCS](https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/), and login with these credentials:

Username: `mapr`

Password: `mapr`

When you're finished exploring MCS, return to the Terminal tab and click the Continue button.

