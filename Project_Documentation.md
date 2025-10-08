# 🚚 Supply Chain Market Analytics SQL Project  
### *Data-Driven Root Cause Analysis on Market Delivery Performance*  

---

## 🧩 Project Overview  
This SQL-based analytics project investigates **delivery delays across different markets** in a global supply chain dataset.  
It explores **why** certain regions underperform in on-time delivery (OTD) and aims to identify **actionable insights** that could improve operational efficiency.

Unlike simple reporting, this project follows a **true analytical investigation** — forming a hypothesis, testing it, rejecting it, and pivoting toward root cause analysis.

---

## 🎯 Objectives  
✔️ Evaluate market-level OTD performance and rank by severity of delay.  
✔️ Detect delivery delay patterns and volatility across shipping modes.  
✔️ Test hypotheses related to performance and revenue.  
✔️ Identify the root causes behind poor OTD performance.  
✔️ Deliver actionable recommendations for supply chain optimization.  

---

## 🧠 Hypothesis & Outcome  
> **Initial Hypothesis:** Markets with higher revenue tend to perform better in delivery (higher OTD rates).  

**Result:** ❌ *Hypothesis Rejected.*  
The analysis proved that high-revenue markets do **not** necessarily deliver efficiently.  
Some top-earning markets were among the worst in average delivery delays.  

**Next Step:** The investigation shifted toward understanding **what operational factors** (e.g., shipping mode, destination, product category) were driving the delays.

---

## 🔍 Deep Dive Focus  
- Market-level comparison of OTD rates and average delay days.  
- Ranking markets by **revenue vs. delay** to identify high-impact pain points.  
- Evaluating **shipping mode performance** within each key market.  
- Mapping **origin–destination routes** to detect geographical inefficiencies.  
- Investigating product categories, payment types, and fulfillment patterns to trace recurring issues.  

---

## 📊 Key Insights  
📈 **Performance Gaps:** Several high-revenue markets show poor OTD, revealing underlying inefficiencies.  
🚢 **Mode Impact:** “Second Class” shipping mode records the **highest delay (avg. 2.5 days)** — the key contributor to late deliveries.  
💰 **Revenue ≠ Reliability:** Markets performing well in revenue often fail operationally.  
🌍 **Market Variability:** Delay severity and consistency vary significantly between markets.  
⚙️ **Operational Bottlenecks:** Certain combinations of markets + modes consistently underperform, signaling systemic issues rather than one-time events.  

---

## 🧰 Tech Stack  
| Tool | Purpose |
|------|----------|
| **SQL (MySQL)** | Data cleaning, aggregation, hypothesis testing, and analytics |
| **Power BI (optional)** | Visualization and exploratory validation |
| **Git + GitHub** | Version control and professional project organization |

---

## 📂 Project Structure  
📦 Supply_Chain_SQL_Analytics
│
├── 01_data_cleaning.sql
├── 02_market_performance_analysis.sql
├── 03_shipping_mode_analysis.sql
├── 04_root_cause_analysis.sql
├── README.md
└── .gitignore


---

## 📎 Dataset  
**Source:** [DataCo Smart Supply Chain for Big Data Analysis (Kaggle)](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis)

### 📑 Dataset Overview  

| Type | File | Description |
|------|------|-------------|
| **Structured Data** | `DataCoSupplyChainDataset.csv` | Transactional and operational data — orders, markets, products, shipping, customers. |
| **Unstructured Data** | `tokenized_access_logs.csv` | Tokenized clickstream logs capturing user navigation patterns. |
| **Metadata File** | `DescriptionDataCoSupplyChain.csv` | Contains variable definitions and dataset documentation. |

---

## ✅ What I Did  
🧹 Cleaned and standardized all market-level order data for accurate OTD computation.  
📊 Tested and rejected the initial revenue–OTD hypothesis.  
🔎 Conducted shipping mode and market performance deep-dives.  
🚨 Identified “Second Class” shipping as a consistent delay driver.  
📈 Created market-level visual summaries to compare performance.  
🗂️ Documented every metric, logic, and insight in a reproducible workflow.  

---

