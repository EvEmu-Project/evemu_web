+++
title = "Getting Started"
description = "How to get started with EVEmu"
date = 2021-03-21T16:21:47+01:00
weight = 20
draft = false
bref = "How to get started with EVEmu"
toc = true
+++

### Client configuration
1. Install the Crucible 360229 client. No links for the client are provided here.

2. Make sure to uncheck the run eve box before finishing the install, this may be difficult to see on some wine builds as the dialog is partially obscured.

3. Get a copy of the blue patcher [>>> DOWNLOAD HERE <<<](https://github.com/stschake/blue_patcher) and follow the instructions in README.md.

Your client is now ready to run.

**NOTE:** Do NOT run the Client from the icon you get after installation. Change it to run the /bin/exefile.exe instead of the eve.exe or you will get the launcher and that will attempt to contact CCP and automatically update the client.

### Obtain EVEmu

EVEmu can be obtained in either binary format or as source which can be compiled on your system.

Links to download either version are available on the [home page](/).

If you choose to compile from source, please read [Compiling from Source](/docs/compiling_from_source).

### Server configuration

**NOTE:**
When building from source, 
%serverRoot% is where the server is installed.
%devRoot% is where the development files are located.

These may be the same location but that is not necessary

### Server Setup:

Create the directories %serverRoot%/etc/ and %serverRoot%/log/
Copy the %devRoot%/evemu_server/utils/devtools.raw file to %serverRoot%/etc/
Open a command prompt and go to the directory %devRoot%/evemu_server/sql/utils/
Run the script merge-ofic-updates.sh.

### MariaDB Setup:

Get a copy of the crucible static data dump `cru16-mysql5-v1.sql.bz2` and extract the file cru16-mysql5-v1.sql to %serverRoot%. Then open a mysql client and execute the following commands in this order: 
```
 create database evemu;
 use evemu;
 source %serverRoot%/cru16-mysql5-v1.sql;
 source %devRoot%/evemu_server/sql/evemu_dynamic-dump.sql;
 source %devRoot%/evemu_server/sql/evemu_static-dump.sql;
 source %devRoot%/evemu_server/sql/ofic-updates.sql;
 source %devRoot%/evemu_server/sql/prime_db.sql;
 source %devRoot%/evemu_server/sql/liveupdates.sql;
 source %devRoot%/evemu_server/sql/market_npc.sql;
 ALTER TABLE srvAccountApi AUTO_INCREMENT=1000000;
 ALTER TABLE srvAccount AUTO_INCREMENT=1;
 INSERT INTO srvAccount (accountID, accountName, role, password, online, banned)   
 VALUES(NULL, 'YOUR_ACCOUNT_NAME', 5003499186008621056, 'YOUR_PASSWORD', 0, 0);
 GRANT ALL ON evemu.* TO EVEMU_USER@localhost IDENTIFIED BY 'EVEMU_PASSWORD';
 ```

In the last two lines, replace `YOUR_ACCOUNT_NAME` with the account name you want to log into the game with, and `YOUR_PASSWORD` with the password you will use. Change `EVEMU_USER` to the username you want the server to log into you database with, and `EVEMU_PASSWORD` to the password the server should use.

### Server Configuration

Create the server config file %serverRoot%/etc/eve-server.xml. Make sure to set the proper database username and password.

### Test and Report!
Yes! We know there are bugs and missing features!

Check out our current [project status](/project_status) to see a list of known working and missing/broken features of the EVE Online experience.

You can request to be part of the Testers Group. Just head into our Discord channel and get to know some of them, and start testing against the Project Status.

See [this article](/docs/testing) for specific information on how to go about testing and creating reports and submitting bug/feature reports on our Github project page.