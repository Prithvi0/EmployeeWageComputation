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
totalWorkingDays=0
totalWorkingHours=0

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
while [[ $totalWorkingHours -lt $WORKING_HOURS_PER_MONTH && $totalWorkingDays -lt $WORKING_DAYS_PER_MONTH ]]
do
	((totalWorkingDays++))
	workingHours="$(EmployeeWorkHours)"     # Calling the function
	totalWorkingHours=$(($totalWorkingHours+$workingHours))

	#calculating and storing the daily wage
	dailyWage=$(($workingHours*$WAGE_PER_HOUR))
	dailyWage[$totalWorkingDays]=$dailyWage

	#calculating and storing the total wages
	totalWage=$(($totalWage+$dailyWage))
	totalWage[totalWorkingDays]=$totalWage
done

for ((i=1; i<${#dailyWage[@]}; i++))
do
	echo "Day[$i]:${dailyWage[$i]}"
done
echo "TotalWage:$totalWage"
