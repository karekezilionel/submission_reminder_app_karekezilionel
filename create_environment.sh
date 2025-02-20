#!/bin/bash
#Providing the github username
read -p 'Provide your github username: ' username
#Create the submission_reminder directory
lionel=submission_reminder_$username
mkdir -p $lionel
#Create the subdirectories
mkdir -p $lionel/app $lionel/modules $lionel/assets $lionel/config
#Create the reminder.sh script
cat << 'EOF' > $lionel/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOF
cat << 'EOF' > $lionel/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $assignment assignment!"
        elif [[ "$status" == ""submitted" ]]; then
            echo "Reminder: $student has submitted the $assignment assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

EOF
cat << 'EOF' > $lionel/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
gullain, physics, submitted
steve, python, not submitted
landry, History, submitted
yann, databases, not submitted
rodrigue, maths, not submitted
bonfils, chemistry, submitted
steccy, Geography, not submitted
queen, English, submitted
james, Biology, not submitted
EOF
cat << 'EOF' > $lionel/config/config.env

# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
cat << 'EOF' > $lionel/startup.sh
#!/bin/bash
# startup.sh - Starts the submission reminder application when executed

echo "Starting submission reminder application..."
./$lionel/app/reminder.sh
EOF
#This will making all the files executable
chmod +x $lionel/startup.sh $lionel/app/reminder.sh $lionel/modules/functions.sh
#The exact feedback
echo 'Environment created'
