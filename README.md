# sparkdiff <event log 1> <event log 2>
A rudimentary command line utility for contrasting Apache Spark event logs.

## Motivation
I have been troubleshooting Apache Spark application issues full-time since around 2015. When a spark application slows down or stops working, I try to find out more information such as: Did the inputs change? Did the configuration change?

Spark logs from two runs of the same application cannot be contrasted using a general purpose diff tool as there would be thousands of changes detected which are not useful for troubleshooting.

I have decided to automate this part my job function in the form of a bash script which examines spark logs and identifies differences which I find useful when troubleshooting spark application performance and functionality problems. 
  
## Description
sparkdiff is a Linux command line utility which contrasts spark logs from two runs of a spark application and displays log entries which both, have changed; and that I find helpful when troubleshooting spark application performance and/or functionality problems.

For example, if a spark application has been running without problems for years and then suddenly slows down or stops working, then I will pass in the logs from both a known working run as well as the logs from the run which had problems. With a little luck, the sparkdiff output helps guide me towards the root cause and solution.

## Online Installation w/ CI
```console

mkdir ~/bin
chmod u+rx ~/bin
wget -O ~/bin/sparkdiff https://github.com/darule0/sparkdiff/blob/main/sparkdiff?raw=true
chmod u+rx ~/bin/sparkdiff

```



## Offline Installation w/o CI
```console

sudo mkdir /opt/sparkdiff
sudo chmod o+rx /opt/sparkdiff
sudo git clone https://github.com/darule0/sparkdiff.git /opt/sparkdiff
sudo chmod o+rx /opt/sparkdiff/sparkdiff.sh
sudo ln -s /opt/sparkdiff/sparkdiff.sh /usr/bin/sparkdiff

```

## How to obtain event logs for a spark application run?
Each time a spark applicaiton is run, the console output will include an application id.
The application id can be used to locate the event logs in HDFS. In spark configuration,
spark.eventLog.dir will specify where in HDFS event logs are stored.
```console
hdfs dfs -get /user/spark/applicationHistory/*<application id>*
```

## Tutorial
```console

# install sparkdiff w/ CI
mkdir ~/bin
chmod u+rx ~/bin
wget -O ~/bin/sparkdiff https://github.com/darule0/sparkdiff/blob/main/sparkdiff?raw=true
chmod u+rx ~/bin/sparkdiff

# display sparkdiff usage
sparkdiff

# contrast event logs from a two runs of the same spark application
sparkdiff event_log_1 event_log_2

```


