#!/bin/bash -x

# Check Employee is Present or Absent.
echo "Welcome to Employee Wage Computation"

# CONSTANTS FOR THE PROGRAM
WAGE_PER_HOUR=20
WORKING_DAYS_PER_MONTH=20
WORKING_HOURS_PER_MONTH=100

#VARIABLES
fullTime=1
partTime=2
daysWorked=0
hoursWorked=0

# Function to check attendence, daily employee wage based on full time and part time
function EmployeeWorkHours () {
	employeeCheck=$((RANDOM%3))
	case $employeeCheck in
		$fullTime )
			workingHours=8
			;;
		$partTime )
			workingHours=4
			;;
		* )
			workingHours=0
			;;
	esac
	echo "$workingHours"
}

#Calculating Wages till Working days per month or Working hours per month is reached
while [[ $daysWorked -lt $WORKING_DAYS_PER_MONTH && $hoursWorked -lt $WORKING_HOURS_PER_MONTH ]]
do
	(( daysWorked++ ))
	workingHours="$(EmployeeWorkHours)"     # Calling the function
	totalWorkingHours=$(($totalWorkingHours+$workingHours))
done
totalWage=$(($totalWorkingHours*$WAGE_PER_HOUR))
