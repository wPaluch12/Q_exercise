# Q_exercise
Two exercises in q language

The first exercise is :
 #### Exercise 1:
 Create a vector of times in ascending order: the vector should have the current time plus increments of 2 seconds. Then pick and arbitrary time t
 
 find its position in the vector
 adjust the vector to contain only elements greater or equal to t including t itself


The solution for this exercise is in timeVector.q file. To run the file you need to run:

q timeVector.q

There is no need to provide the params in command line, because the user will be asked to provide the lenght of the time vector. The lenght param can be a whole number for example 20. The user also will be asked to choose a number between 0 and choosen lenght of the time vector to pick arbitrary time t.


The second Exercise 

#### Exercise 2:

The purpose of this mini project is for you to create a table which holds a timeseries 
of pricing data with prices and sizes for different fx (foreign exchange) currencies 
and write a function (API) to calculate the VWAP (volume-weighted average price) for this data. 
If time permits, you can extend this to also write a TWAP (time-weighted average price) function.
 
Using q as the language of choice, there should be 5 outcomes for this project:
 
1. An input file with data you have created in csv format
2. A function which, given a time range and a list of symbols as inputs, returns the VWAP (TWAP) for each of these symbols as a table
3. A command to start a q process which will load this function
4. Example of how to call the function
5. Test(s) to ensure validity of code


##### Input file
The input file is trade.csv

##### Function
To calculate the vwap metric I used the vwap formula from https://medium.com/@financial_python/building-a-vwap-indicator-in-python-81ff9157fb13
The function is saved in vwap.q file

##### Command to start a q process which will load this function

First we load the data from trade.csv file:

colnames: `date`open`high`low`close`volume`sym
.Q.fs[{`trade insert flip colnames!("DFFFFIS";",")0:x}]`:trade.csv

Now load the function:
\l Q_playground/function_vwamp.q 

After this, we can use the function vwap

##### Examples

We can call the function vwap [data; startDate; endDate; listOfSymbols]
where data is the table containg trade data with columns: date, open, high, low, close, volume and sym
startDate and endDate are the indicators from what period we want to analyse the vwap metric
listOfSymbols is the list of trading indicators(in this case there is AMD and MSFT)

###### example 1
vwap [trade; 2019.10.03; 2019.10.05; `AMD`MSFT]

###### example 2
vwap [trade; 2019.10.03; 2019.10.05; `AMD]