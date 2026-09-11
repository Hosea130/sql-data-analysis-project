import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt

# Connect to MySQL
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="1234567Tt.",
    database="company_finance"
)

print("Connected to MySQL successfully!")

# Load data
query = "SELECT * FROM company_finance"

df = pd.read_sql(query, connection)

connection.close()

print("\nData loaded successfully!")
print(df)

#check data 
print("\nDataset Information")
print("-------------------")

print("Rows:", df.shape[0])
print("Columns:", df.shape[1])

print("\nMissing Values:")
print(df.isnull().sum())

#Gross profit
df["Gross_Profit"] = df["Revenue"] - df["Cost"]

#Net profit 
df["Net_Profit"] = (
    df["Revenue"]
    - df["Cost"]
    - df["Operating_Expense"]
)

#Profit Margin
df["Profit_Margin"] = (
    df["Net_Profit"] / df["Revenue"]
) * 100

total_revenue = df["Revenue"].sum()
total_cost = df["Cost"].sum()
total_expenses = df["Operating_Expense"].sum()
total_profit = df["Net_Profit"].sum()

profit_margin = (
    total_profit / total_revenue
) * 100

print("\n==============================")
print("COMPANY FINANCIAL PERFORMANCE")
print("==============================")

print(f"Revenue: R{total_revenue:,.2f}")
print(f"Cost: R{total_cost:,.2f}")
print(f"Operating Expenses: R{total_expenses:,.2f}")
print(f"Net Profit: R{total_profit:,.2f}")
print(f"Profit Margin: {profit_margin:.2f}%")

# Product profitability
product_analysis = (
    df.groupby("Product")
    .agg(
        Revenue=("Revenue", "sum"),
        Cost=("Cost", "sum"),
        Net_Profit=("Net_Profit", "sum")
    )
    .sort_values("Net_Profit", ascending=False)
)

print("\n==============================")
print("PRODUCT PROFITABILITY")
print("==============================")

print(product_analysis)

# REGIONAL PERFORMANCE
region_analysis = (
    df.groupby("Region")
    .agg(
        Revenue=("Revenue", "sum"),
        Cost=("Cost", "sum"),
        Net_Profit=("Net_Profit", "sum")
    )
    .sort_values("Revenue", ascending=False)
)

print("\n==============================")
print("REGIONAL PERFORMANCE")
print("==============================")

print(region_analysis)

# MONTHLY PERFORMANCE 
df["Date"] = pd.to_datetime(df["Date"])

monthly_analysis = (
    df.groupby(df["Date"].dt.to_period("M"))
    .agg(
        Revenue=("Revenue", "sum"),
        Cost=("Cost", "sum"),
        Net_Profit=("Net_Profit", "sum")
    )
)

print("\n==============================")
print("MONTHLY PERFORMANCE")
print("==============================")

print(monthly_analysis)

# visualize monthly revenue
monthly_analysis["Revenue"].plot(
    kind="line",
    marker="o",
    figsize=(8, 5)
)

plt.title("Monthly Revenue")
plt.xlabel("Month")
plt.ylabel("Revenue (R)")
plt.grid(True)

plt.tight_layout()
plt.show()