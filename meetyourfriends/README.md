# **Link to orginal repository -> https://bitbucket.org/annaksyta/myf** #

# **How to configure and run MYF on Windows 10** #


## **1. Clone project** ##

* git clone https://annaksyta@bitbucket.org/annaksyta/myf.git 


## **2. Download and install xampp and node.js** ##

* https://www.apachefriends.org/download.html recommended 7.0.18 v.

 
* https://nodejs.org/en/download/
* after install check "npm" in command line if not working then in Environment Variables add "C:\nodejs\" (or your nodejs directory) into "path"


## **3. Configure xampp** ##

* run xampp Control Panel

* start Apache

* start MySQL

* in browser go to localhost/phpmyadmin

* * create new database named "ciesla" set "motoda porownywania napisow" to "utf_8_general_ci" go to this database and select "import" choose file : ..\myf\DB.sql and "wykonaj"


*  back to xampp Control Panel
 
* for Apache :
* * click on Config and choose "httpd.config"
* * find "DocumentRoot: The directory out of which you will serve your.." and set 

```
#!xml

DocumentRoot "basedirectory/myf"
<Directory "basedirectory/myf">
```

* and restar Apache in xampp Controle Panel (Stop, Start)


## **4. Configure node.js** ##

* open command line
* go to	..\myf\angular-starter

* run:	npm install -g bower




## **5. Run MYF** ##

* open command line
* go to	..\myf\angular-starter
* run:	npm start

* in browser go to http://localhost:8000/
 

## **6. Run configuration in IntelliJ IDEA** ##
 

* In the upper right corner choose Edic Configuration Click green plus and set configuration like on the picture below
![ideaconfig.PNG](https://bitbucket.org/repo/akbrrxr/images/1630693943-ideaconfig.PNG)



# **How to configure and run MYF on Mac OS** #


## **1. Clone project** ##

* git clone https://annaksyta@bitbucket.org/annaksyta/myf.git 


## **2. Download and install xampp and node.js** ##

* https://www.apachefriends.org/download.html recommended 7.0.18 v.
 
* https://nodejs.org/en/download/

## **3. Configure xampp** ##

* run xampp Control Panel

* start Apache

* start MySQL

* in browser go to localhost/phpmyadmin

* * create new database named "ciesla" set "motoda porownywania napisow" to "utf_8_general_ci" go to this database and select "import" choose file : ..\myf\DB.sql and "wykonaj"


*  back to xampp Control Panel
 
* for Apache :
* * click on Config and choose "httpd.config"
* * find "DocumentRoot: The directory out of which you will serve your.." and set 

```
#!xml

DocumentRoot basedirectory/myf
<Directory basedirectory/myf>
```

* and restar Apache in xampp Controle Panel (Stop, Start)

## **4. Configure node.js** ##

* open command line
* go to	..\myf\angular-starter

* run:	npm install -g bower




## **5. Run MYF** ##

* open command line
* go to	..\myf\angular-starter
* run:	npm start

* in browser go to http://localhost:8000/