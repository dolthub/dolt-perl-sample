# dolt-perl-sample
Sample project using Perl to connect to a Dolt database. Read [the associated blog on DoltHub](https://www.dolthub.com/blog/2024-11-29-dolt-with-perl/) for more details.

# Running the Sample
Before you can run this sample code, you need to start up a Dolt SQL server for the code to connect to. If you don't already have Dolt installed, head over to [the Dolt installation docs](https://docs.dolthub.com/introduction/installation) and follow the instructions to install Dolt. You'll also need a modern version of Perl intalled on your system, as well as a few Perl modules that we'll explain below.


## Start a Dolt SQL Server

Once you've gotten Dolt installed, create a directory for your new database and initialize it as a Dolt database directory. Make sure to name the directory "doltdb" since that will become the name of the database and you'll need it to match future commands in this sample project.

```bash
mkdir doltdb && cd doltdb;
dolt init --fun
dolt sql-server --loglevel DEBUG
```

That last command won't return until you kill the dolt sql-server with CTRL+C.  We've enabled `DEBUG` logging so you can see additional information printed out to the terminal about what the Dolt SQL server is processing.

In a new terminal, let's load some sample data into our new database. This sample project contains a `camel_data.sql` file that you can load into your running Dolt SQL server like this:

```bash
mysql -uroot --protocol TCP doltdb < camel_data.sql
```


## Run the Perl Sample

At this point, you should have a Dolt SQL server up and running and have populated it with some initial data.

Before we run our Perl code, we'll need to make sure we have our Perl dependencies installed, specifically the `DBI` package and the MySQL driver (i.e. `DBD:mysql`). In a terminal, run the following `cpan` command to install those dependencies:

```bash
cpan DBI DBD::mysql
```

If those install successfully, then you're ready to run the Perl sample code!
```bash
perl dolt_with_perl.pl
```


# Help!
If you run into any problems using this sample code, or just want some help integrating your application with Dolt, come over to the [DoltHub Discord server](https://discord.gg/gqr7K4VNKe) and connect with our development team as well as other Dolt customers. We'll be happy to learn more about what you're building and help you get Dolt working!

If you think you've found a bug in Dolt, then please [cut us an issue on GitHub](https://github.com/dolthub/dolt/issues/new) with a description of the bug and steps to reproduce it and we'll be happy to investigate. 