![alt text](https://raw.githubusercontent.com/darule0/sparkdiff/main/sparkdiff.png)


## Directories Used
| directory | purpose |
| :--- | :--- |
| $HOME/.sparkdiff.dd4b66ed-a43d-48ec-8e32-1b901bc8ea8e | The latest sparkdiff is automatically downlaoded here when Online Installation w/ CI. |
| $HOME/.sparkdiff | Intermediate data for sparkdiff processing. |

## Event Log Parsing Logic
| array configurations which may be considered - all occurrences |
| :--- |
| App Attempt ID |

| scalar configurations which may be considered - first occurrence |
| :--- |
| Java Home |
| Java Version |
| Scala Version |
| Maximum Onheap Memory |
| spark.acls.enable |
| spark.app.id |
| spark.app.name |
| spark.blacklist.application.maxFailedExecutorsPerNode |
| spark.blacklist.application.maxFailedTasksPerExecutor |
| spark.blacklist.enabled |
| spark.blacklist.killBlacklistedExecutors |
| spark.blacklist.stage.maxFailedExecutorsPerNode |
| spark.blacklist.stage.maxFailedTasksPerExecutor |
| spark.blacklist.task.maxTaskAttemptsPerExecutor |
| spark.blacklist.task.maxTaskAttemptsPerNode |
| spark.blacklist.timeout |
| spark.driver.extraJavaOptions |
| spark.driver.extraLibraryPath |
| spark.driver.maxResultSize |
| spark.driver.memory |
| spark.dynamicAllocation.enabled |
| spark.dynamicAllocation.maxExecutors |
| spark.eventLog.dir |
| spark.eventLog.enabled |
| spark.executor.cores |
| spark.executor.extraJavaOptions |
| spark.executor.extraLibraryPath |
| spark.executor.heartbeatInterval |
| spark.executor.id |
| spark.yarn.executor.memoryOverhead |
| spark.yarn.driver.memoryOverhead |
| spark.yarn.am.memoryOverhead |
| spark.executor.instances |
| spark.dynamicAllocation.minExecutors |
| spark.dynamicAllocation.initialExecutors |
| spark.dynamicAllocation.schedulerBacklogTimeout |
| spark.yarn.scheduler.heartbeat.interval-ms |
| spark.streaming.backpressure.enabled |
| spark.streaming.blockInterval |
| spark.streaming.backpressure.initialRate |
| spark.streaming.receiver.maxRate |
| spark.streaming.kafka.maxRatePerPartition |
| spark.executor.memory |
| spark.executorEnv.HADOOP_NODE_JDK_HOME |
| spark.executorEnv.IFCONTENTMASTER_HOME |
| spark.executorEnv.IMF_CPP_RESOURCE_PATH |
| spark.executorEnv.INFA_HADOOP_DIST_DIR |
| spark.executorEnv.INFA_JAVA_BIN |
| spark.executorEnv.INFA_MAPRED_OSGI_CONFIG |
| eclipse.stateSaveDelayInterval |
| spark.executorEnv.INFA_PLUGINS_HOME |
| spark.executorEnv.INFA_RESOURCES |
| spark.executorEnv.INFA_RESOURCES |
| spark.executorEnv.JAVA_HOME |
| spark.executorEnv.LD_LIBRARY_PATH |
| spark.executorEnv.NLS_LANG |
| spark.executorEnv.ODBCINI |
| spark.executorEnv.ODBC_HOME |
| spark.executorEnv.ORACLE_HOME |
| spark.executorEnv.PATH |
| spark.executorEnv.TNS_ADMIN |
| spark.executorEnv.USE_DISTINCT_OSGI_DIR_PER_PROXY_USER |
| spark.hadoop.avro.mapred.ignore.inputs.without.extension |
| spark.hadoop.fs.file.impl.disable.cache |
| spark.hadoop.fs.hdfs.impl.disable.cache |
| spark.hadoop.fs.s3.impl.disable.cache |
| spark.hadoop.fs.s3a.impl.disable.cache |
| spark.hadoop.fs.s3n.impl.disable.cache |
| spark.hbase.connector.security.credentials.enabled |
| spark.infa.context.taskname |
| spark.infa.jobrecoveryenabled |
| spark.infa.port |
| spark.kryoserializer.buffer.max |
| spark.master |
| spark.network.timeout |
| spark.org.apache.hadoop.yarn.server.webproxy.amfilter.AmIpFilter.param.PROXY_HOSTS |
| spark.org.apache.hadoop.yarn.server.webproxy.amfilter.AmIpFilter.param.RM_HA_URLS |
| spark.scheduler.maxRegisteredResourcesWaitingTime |
| spark.scheduler.minRegisteredResourcesRatio |
| spark.scheduler.mode |
| spark.serializer |
| spark.shuffle.consolidateFiles |
| spark.shuffle.service.enabled |
| spark.shuffle.service.port |
| spark.sql.autoBroadcastJoinThreshold |
| spark.sql.broadcastTimeout |
| spark.sql.catalogImplementation |
| spark.sql.constraintPropagation.enabled |
| spark.sql.crossJoin.enabled |
| spark.sql.hive.metastore.sharedPrefixes |
| spark.sql.retainGroupColumns |
| spark.sql.shuffle.partitions |
| spark.sql.statistics.fallBackToHdfs |
| spark.sql.statistics.partitionPruner |
| spark.submit.deployMode |
| spark.ui.filters |
| spark.ui.port |
| spark.ui.view.acls.groups |
| spark.yarn.appMasterEnv.HADOOP_NODE_JDK_HOME |
| spark.yarn.appMasterEnv.IFCONTENTMASTER_HOME |
| spark.yarn.appMasterEnv.IMF_CPP_RESOURCE_PATH |
| spark.yarn.appMasterEnv.INFA_HADOOP_DIST_DIR |
| spark.yarn.appMasterEnv.INFA_HADOOP_SPARK_LIB |
| spark.yarn.appMasterEnv.INFA_HOME |
| spark.yarn.appMasterEnv.INFA_JAVA_BIN |
| spark.yarn.appMasterEnv.INFA_MAPRED_OSGI_CONFIG |
| spark.yarn.appMasterEnv.INFA_PLUGINS_HOME |
| spark.yarn.appMasterEnv.INFA_RESOURCES |
| spark.yarn.appMasterEnv.INFA_SPARK_APP_CLASS_NAME |
| spark.yarn.appMasterEnv.INFA_SPARK_CACHE_LIFETIME |
| spark.yarn.appMasterEnv.INFA_SPARK_CACHE_SIZE |
| spark.yarn.appMasterEnv.INFA_SPARK_DIST_LIB |
| spark.yarn.appMasterEnv.INFA_SPARK_ENABLE_HIVE |
| spark.yarn.appMasterEnv.INFA_SPARK_SCALA_VERSION |
| spark.yarn.appMasterEnv.JAVA_HOME |
| spark.yarn.appMasterEnv.NLS_LANG |
| spark.yarn.appMasterEnv.ODBCINI |
| spark.yarn.appMasterEnv.ODBC_HOME |
| spark.yarn.appMasterEnv.ORACLE_HOME |
| spark.yarn.appMasterEnv.TNS_ADMIN |
| spark.yarn.appMasterEnv.USE_DISTINCT_OSGI_DIR_PER_PROXY_USER |
| spark.yarn.principal |
| spark.yarn.maxAppAttempts |
| spark.yarn.proxy-user |
| spark.yarn.queue |
| spark.yarn.security.credentials.hbase.enabled |
| spark.yarn.security.tokens.hbase.enabled |
| spark.yarn.stagingDir |
| spark.yarn.submit.waitAppCompletion |
| awt.toolkit |
| file.encoding |
| file.encoding.pkg |
| file.separator |
| java.awt.graphicsenv |
| java.awt.printerjob |
| java.class.version |
| java.endorsed.dirs |
| java.ext.dirs |
| java.home |
| java.runtime.name |
| java.runtime.version |
| java.security.egd |
| java.specification.name |
| java.specification.vendor |
| java.specification.version |
| java.vendor |
| java.vendor.url |
| java.vendor.url.bug |
| java.version |
| java.vm.info |
| java.vm.name |
| java.vm.specification.name |
| java.vm.specification.vendor |
| java.vm.specification.version |
| java.vm.vendor |
| java.vm.version |
| jceks.key.serialFilter |
| jetty.git.hash |
| line.separator |
| log4j.configuration |
| os.arch |
| os.name |
| os.version |
| path.separator |
| sun.arch.data.model |
| sun.boot.library.path |
| sun.cpu.endian |
| sun.cpu.isalist |
| sun.io.unicode.encoding |
| sun.java.launcher |
| sun.jnu.encoding |
| sun.management.compiler |
| sun.nio.ch.bugLevel |
| sun.os.patch.level |
| user.country |
| user.home |
| user.language |
| user.name |
| user.timezone |

| array configurations wich may be md5hash considered - first occurrence |
| :--- |
| spark.yarn.appMasterEnv.INFA_MAPRED_CLASSPATH |
| spark.yarn.appMasterEnv.LD_LIBRARY_PATH |
| spark.yarn.appMasterEnv.PATH |
| java.library.path |
| sun.boot.class.path |

| array configurations wich may be tokenized and considered - first occurrence |
| :--- |
| spark.executor.extraClassPath |
| spark.driver.extraClassPath |

| inputs which may be considered - all occurrence summed |
| :--- |
| scrap = Last 159 characters of events that contain Input Metrics |
| Input Metrics scrap -> Bytes Read -> BytesRead.integer |
| Input Metrics scrap -> Bytes Read -> BytesRead.iec (human readable) |
| Input Metrics scrap -> Records Read -> RecordsRead.integer |

| configurations which may be excluded |
| :--- |
| spark.driver.host |
| spark.driver.port |
| spark.executorEnv.SESS_TEMP_WORKING_DIR |
| spark.infa.context.executionid |
| spark.infa.context.wfrunid |
| spark.infa.host |
| spark.org.apache.hadoop.yarn.server.webproxy.amfilter.AmIpFilter.param.PROXY_URI_BASES |
| spark.yarn.app.container.log.dir |
| spark.yarn.app.id |
| spark.yarn.appMasterEnv.SESS_TEMP_WORKING_DIR |
| spark.yarn.dist.archives |
| spark.yarn.dist.files |
| spark.yarn.keytab |
| java.io.tmpdir |
| sun.java.command |
| user.dir |


