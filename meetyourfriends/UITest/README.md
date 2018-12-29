# **How to confirguer and run tests** #

download and install maven (https://maven.apache.org/download.cgi)
* * add into System variables :
* * M2_HOME=C:\Program Files\apache-maven-3.3.9 (or your location)

download and install java jdk (http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
* * add into System variables :
* * JAVA_HOME=C:\Program Files\Java\jdk1.8.0_121 (or your location)

## **1. How to run tests** ##

* * go to  myf\UITest
* * execute in console : mvn clean test -Dfluentlenium.webDriver=chrome -Dwebdriver.chrome.driver="chromedriver.exe" 


