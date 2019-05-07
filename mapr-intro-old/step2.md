
[MapR XD Distributed File and Object Store](https://mapr.com/products/mapr-xd/) is what you get when you take the best parts of Hadoop and put it in a package that looks and acts like a traditional ***POSIX compliant*** filesystem. 

The ability to treat MapR XD like a conventional Unix filesystem and still benefit from features like exabyte-scale, multi-cloud mirroring, and failure recovery, means you can do things that are impossible with non-POSIX filesystems, like Hadoop, AWS S3, and Azure Blob Storage. ***POSIX compliance is what makes MapR XD the "killer app" in the minds of many information managers.***

## Working with Files

You can access MapR XD using the [HDFS protocol](https://mapr.com/docs/61/AdministratorGuide/hdfs.html). Give it a try! Copy a file into MapR XD using HDFS, like this: `hadoop fs -put yelp_academic_dataset_business.json /tmp`{{execute}}

List the file you created. `hadoop fs -ls /tmp`{{execute}}

Although you *can* use the `hadoop` command for file operations, it's much easier to interact with MapR XD using traditional filesystem commands instead. This is possible because MapR XD is POSIX compliant, which means files and directories in MapR XD have all the characteristics you're accustomed to seeing in conventional filesystems. So, you can edit files, move files, change permissions, and so on all with traditional utilities like, `vi`, `mv`, `chmod`, etc. Try it!

Copy a file from the local Linux filesystem to MapR XD: `cp ~/yelp_academic_dataset_tip.json /mapr/demo.mapr.com/tmp`{{execute}}

List the files you copied: `ls -l /mapr/demo.mapr.com/tmp`{{execute}} 

Change permissions of a file: `chmod 600 /mapr/demo.mapr.com/tmp/yelp_academic_dataset_business.json`{{execute}}

View the new permissions: `ls -l /mapr/demo.mapr.com/tmp/`{{execute}}

## Real File Semantics

Files can be edited. For example, replace "Hofbräu" with "Hofbrau" using an in-place substitution: `sed -i.bak 's/Hofbrau/Hofbräu/g' /mapr/demo.mapr.com/tmp/yelp_academic_dataset_business.json`{{execute}}

Files have regular attributes: `stat /mapr/demo.mapr.com/tmp/yelp_academic_dataset_business.json`{{execute}}

File changes can also be seen in real time. Try continuously changing a file, like this: `while true; do date; sleep 1; done > /mapr/demo.mapr.com/tmp/timestamps`{{execute}}

Then tail that file in another terminal to see those changes in real time. `tail -f /mapr/demo.mapr.com/tmp/timestamps`{{execute T2}}

Press <kbd>Ctrl</kbd>+<kbd>C</kbd> to stop the while loop. `echo "Ctrl+C"`{{execute interrupt}}

Press <kbd>Ctrl</kbd>+<kbd>C</kbd> to stop the tail. `echo "Ctrl+C"`{{execute interrupt T2}}

## MapR XD vs. Hadoop

MapR XD is often confused with the Hadoop Distributed File System (HDFS) but MapR XD does so much more! 

* MapR XD is a fully readable/writable file system that allows applications to concurrently read/write directly to disk. Contrast this with HDFS which restricts applications to append-only writes and limits data to be read only from closed files. 
* HDFS is also layered on top of the Linux filesystem and Java. As a result, HDFS suffers increased I/O overhead and delays due to garbage collection. MapR XD is implemented in C++ and runs without depending on other filesystems or NameNodes, thus making MapR XD far more performant and robust than HDFS.
* MapR XD enables administrators to control attributes such as quotas, data locality, and user permissions across logical groups of files called data volumes. 
* MapR XD operates on the concept of a ***global namespace***, which gives users a unified view of files and objects across the globe without having to be aware of the physical location that data.
* MapR XD exposes NFS and POSIX interfaces so data can be brought in from a diverse set of applications, including legacy ones, at high speed.
