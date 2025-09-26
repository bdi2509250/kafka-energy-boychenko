@echo off
setlocal
set "KAFKA_HOME=%~dp0"
set "KAFKA_HOME=%KAFKA_HOME:~0,-1%"
set "CLASSPATH=%KAFKA_HOME%\libs\*"
set "LOG4J_OPTS=-Dlog4j.configuration=file:%KAFKA_HOME%\config\log4j.properties"
echo Starting Kafka broker...
java -Xms512m -Xmx1024m %LOG4J_OPTS% -cp "%CLASSPATH%" kafka.Kafka "%KAFKA_HOME%\config\server.properties"
