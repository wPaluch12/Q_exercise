\ this function is calculating the vwap metric
calculateVwap: {[data; start; end; symbols] select sum[ (( high + low + close ) % 3 ) * volume ] %  sum volume by sym from data where date within (start;end), sym in symbols }

\ here we check the dates if ok then we can calculate the metric if not throw an error
validArgs: {[data; start; end; symbols] $[ ((type start)=-14h) and ((type end)=-14h) and (start<=end) ; [ calculateVwap[data; start; end; symbols] ] ; [show "Error: You entered wrong start and end dates"] ]}

\ main function calls the validation first
vwap: {[data; start; end; symbols] validArgs[data; start; end; symbols]}
