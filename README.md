## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Diagrams/AzureProject1_Diagram.drawio.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - [](../Ansible/ELK/Elk_playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly responsive and ensure availability, in addition to restricting unwanted traffic to the network.
-  What aspect of security do load balancers protect? Availability
   What is the advantage of a jump box? The internal machines do not have to directly touch the internet, only one machine (the jumpbox) will communicate with the external network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file system and system logs.
-  What does Filebeat watch for? Changes to files 
-  What does Metricbeat record? OS and service metrics

The configuration details of each machine may be found below.

| Name       | Function       | IP Address | Operating System |
|------------|----------------|------------|------------------|
| Jump Box   | Gateway        | 10.1.0.4   | Linux 18.04 LTS  |
| Web-1      | DVWA Host      | 10.1.0.5   | Linux 18.04 LTS  |
| Web-2      | DVWA Host      | 10.1.0.6   | Linux 18.04 LTS  |
| Web-3      | DVWA Host      | 10.1.0.7   | Linux 18.04 LTS  |
| ELK-Server | ELK Deployment | 10.2.0.4   | Linux 18.04 LTS  |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 10.1.0.5
- 10.1.0.6
- 10.1.0.7
- 10.2.0.4
- Local Host IP 

Machines within the network can only be accessed by the Ansible Control Node.
-  Which machine did you allow to access your ELK VM? Ansible Control Node
   What was its IP address? 10.1.0.4

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible  | Allowed IP Addresses                               |
|------------|----------------------|----------------------------------------------------|
| Jump Box   | Yes                  | 10.1.0.5 10.1.0.6 10.1.0.7 10.2.0.4 Local Host IP  |
| Web-1      | No                   | 10.1.0.4                                           |
| Web-2      | No                   | 10.1.0.4                                           |
| Web-3      | No                   | 10.1.0.4                                           |
| ELK-Server | No                   | 10.1.0.4                                           |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
-  What is the main advantage of automating configuration with Ansible? Allows for easy addition/removal of machines by running ansible playbooks
The playbook implements the following tasks:
- In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- Configure the VM that will run the ELK container
- Increase the memory of that VM
- Install docker.io, python3-pip, docker
- Download the ELK container and launch it on your published ports
- Enable the ELK container to run upon booting the VM

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
![](Diagrams/Docker_PS_Output.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
-  10.1.0.5
-  10.1.0.6
-  10.1.0.7

We have installed the following Beats on these machines:
-  Filebeat
-  Metricbeat

These Beats allow us to collect the following information from each machine:
- In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
- Filebeat collects log events of changes to the file system. This helps ensure files have not been changed/tampered with by malicous actors
- Metricbeat monitors metrics of services that the host system may be running. This would include services such as Apache, MySQL, Redis, etc. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the config file to /etc/ansible/files.
- Update the config file to include the IPs of the host machines that the container will be installed on. 
- Run the playbook, and navigate to the host machine and run "sudo docker ps" to check that the installation worked as expected.

Answer the following questions to fill in the blanks:
- Which file is the playbook? Elk_playbook.yml 
  Where do you copy it? /etc/ansible
- Which file do you update to make Ansible run the playbook on a specific machine? the config files
  How do I specify which machine to install the ELK server on versus which to install Filebeat on? This is specified in the config files for ELK, metricbeat, filebeat by specifing the host group (ELK or webservers)
- Which URL do you navigate to in order to check that the ELK server is running? http://137.135.16.200:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
