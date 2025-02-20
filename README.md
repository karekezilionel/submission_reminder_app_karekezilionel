## submission_reminder_app_karekezilionel
summative directory


##Description

The submission reminder app helps to alert or remind the students about upcoming assignments deadlines.


##Prerequisite

Before running the application, make sure the following are installed on your system:

Linux based operating system(Ubuntu, macOS, or WSL for windows users).
Bash shell(which is default on most Linux distributions).
Git(for cloning the repository).


##Installation

#1.  Clone the repository
 
git clone https://github.com/your_github_username/submission_reminder_app_githusername.git

Replace your_github_username with your actual GitHub username.



#2. Navigate to repository

cd submission_reminder_app_githusername.

#3. ./create_environment.sh

This script will prompt you for your GitHub username and then create the application directory (e.g., submission_reminder_YourName) with the necessary files and subdirectories.

#4.Navigate to the Application Directory

cd submission_reminder_YourName 

 # Replace YourName with the name you entered.

#5. Configuration

Modify the configuration file:

Open config.env inside the config/ directory.
This file contains environment variables used by the application.
Example default settings:
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
Adjust values as needed for your environment.

#6.  Submission file 


rodrigue, maths, not submitted
bonfils, chemistry, submitted
Anissa, Shell Basics, submitted
Yann, Databases, not submitted

#7.Running the application

Make the startup script executable
   Chmod +x startup.sh
Run the application
  ./startup.sh
  This script sets up the environment, loads required configurations, and executes the reminder.sh to process student submissions and send reminders.

