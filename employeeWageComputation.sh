#!/bin/bash -x

# CONSTANTS FOR THE PROGRAM
WAGE_PER_HOUR=20
FULL_DAY_HOUR=8

# Check Employee is Present or Absent.
echo "Welcome to Employee Wage Computation"

# Function to check attendence and daily employee wage
function dailyEmployeeWage () {
	attendence=$((RANDOM%2))
	if [[ $attendence -eq 1 ]]
	then
		echo "Employee is Present"
		dailyWage=$(($FULL_DAY_HOUR*$WAGE_PER_HOUR))
	else
		echo "Employee is Absent"
		dailyWage=0
	fi
}
dailyEmployeeWage
