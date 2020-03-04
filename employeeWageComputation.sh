#!/bin/bash -x

# Check Employee is Present or Absent.
echo "Welcome to Employee Wage Computation"

# CONSTANTS FOR THE PROGRAM
WAGE_PER_HOUR=20
FULL_DAY_HOUR=8
HALF_DAY_HOUR=4
WORKING_DAYS_PER_MONTH=20

#VARIABLES
fullTime=1
partTime=2
monthlyWage=0

# Function to check attendence, daily employee wage based on full time and part time
function FullTimePartTimeEmployeeWage () {
	attendence=$((RANDOM%3))
	case $attendence in
		$fullTime )
			echo "Employee is Present"
			dailyWage=$(($FULL_DAY_HOUR*$WAGE_PER_HOUR))
			;;
		$partTime )
			echo "Employee is Present"
      	dailyWage=$(($HALF_DAY_HOUR*$WAGE_PER_HOUR))
			;;
		* )
			echo "Employee is Absent"
			dailyWage=0
			;;
	esac
}

# Calculating monthly wage
for (( day=1; day<=$WORKING_DAYS_PER_MONTH; day=$((day+1)) ))
do
	FullTimePartTimeEmployeeWage		# Calling the function
	monthlyWage=$(( $monthlyWage+$dailyWage ))
done
