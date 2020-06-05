# -*- coding: utf-8 -*-
"""
Created on Fri Jun  5 12:51:27 2020

@author: sami
"""

## This program reads the csv files located in the plots folder and plots bar
## graphs to illustrate any trends in the data.

import pandas as pd
import matplotlib.pyplot as plt
import os

# This function creates a bar plot using the x and y series, 
# and the title, the x-axis label, and the y-axis label
def plot(x,y,title,xlabel,ylabel):
    # plt.bar(df.iloc[0],df.iloc[1])
    plt.bar(x,y)
    plt.title(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    
    fig = os.path.join("plots",title)  
    plt.savefig(fig)
    plt.show()
 
# Load the hired_by_month.csv file, the file that contains the overall 
# hiring numbers grouped by month-of-year.
hired_by_month = pd.read_csv("hired_by_month.csv")

# Plot the hired_by_month data
plot(hired_by_month["hire_month"],
     hired_by_month["hire_num"],
     "Hiring Trends by Month",
     "Month of Year",
     "Hired Count")

# Load the hired_by_dept_month file, the file that contains hiring numbers
# grouped by department and then grouped by month.
hired_by_dept_month = pd.read_csv("hired_by_dept_month.csv")

# Get the list of company departments 
depts = hired_by_dept_month["department"].unique()

# For each department, plot the monthly hiring data
for dept in depts:
    hired_by_month_dept = hired_by_dept_month.loc[hired_by_dept_month.department==dept]
    # print(hired_by_month_dept)
    plot(hired_by_month_dept["hire_month"],
         hired_by_month_dept["hire_num"],
         "Hiring Trends by Month, " + dept + " department",
         "Month of Year",
         "Hired Count")

# Load the hiring data grouped by year
hired_by_year = pd.read_csv("hired_by_year.csv")

# Create a bar graph of hired year vs number hired
plot(hired_by_year["hire_year"],
     hired_by_year["hire_num"],
     "Hiring Trends by Year",
     "Year",
     "Hired Count")

# Load the hired_by_dept_year data
hired_by_dept_year = pd.read_csv("hired_by_dept_year.csv")

# For each department, plot the yearly hiring data
for dept in depts:
    hired_by_year_dept = hired_by_dept_year.loc[hired_by_dept_year.department==dept]
    plot(hired_by_year_dept["hire_year"],
         hired_by_year_dept["hire_num"],
         "Hiring Trends by Year, " + dept + " department",
         "Year",
         "Hired Count")
    