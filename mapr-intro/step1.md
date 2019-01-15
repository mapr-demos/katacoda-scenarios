The MapR data platform consists of the following three core components:

1. [MapR XD Distributed File and Object Store](https://mapr.com/products/mapr-xd/)
2. [MapR Database](https://mapr.com/products/mapr-db/)
3. [MapR Event Store for Apache Kafka](https://mapr.com/products/mapr-streams/)

In this tutorial you will explore each of these components on a single-node MapR cluster.

<p align="center"><img src="https://github.com/mapr-demos/katacoda-scenarios/blob/master/mapr-intro/assets/mapr_logo.png?raw=true" width=40%></p>

Before you begin you need to authenticate. Run the following command to login: 

`maprlogin password -user mapr`{{execute}} 

Use password `mapr`{{execute}}.

Verify that you've authenticated by running the following [maprcli](https://mapr.com/docs/61/ReferenceGuide/maprcli-REST-API-Syntax.html) command: `maprcli node list -columns ip`{{execute}}. 

MapR can also be administered using the `maprcli` command or with a web interface known as the MapR Control System (MCS). [Click here to open MCS](https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/), and login with these credentials:

Username: `mapr`

Password: `mapr`

When you're finished exploring MCS, return to the Terminal tab and click the Continue button.

