## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
![Topology](https://user-images.githubusercontent.com/10135553/131216215-8ec814e7-f343-446a-a3d9-5c5b7cb55bd6.PNG)

https://drive.google.com/file/d/1DhHfZ03S5rZ84T2zWvDa5AFWNzUP-a7x/view?usp=sharing

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ansible playbook file may be used to install only certain pieces of it, such as Filebeat.

https://github.com/zwang126/AzureKibana_SIEM/blob/main/Ansible/filebeat-config.yml

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
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_


1. Load balancer with backend pool setup ensure there is no single point of failure, provided more high availability to the environment.
2. The advantage of using the jump box is only exposing limited resources public available thus the activities can be easily monitored and easy to prevent malicious activities.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _____ and system _____.
- _TODO: What does Filebeat watch for?_

	Filebeat collects what has been changed and when the change happened to the file system and log it to the SIEM platform

- _TODO: What does Metricbeat record?_

	Metricbeat collects machines performance metric and send to SIEM platform

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name                 	| Function                                       | IP Address 	| Operating System 	|
|----------------------	|------------------------------------------------|------------	|------------------	|
| Jump-box-provisioner 	| Jump box, Ansiable provisioner                 | 10.0.0.4   	| Ubuntu 18.04-LTS 	|
| Red-VM-Web1          	| Web Server, hosting DVWA docker Instance       | 10.0.0.5   	| Ubuntu 18.04-LTS 	|
| Red-VM-Web2          	| Web Server, hosting DVWA docker Instance       | 10.0.0.6   	| Ubuntu 18.04-LTS 	|
| Red-ELK-Srv1          | ELK stack server, hosting ELK docker Instance  | 10.1.0.4   	| Ubuntu 18.04-LTS  	|




### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-box-provisioner and Red-ELK-Srv1 machines can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_

96.2xx.2xx.221 （my public IP)![ELK](https://user-images.githubusercontent.com/10135553/131216380-607302e8-27ba-4c01-95d5-4964f90c73cc.PNG)



Machines within the network can only be accessed by Jump-Box-provisioner.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_

Jump-Box-provisioner, IP: 10.0.0.4




A summary of the access policies in place can be found in the table below.

| Name                 	| Publicly Accessible 	| Allowed IP Address                                	|
|----------------------	|---------------------	|---------------------------------------------------	|
| Jump-Box-provisioner 	| No                  	| 96.2xx.2xx.221 (My public IP)                     	|
| Red-VM-Web1          	| No                  	| 96.2xx.2xx.221 (My public IP), 10.0.0.4, 10.1.0.4 	|
| Red-VM-Web2          	| No                  	| 96.2xx.2xx.221 (My public IP), 10.0.0.4, 10.1.0.4 	|
| Red-ELK-Srv1         	| No                  	| 96.2xx.2xx.221 (My public IP), 10.0.0.4           	|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_

	You can manage multiple servers in groups manner by playbook, reduced human efforts and manual errors.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- Install: docker.io
- Install: python-pip
- Install: docker
- Command: sysctl -w vm.max_map_count=262144

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.


![Uploading ELK.PNG…]()


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

    Red-VM-Web1 10.0.0.5
    Red-VM-Web2 10.0.0.6 

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

    File beat and metric beat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

   File beat monitor the file changes and log the time stamp with the change
   Metric beat collects machine's running metrics, for example: CPU and memory usage.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_

   /etc/ansible/file/filebeat-configuration.yml

- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_

   edit the /etc/ansible/host file to add web servers and elk server ip addresses

- _Which URL do you navigate to in order to check that the ELK server is running?

   http://104.42.232.28:5601

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
