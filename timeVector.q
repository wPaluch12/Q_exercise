
/
 Exercise 1:
 Create a vector of times in ascending order: the vector should have the current time plus increments of 2 seconds. Then pick and arbitrary time t
 
 find its position in the vector
 adjust the vector to contain only elements greater or equal to t including t itself
\

\ Get the current time from local env in local timezone
currentTime: .z.T

\ control print to show current time in console
show "This is the current time: ", string currentTime

\ Get the lenght of the time vector from user console input
show "Enter a number that will be the time vector lenght: "
vectorLenght: read0 0

\ validate if the user input is a number, if not show error and end the program
intVectorLenght: $[ ("J"$vectorLenght)=0N; [show "Error: Your enter was not a number";exit 1] ; ["J"$vectorLenght] ]

\ confirm to the user his input and the lenght of the time vector
show "You entered: ", string [intVectorLenght],", this will be the lenght of the time vector"

\ get the time vector: current time plus increments of 2 seconds
timeVector: currentTime +\: 00:00:02 * til intVectorLenght

show "Enter a number greater than 0 and equal or less than ", string [intVectorLenght]
chooseNumber: read0 0

intChooseNumber: $[ ("J"$chooseNumber)=0N; [show "Error: Your enter was not a number";exit 1] ; ["J"$chooseNumber] ]
t: $[ (intChooseNumber>0) and (intChooseNumber<=intVectorLenght); [ currentTime + 00:00:02 * intChooseNumber] ; [show "Error: Your enter was not in range";exit 1]]

/ get the position of the arbitrary choosen time (unfortuanately it will be equall to the user input)
position: timeVector?t

show " The position of choosen arbitrary time is: ", string [position]

/ adjust the vector to contain only elements greater or equal to t including t itself
timeVector: timeVector where timeVector>=t
show "The adjusted time vector is: "
(timeVector)

exit 0