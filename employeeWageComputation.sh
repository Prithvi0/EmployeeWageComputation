#!/bin/bash -x

# Check Employee is Present or Absent.
echo "Welcome to Employee Wage Computation"

# Function to check attendence
function attendence_check () {
	attendence=$((RANDOM%2))
	if [[ $attendence -eq 1 ]]
	then
		echo "Employee is Present"
	else
		echo "Employee is Absent"
	fi
}
#calling function to get Employee's attendence status
attendence_check
