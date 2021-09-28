## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![AzureELK_Topology](https://user-images.githubusercontent.com/10135553/131216586-7fd26abc-14a0-4822-b764-d2873642d91f.png)


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ansible playbook file may be used to install only certain pieces of it, such as Filebeat. All the ansible configuration files and play book files can be found at link below:

https://github.com/zwang126/AzureKibana_SIEM/tree/main/Ansible

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly resistant to DDoS attack, in addition to restricting external access to the network.



1. Load balancer with backend pool setup ensure there is no single point of failure, provided more high availability to the environment.
2. The advantage of using the jump box is only exposing limited resources public available thus the activities can be easily monitored and easy to prevent malicious activities.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system log. Filebeat collects what has been changed and when the change happened to the file system and log it to the SIEM platform.Metricbeat collects machines performance metric and send to SIEM platform


The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name                 	| Function                                       | IP Address 	| Operating System 	|
|----------------------	|------------------------------------------------|------------	|------------------	|
| Jump-box-provisioner 	| Jump box, Ansiable provisioner                 | 10.0.0.4   	| Ubuntu 18.04-LTS 	|
| Red-VM-Web1          	| Web Server, hosting DVWA docker Instance       | 10.0.0.5   	| Ubuntu 18.04-LTS 	|
| Red-VM-Web2          	| Web Server, hosting DVWA docker Instance       | 10.0.0.6   	| Ubuntu 18.04-LTS 	|
| ELK-VM                | ELK stack server, hosting ELK docker Instance  | 10.1.0.4   	| Ubuntu 18.04-LTS  	|




### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-box-provisioner and ELK-VM machines can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:


96.2xx.2xx.221 （my public IP)!



Machines within the network can only be accessed by Jump-Box-provisioner.

Jump-Box-provisioner, IP: 10.0.0.4




A summary of the access policies in place can be found in the table below.

| Name                 	| Publicly Accessible 	| Allowed IP Address                                	|
|----------------------	|---------------------	|---------------------------------------------------	|
| Jump-Box-provisioner 	| No                  	| 96.2xx.2xx.221 (My public IP)                     	|
| Red-VM-Web1          	| No                  	| 96.2xx.2xx.221 (My public IP), 10.0.0.4, 10.1.0.4 	|
| Red-VM-Web2          	| No                  	| 96.2xx.2xx.221 (My public IP), 10.0.0.4, 10.1.0.4 	|
| ELK-VM         	| No                  	| 96.2xx.2xx.221 (My public IP), 10.0.0.4           	|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because yu can manage multiple servers in groups manner by playbook, reduced human efforts and manual errors.

The playbook implements the following tasks:
- Install: docker.io
- Install: python-pip
- Install: docker
- Command: sysctl -w vm.max_map_count=262144

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.


[ELK](https://user-images.githubusercontent.com/10135553/131216380-607302e8-27ba-4c01-95d5-4964f90c73cc.PNG)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:

    Red-VM-Web1 10.0.0.5
    Red-VM-Web2 10.0.0.6 

We have installed the following Beats on these machines:

    File beat and metric beat

These Beats allow us to collect the following information from each machine:

   File beat monitor the file changes and log the time stamp with the change
   Metric beat collects machine's running metrics, for example: CPU and memory usage.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the configuration file to Red-VM-WEB1 AND Red-VM-WEB2.
- Update the host file to include ELK server and Red-VM-Web1, Red-VM-WEB2
- Run the playbook, and navigate to Kibana webiste to check that the installation worked as expected.


   /etc/ansible/file/filebeat-configuration.yml

- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_

   edit the /etc/ansible/host file to add web servers and elk server ip addresses

- _Which URL do you navigate to in order to check that the ELK server is running?

   http://104.42.232.28:5601

_How to Run it

Using git command to clone this directory ( git clone https://github.com/zwang126/AzureKibana_SIEM.git), modify the IP addresses and machine name to fit your needs in ansible host file, configuration file and play book file. 
