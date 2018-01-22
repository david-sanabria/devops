# CWDS Environment Dashboard User Guide

**NOTE**: 
* The CWDS dashboard is available here: http://env-status.cwds.io and can only be accessible on _OSI Guest_ and _OSI Internal_ networks inside the CWDS building.
* This dashboard currently monitors the status of all application-docker containers deployed in all environments and the status of supporting services such as Elasticsearch and Rundeck. It also provides the current version of the deployed applications.
* This dashboard *DOES NOT* monitor the infrastructure (EC2 instances or Memory/Disk utilization) issues. DevOps is monitoring these with New Relic and AWS CloudWatch service. 
* The dashboard is designed to auto-refresh every 5 minutes and a _LAST UPDATED_ timestamp will be displayed on every individual page.

### Here are some steps that may help you navigate your way through the dashboard: 

![Alt text](/docs/documentation/dashboard-1.png?raw=true "Optional Title")

* As you can see in the screenshot, there are 3 links.
* The *Non-Prod Dashboard* link will redirect you to a dashboard page that will display the status of all non prod environments from Pre-integration to Preview.
* The *Prod Dashboard* link will redirect to you to a dashboard page that will display the status of all prod-level environments: **Performance** and **Production**
* The *known-issues* link redirects to a text box that will be regularly updated by DevOps and will be a form of communicating:
  * Current issues with environments in CD.
  * Any maintainence work in-progress on any of our environments and services.
  * Any major deployments or any such changes that may affect the stable performance of the environments in CD.

* To get a more detailed information of the appications, hit the __Click for more information__ link for any environment. You will be redirected to a page that will display the information about application-containers and supporting services. This page will have the _LAST UPDATED_ timestamp.

**Please Note**: This dashboard is built in-house at CWDS by DevOps Engineering Team. It is not the ultimate monitoring tool and may report inaccurate information if there is a connectivity issue with any of our virtual servers on AWS. DevOps is continually monitoring the automation jobs that generate the dashboard and are in process to improve any shortcomings of the dashboard and will roll out new updates as and when they are tested successfully.
