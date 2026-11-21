🚀 Static Website Hosting on AWS EC2 using Nginx

<p align="center">
<img src="https://img.shields.io/badge/AWS-EC2-orange?logo=amazonaws" />
<img src="https://img.shields.io/badge/OS-Ubuntu-E95420?logo=ubuntu" />
<img src="https://img.shields.io/badge/Web_Server-Nginx-009639?logo=nginx" />
<img src="https://img.shields.io/badge/Status-Deployed-success" />
</p>

📌 Project Overview

In this project, I deployed a static website on an AWS EC2 instance running Ubuntu Linux. I used Nginx as a web server to host and serve the website over the internet.

The main objective of this project was to gain hands-on experience with AWS EC2, Linux server administration, Nginx configuration, and static website deployment.

🌐 Live Website: http://13.61.12.241

📸 Project Screenshots
1. AWS EC2 Instance

<p align="center">
<img src="screenshots/ec2-instance.png" width="85%" alt="AWS EC2 Instance"/>
</p>

2. Nginx Status

<p align="center">
<img src="screenshots/nginx-status.png" width="85%" alt="Nginx Status"/>
</p>

3. AWS Security Group Configuration

<p align="center">
<img src="screenshots/security-group.png" width="85%" alt="Security Group"/>
</p>

4. Static Website Live on EC2

<p align="center">
<a href="http://13.61.12.241">
<img src="screenshots/website-live.png" width="90%" alt="Live Website"/>
</a>
</p>

<p align="center">
<a href="http://13.61.12.241">🔗 Visit Live Website</a>
</p>

5. Website Deployment Through Terminal

<p align="center">
<img src="screenshots/terminal-deployment.png" width="85%" alt="Terminal Deployment"/>
</p>

🛠️ Technologies Used
Technology	Purpose
AWS EC2	Cloud server hosting
Ubuntu Linux	Operating system
Nginx	Web server
HTML	Website structure
CSS	Website styling
JavaScript	Website functionality
SSH	Remote server connection
AWS Security Groups	Network traffic control
🚀 Project Implementation
1. Launching an AWS EC2 Instance
Logged in to the AWS Management Console.
Created an EC2 instance.
Selected Ubuntu Server as the operating system.
Configured the instance and generated an SSH key pair.
Configured the required security group rules.
2. Connecting to EC2 Using SSH

Connected to the EC2 instance from my local machine using SSH.

bash
ssh -i your-key.pem ubuntu@13.61.12.241

3. Updating the Ubuntu Server

Updated the system packages.

bash
sudo apt update
sudo apt upgrade -y

4. Installing Nginx

Installed Nginx on the Ubuntu server.

bash
sudo apt install nginx -y


Started and enabled the Nginx service.

bash
sudo systemctl start nginx
sudo systemctl enable nginx


Verified the Nginx service status.

bash
sudo systemctl status nginx

5. Deploying the Static Website
Transferred static website files (HTML, CSS, JavaScript, and assets) to the EC2 instance.
Placed the website files inside the Nginx web root directory.
Configured the appropriate file permissions.

Example:

bash
sudo cp -r website/* /var/www/html/

6. Configuring Nginx

Used Nginx to serve the static website through the EC2 instance's public IP address.

Nginx served the website files from its configured document root.

7. Configuring AWS Security Groups

Configured the EC2 security group to allow the required inbound traffic.

Type	Port	Purpose
SSH	22	Remote server access
HTTP	80	Website access
HTTPS	443	Secure website access (if configured)

Note: SSH access should ideally be restricted to my own IP address.

8. Testing the Website

After completing the deployment, I accessed the website using the EC2 instance's public IP address.

Website URL: http://13.61.12.241

Successfully verified that the static website was accessible through the internet.

🏗️ Project Architecture

The following diagram illustrates how a user accesses my static website hosted on AWS EC2 using Nginx.

<div align="center">

<table>
<tr>
<td align="center" bgcolor="#DBEAFE">
<h3>👤 User / Browser</h3>
Opens the website using a web browser
</td>
</tr>
<tr>
<td align="center">
<h2>⬇️</h2>
</td>
</tr>
<tr>
<td align="center" bgcolor="#FFF0D9">
<h3>🌐 Internet</h3>
HTTP Request to EC2 Public IP
</td>
</tr>
<tr>
<td align="center">
<h2>⬇️</h2>
</td>
</tr>
<tr>
<td align="center" bgcolor="#FFF0D9">
<h3>☁️ AWS Cloud</h3>
<h3>🖥️ EC2 Instance</h3>
Ubuntu Linux Server
</td>
</tr>
<tr>
<td align="center">
<h2>⬇️</h2>
</td>
</tr>
<tr>
<td align="center" bgcolor="#D1FAE5">
<h3>⚙️ Nginx Web Server</h3>
Handles HTTP Requests
</td>
</tr>
<tr>
<td align="center">
<h2>⬇️</h2>
</td>
</tr>
<tr>
<td align="center" bgcolor="#EDE9FE">
<h3>📁 /var/www/html</h3>
HTML | CSS | JavaScript | Assets
</td>
</tr>
<tr>
<td align="center">
<h2>⬇️</h2>
</td>
</tr>
<tr>
<td align="center" bgcolor="#D1FAE5">
<h3>💻 Website Displayed in Browser</h3>
Static Website Successfully Loaded
</td>
</tr>
</table>

</div>

Architecture Explanation
User: Opens the website using a web browser.
Internet: Sends an HTTP request to the EC2 public IP.
AWS EC2: Receives the incoming request.
Ubuntu Linux: Runs the server operating system.
Nginx: Handles the HTTP request and serves static files.
Website Files: Nginx retrieves HTML, CSS, JavaScript, and other assets from /var/www/html.
Browser: Displays the requested website to the user.
📚 What I Learned

Through this project, I gained practical experience in:

Creating and configuring AWS EC2 instances.
Working with Ubuntu Linux servers.
Connecting to remote servers using SSH.
Installing and managing Nginx.
Deploying static websites on cloud infrastructure.
Configuring AWS Security Groups.
Understanding how web servers handle HTTP requests.
Hosting websites using AWS cloud services.
🔮 Future Improvements
Configure a custom domain name.
Enable HTTPS using Let's Encrypt SSL certificates.
Automate website deployment using GitHub Actions.
Configure Nginx virtual hosts.
Implement automated backups and monitoring.
Set up a CI/CD pipeline for automated deployment.
👨‍💻 Author

Adarsh Tamang

GitHub: Adarsh Tamang
Project: AWS EC2 Static Website Hosting

<p align="center">
⭐ If you found this project useful, feel free to star this repository!
</p>