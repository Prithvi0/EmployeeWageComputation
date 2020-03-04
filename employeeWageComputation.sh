#!/bin/bash -x

# Check Employee is Present or Absent.
echo "Welcome to Employee Wage Computation"

# CONSTANTS FOR THE PROGRAM
WAGE_PER_HOUR=20
FULL_DAY_HOUR=8
HALF_DAY_HOUR=4
WORKING_DAYS_PER_MONTH=20
WORKING_HOURS_PER_MONTH=100

#VARIABLES
fullTime=1
partTime=2
monthlyWage=0
daysWorked=0
hoursWorked=0

# Function to check attendence, daily employee wage based on full time and part time
function FullTimePartTimeEmployeeWage () {
	attendence=$((RANDOM%3))
	case $attendence in
		$fullTime )
			echo "Employee is Present"
			empHours=8
			;;
		$partTime )
			echo "Employee is Present"
         empHours=4
			;;
		* )
			echo "Employee is Absent"
         empHours=0
			;;
	esac
	hoursWorked=$(($hoursWorked+$empHours))
}

#Calculating Wages till Working days per month or Working hours per month is reached
while [[ $daysWorked -lt $WORKING_DAYS_PER_MONTH && $hoursWorked -lt $WORKING_HOURS_PER_MONTH ]]
do
   (( daysWorked++ ))
	FullTimePartTimeEmployeeWage     # Calling the function
done
totalWage=$(($hoursWorked*$WAGE_PER_HOUR))
