---

# Q Exercises
This document contains two exercises written in the **q** programming language.

---

### **Exercise 1**
The goal is to create a vector of times in ascending order. The vector should start with the current time and increment by 2-second intervals. Then perform the following steps:
1. Pick an arbitrary time, `t`, from the vector.
2. Find the position of `t` in the vector.
3. Adjust the vector to include only elements greater than or equal to `t` (including `t` itself).

#### **Solution**
The solution for this exercise is implemented in the `timeVector.q` file. To run the solution, execute:

```q
q timeVector.q
```

#### **Details**
- **User Input:**
  - The user will be prompted to provide the length of the time vector (a whole number, e.g., `20`).
  - The user will also be asked to pick a number between `0` and the chosen length of the time vector to select the arbitrary time `t`.

---

### **Exercise 2**
The goal of this mini-project is to create a table holding a time series of pricing data with prices and sizes for different foreign exchange (FX) currencies. 

#### **Tasks**
1. Write a function (API) to calculate the **VWAP** (volume-weighted average price) for the data.
2. Optionally, extend the project to include a **TWAP** (time-weighted average price) function.

---

#### **Project Outcomes**
The project will include the following five deliverables:

1. **Input File:** A CSV file with generated data.
2. **VWAP Function:** A function that calculates the VWAP for a given time range and list of symbols.
3. **Q Process Command:** A command to start a q process that loads the VWAP function.
4. **Function Usage Examples:** Demonstrations of how to call the function.
5. **Tests:** Validation of the code and results.

---

#### **Input File**
The input file is named `trade.csv`. It contains the trade data used for the VWAP calculation.

---

#### **VWAP Function**
The formula for VWAP was taken from [this article on Medium](https://medium.com/@financial_python/building-a-vwap-indicator-in-python-81ff9157fb13). 

The function is implemented in the `vwap.q` file.

---

#### **Loading the Data and Function**
To begin, load the `trade.csv` data into a table using the following code:
```q
colnames: `date`open`high`low`close`volume`sym
.Q.fs[{`trade insert flip colnames!("DFFFFIS";",")0:x}]`:trade.csv
```

Next, load the VWAP function:
```q
\l Q_playground/function_vwamp.q
```

---

#### **Function Usage**
The `vwap` function can be called as follows:

```q
vwap [data; startDate; endDate; listOfSymbols]
```

- **`data`**: The table containing trade data with the columns: `date`, `open`, `high`, `low`, `close`, `volume`, and `sym`.
- **`startDate` / `endDate`**: The time range for which to calculate VWAP.
- **`listOfSymbols`**: A list of trading symbols (e.g., `AMD`, `MSFT`).

---

#### **Examples**

1. **VWAP for Multiple Symbols:**
   ```q
   vwap [trade; 2019.10.03; 2019.10.05; `AMD`MSFT]
   ```

2. **VWAP for a Single Symbol:**
   ```q
   vwap [trade; 2019.10.03; 2019.10.05; `AMD]
   ```

---
