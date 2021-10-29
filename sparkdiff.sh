#!/bin/bash

# 
# For documentation and license see https://github.com/darule0/sparkdiff/
# 

if [ $# -lt 2 ]; then
    echo "Usage: sparkdiff <spark event log 1> <spark event log 2>"
    exit 1
fi

sparkconf () {
  event_file=$1
  cat $event_file | tr ',' '\n' | grep "Java Home" | head -1
  cat $event_file | tr ',' '\n' | grep "Java Version" | head -1
  cat $event_file | tr ',' '\n' | grep "Scala Version" | head -1
  cat $event_file | tr ',' '\n' | grep  "App Attempt ID" # head -1
  cat $event_file | tr ',' '\n' | grep  "Maximum Onheap Memory" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.acls.enable" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.app.id" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.app.name" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.blacklist.application.maxFailedExecutorsPerNode" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.blacklist.application.maxFailedTasksPerExecutor" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.blacklist.enabled" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.blacklist.killBlacklistedExecutors" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.blacklist.stage.maxFailedExecutorsPerNode" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.blacklist.stage.maxFailedTasksPerExecutor" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.blacklist.task.maxTaskAttemptsPerExecutor" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.blacklist.task.maxTaskAttemptsPerNode" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.blacklist.timeout" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.driver.extraJavaOptions" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.driver.extraLibraryPath" | head -1
  # cat $event_file | tr ',' '\n' | grep  "spark.driver.host" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.driver.maxResultSize" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.driver.memory" | head -1
  # cat $event_file | tr ',' '\n' | grep  "spark.driver.port" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.dynamicAllocation.enabled" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.dynamicAllocation.maxExecutors" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.eventLog.dir" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.eventLog.enabled" | head -1
  echo '"md5sum(spark.executor.extraClassPath)":"'`cat $event_file | tr ',' '\n' | grep  "spark.executor.extraClassPath" | head -1 | md5sum`'"'
  cat $event_file | tr ',' '\n' | grep  "spark.executor.cores" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executor.extraJavaOptions" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executor.extraLibraryPath" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executor.heartbeatInterval" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executor.id" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.executor.memoryOverhead" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.driver.memoryOverhead" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.am.memoryOverhead" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executor.instances" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.dynamicAllocation.minExecutors" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.dynamicAllocation.initialExecutors" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.dynamicAllocation.schedulerBacklogTimeout" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.scheduler.heartbeat.interval-ms" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.streaming.backpressure.enabled" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.streaming.blockInterval" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.streaming.backpressure.initialRate" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.streaming.receiver.maxRate" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.streaming.kafka.maxRatePerPartition" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executor.memory" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.HADOOP_NODE_JDK_HOME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.IFCONTENTMASTER_HOME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.IMF_CPP_RESOURCE_PATH" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.INFA_HADOOP_DIST_DIR" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.INFA_HADOOP_DIST_DIR" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.INFA_HADOOP_DIST_DIR" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.INFA_JAVA_BIN" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.INFA_MAPRED_OSGI_CONFIG" | head -1
  cat $event_file | tr ',' '\n' | grep  "eclipse.stateSaveDelayInterval" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.INFA_PLUGINS_HOME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.INFA_RESOURCES" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.INFA_RESOURCES" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.JAVA_HOME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.LD_LIBRARY_PATH" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.NLS_LANG" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.ODBCINI" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.ODBC_HOME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.ORACLE_HOME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.PATH" | head -1
  # cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.SESS_TEMP_WORKING_DIR" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.TNS_ADMIN" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.executorEnv.USE_DISTINCT_OSGI_DIR_PER_PROXY_USER" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.hadoop.avro.mapred.ignore.inputs.without.extension" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.hadoop.fs.file.impl.disable.cache" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.hadoop.fs.hdfs.impl.disable.cache" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.hadoop.fs.s3.impl.disable.cache" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.hadoop.fs.s3a.impl.disable.cache" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.hadoop.fs.s3n.impl.disable.cache" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.hbase.connector.security.credentials.enabled" | head -1
  # cat $event_file | tr ',' '\n' | grep  "spark.infa.context.executionid" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.infa.context.taskname" | head -1
  # cat $event_file | tr ',' '\n' | grep  "spark.infa.context.wfrunid" | head -1
  # cat $event_file | tr ',' '\n' | grep  "spark.infa.host" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.infa.jobrecoveryenabled" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.infa.port" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.kryoserializer.buffer.max" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.master" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.network.timeout" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.org.apache.hadoop.yarn.server.webproxy.amfilter.AmIpFilter.param.PROXY_HOSTS" | head -1
  # cat $event_file | tr ',' '\n' | grep  "spark.org.apache.hadoop.yarn.server.webproxy.amfilter.AmIpFilter.param.PROXY_URI_BASES" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.org.apache.hadoop.yarn.server.webproxy.amfilter.AmIpFilter.param.RM_HA_URLS" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.scheduler.maxRegisteredResourcesWaitingTime" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.scheduler.minRegisteredResourcesRatio" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.scheduler.mode" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.serializer" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.shuffle.consolidateFiles" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.shuffle.service.enabled" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.shuffle.service.port" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.sql.autoBroadcastJoinThreshold" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.sql.broadcastTimeout" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.sql.catalogImplementation" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.sql.constraintPropagation.enabled" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.sql.crossJoin.enabled" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.sql.hive.metastore.sharedPrefixes" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.sql.retainGroupColumns" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.sql.shuffle.partitions" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.sql.statistics.fallBackToHdfs" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.sql.statistics.partitionPruner" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.submit.deployMode" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.ui.filters" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.ui.port" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.ui.view.acls.groups" | head -1
  # cat $event_file | tr ',' '\n' | grep  "spark.yarn.app.container.log.dir" | head -1
  # cat $event_file | tr ',' '\n' | grep  "spark.yarn.app.id" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.HADOOP_NODE_JDK_HOME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.IFCONTENTMASTER_HOME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.IMF_CPP_RESOURCE_PATH" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_HADOOP_DIST_DIR" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_HADOOP_SPARK_LIB" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_HOME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_JAVA_BIN" | head -1
  echo '"md5sum(spark.yarn.appMasterEnv.INFA_MAPRED_CLASSPATH)":"'`cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_MAPRED_CLASSPATH" | head -1 | md5sum`'"'
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_MAPRED_OSGI_CONFIG" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_PLUGINS_HOME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_RESOURCES" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_SPARK_APP_CLASS_NAME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_SPARK_CACHE_LIFETIME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_SPARK_CACHE_SIZE" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_SPARK_DIST_LIB" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_SPARK_ENABLE_HIVE" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.INFA_SPARK_SCALA_VERSION" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.JAVA_HOME" | head -1
  echo '"md5sum(spark.yarn.appMasterEnv.LD_LIBRARY_PATH)":"'`cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.LD_LIBRARY_PATH" | head -1 | md5sum`'"'
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.NLS_LANG" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.ODBCINI" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.ODBC_HOME" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.ORACLE_HOME" | head -1
  echo '"md5sum(spark.yarn.appMasterEnv.PATH)":"'`cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.PATH" | head -1 | md5sum`'"'
  # cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.SESS_TEMP_WORKING_DIR" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.TNS_ADMIN" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.appMasterEnv.USE_DISTINCT_OSGI_DIR_PER_PROXY_USER" | head -1
  # cat $event_file | tr ',' '\n' | grep  "spark.yarn.dist.archives" | head -1
  # cat $event_file | tr ',' '\n' | grep  "spark.yarn.dist.files" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.principal" | head -1
  # cat $event_file | tr ',' '\n' | grep  "spark.yarn.keytab" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.maxAppAttempts" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.proxy-user" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.queue" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.security.credentials.hbase.enabled" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.security.tokens.hbase.enabled" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.stagingDir" | head -1
  cat $event_file | tr ',' '\n' | grep  "spark.yarn.submit.waitAppCompletion" | head -1
  cat $event_file | tr ',' '\n' | grep  "awt.toolkit" | head -1
  cat $event_file | tr ',' '\n' | grep  "file.encoding" | head -1
  cat $event_file | tr ',' '\n' | grep  "file.encoding.pkg" | head -1
  cat $event_file | tr ',' '\n' | grep  "file.separator" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.awt.graphicsenv" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.awt.printerjob" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.class.version" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.endorsed.dirs" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.ext.dirs" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.home" | head -1
  # cat $event_file | tr ',' '\n' | grep  "java.io.tmpdir" | head -1
  echo '"md5sum(java.library.path)":"'`cat $event_file | tr ',' '\n' | grep  "java.library.path" | head -1 | md5sum`'"'
  cat $event_file | tr ',' '\n' | grep  "java.runtime.name" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.runtime.version" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.security.egd" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.specification.name" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.specification.vendor" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.specification.version" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.vendor" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.vendor.url" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.vendor.url.bug" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.version" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.vm.info" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.vm.name" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.vm.specification.name" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.vm.specification.vendor" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.vm.specification.version" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.vm.vendor" | head -1
  cat $event_file | tr ',' '\n' | grep  "java.vm.version" | head -1
  cat $event_file | tr ',' '\n' | grep  "jceks.key.serialFilter" | head -1
  cat $event_file | tr ',' '\n' | grep  "jetty.git.hash" | head -1
  cat $event_file | tr ',' '\n' | grep  "line.separator" | head -1
  cat $event_file | tr ',' '\n' | grep  "log4j.configuration" | head -1
  cat $event_file | tr ',' '\n' | grep  "os.arch" | head -1
  cat $event_file | tr ',' '\n' | grep  "os.name" | head -1
  cat $event_file | tr ',' '\n' | grep  "os.version" | head -1
  cat $event_file | tr ',' '\n' | grep  "path.separator" | head -1
  cat $event_file | tr ',' '\n' | grep  "sun.arch.data.model" | head -1
  echo '"md5sum(sun.boot.class.path)":"'`cat $event_file | tr ',' '\n' | grep  "java.library.path" | head -1 | md5sum`'"'
  cat $event_file | tr ',' '\n' | grep  "sun.boot.library.path" | head -1
  cat $event_file | tr ',' '\n' | grep  "sun.cpu.endian" | head -1
  cat $event_file | tr ',' '\n' | grep  "sun.cpu.isalist" | head -1
  cat $event_file | tr ',' '\n' | grep  "sun.io.unicode.encoding" | head -1
  # echo '"md5sum(sun.java.command)":"'`cat $event_file | tr ',' '\n' | grep  "sun.java.command" | head -1 | md5sum`'"'
  cat $event_file | tr ',' '\n' | grep  "sun.java.launcher" | head -1
  cat $event_file | tr ',' '\n' | grep  "sun.jnu.encoding" | head -1
  cat $event_file | tr ',' '\n' | grep  "sun.management.compiler" | head -1
  cat $event_file | tr ',' '\n' | grep  "sun.nio.ch.bugLevel" | head -1
  cat $event_file | tr ',' '\n' | grep  "sun.os.patch.level" | head -1
  cat $event_file | tr ',' '\n' | grep  "user.country" | head -1
  # cat $event_file | tr ',' '\n' | grep  "user.dir" | head -1
  cat $event_file | tr ',' '\n' | grep  "user.home" | head -1
  cat $event_file | tr ',' '\n' | grep  "user.language" | head -1
  cat $event_file | tr ',' '\n' | grep  "user.name" | head -1
  cat $event_file | tr ',' '\n' | grep  "user.timezone" | head -1
}
inputmetrics () {
   input_metric_scrap_file=$1
   rm -fr ~/.sparkdiff/BytesRead.integer
   rm -fr ~/.sparkdiff/BytesRead.iec
   rm -fr ~/.sparkdiff/RecordsRead.integer
   {
     {
      {
       {
         cat $input_metric_scrap_file | tr ',' '\n'
       } | grep -e '"Bytes Read"'
      } | awk -F ':' '{print $3}'
     } | awk '{s+=$1} END {print s}'
   } > ~/.sparkdiff/BytesRead.integer
   cat ~/.sparkdiff/BytesRead.integer | numfmt --to=iec-i > ~/.sparkdiff/BytesRead.iec
   {
    echo -e '"BytesRead.integer":"' | tr -d '\n'
    cat ~/.sparkdiff/BytesRead.integer | tr -d '\n'
    echo -e '"'
   }
   {
    echo -e '"BytesRead.iec":"' | tr -d '\n'
    cat ~/.sparkdiff/BytesRead.iec | tr -d '\n'
    echo -e '"'
   }
   {
     {
      {
       {
        {
          cat $input_metric_scrap_file | tr ',' '\n'
        } | grep -e '"Records Read"'
       } | tr -d '}'
      } | awk -F ":" '{print $2}'
     } | awk '{s+=$1} END {print s}'
   } > ~/.sparkdiff/RecordsRead.integer
   {
    echo -e '"RecordsRead.integer":"' | tr -d '\n'
    cat ~/.sparkdiff/RecordsRead.integer | tr -d '\n'
    echo -e '"'
   }
}
parse_class_path () {
  event_file=$1
  cp_type=$2
  {
   {
    {
     {
      cat $event_file | tr ',' '\n' 
     } | grep  "spark.${cp_type}.extraClassPath" | head -1
    } | awk -F '"' '{print $4}'
   } | tr ':' '\n'
  } | while read cp_line
  do
   echo -e '"' | tr -d '\n'
   echo "${cp_type}-classpath" | tr -d '\n'
   echo -e '":"' | tr -d '\n'
   echo ${cp_line} | tr -d '\n'
   echo -e '"'
  done
}

rm -fr ~/.sparkdiff
mkdir ~/.sparkdiff

echo -e "---------[\e[1m\e[94mparse_configs ${1}\e[0m]---------"
sparkconf $1 | tee ~/.sparkdiff/spark_event_1.json | awk '{print "."}' | tr '\n' '.'
echo ""
echo ""

echo -e "---------[\e[1m\e[94mparse_configs ${2}\e[0m]---------"
sparkconf $2 | tee ~/.sparkdiff/spark_event_2.json | awk '{print "."}' | tr '\n' '.'
echo ""
echo ""

echo -e "---------[\e[1m\e[94minput_metrics ${1}\e[0m]---------"
{
  cat $1 | grep -e '"Input Metrics"' | grep -o '..............................................................................................................................................................$' | grep -e '"Input Metrics"'
} > ~/.sparkdiff/InputMetrics_event_1.scrap
echo "...................................................................."
inputmetrics ~/.sparkdiff/InputMetrics_event_1.scrap >> ~/.sparkdiff/spark_event_1.json
echo "........"
echo ""
echo ""

echo -e "---------[\e[1m\e[94minput_metrics ${2}\e[0m]---------"
{
  cat $2 | grep -e '"Input Metrics"' | grep -o '..............................................................................................................................................................$' | grep -e '"Input Metrics"'
} > ~/.sparkdiff/InputMetrics_event_2.scrap
echo "...................................................................."
inputmetrics ~/.sparkdiff/InputMetrics_event_2.scrap >> ~/.sparkdiff/spark_event_2.json
echo "........"
echo ""
echo ""

echo -e "---------[\e[1m\e[94mparse_classpaths ${1}\e[0m]---------"
parse_class_path ${1} "executor" > ~/.sparkdiff/event_1_executor.classpath
parse_class_path ${1} "driver" > ~/.sparkdiff/event_1_driver.classpath
cat ~/.sparkdiff/event_1_executor.classpath >> ~/.sparkdiff/spark_event_1.json
cat ~/.sparkdiff/event_1_driver.classpath >> ~/.sparkdiff/spark_event_1.json
echo "........"
echo ""
echo ""

echo -e "---------[\e[1m\e[94mparse_classpaths ${2}\e[0m]---------"
parse_class_path ${2} "executor" > ~/.sparkdiff/event_2_executor.classpath
parse_class_path ${2} "driver" > ~/.sparkdiff/event_2_driver.classpath
cat ~/.sparkdiff/event_2_executor.classpath >> ~/.sparkdiff/spark_event_2.json
cat ~/.sparkdiff/event_2_driver.classpath >> ~/.sparkdiff/spark_event_2.json
echo "........"
echo ""
echo ""

echo -e "---------[\e[1m\e[94mdiff\e[0m]---------"
diff ~/.sparkdiff/spark_event_1.json ~/.sparkdiff/spark_event_2.json
echo ""
echo ""
