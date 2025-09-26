@echo off
setlocal
set "KAFKA_HOME=%~dp0"
set "KAFKA_HOME=%KAFKA_HOME:~0,-1%"
set "CLASSPATH=%KAFKA_HOME%\libs\*"
set "LOG4J_OPTS=-Dlog4j.configuration=file:%KAFKA_HOME%\config\log4j.properties"
echo Starting ZooKeeper...
java -Xms256m -Xmx512m %LOG4J_OPTS% -cp "%CLASSPATH%" org.apache.zookeeper.server.quorum.QuorumPeerMain "%KAFKA_HOME%\config\zookeeper.properties"
