# Supply Chain Delivery & Performance Analysis

## Project Background  

In this project, I explored a real-world supply chain dataset to uncover what drives market performance, how delivery efficiency interacts with revenue, and why some shipping modes struggle despite strong sales.  

The company operates globally in the e-commerce industry, shipping products across markets like Europe, LATAM, Africa, Pacific Asia, and USCA. As a data analyst on the operations team, my goal was to investigate delivery delays, identify underperforming shipping modes, and understand the relationship between on-time delivery (OTD) and business revenue.  

The analysis began with a key hypothesis:  
**“If we improve on-time delivery (OTD), total revenue and order volume will also increase.”**  

That assumption didn’t hold but what I found instead revealed how operational design and delivery trade-offs shape performance more than timing ever could.  

---

## Data Structure and Initial Checks  

The dataset includes both structured and unstructured data sources:  

- **DataCoSupplyChainDataset.csv** → contains all sales, delivery, and order-level data across multiple markets.  
- **tokenized_access_logs.csv (Clickstream)** → captures user activity and browsing behavior.  
- **DescriptionDataCoSupplyChain.csv** → provides definitions for all columns in the structured dataset.  

Before diving into analysis, I ensured the data was clean and consistent:  
- Standardized date formats for order and delivery timestamps.  
- Verified that product categories, markets, and regional hierarchies were aligned.  
- Checked for missing delivery data and duplicates in key transaction records.  
- Created derived fields for OTD, delay days, and YoY performance.  

---

## Executive Summary  

From 2015 to 2017, the company generated roughly **$20.2M** in revenue across five major markets. Revenue peaked in 2015 (around **$7M**), fluctuated through 2016–2017, and ended slightly lower but more stable.  

**Europe** emerged as the top-performing market, while **Africa** — despite having 48 active countries — contributed the least to overall revenue. Interestingly, the **US (within the USCA market)** recorded exceptionally high sales in short bursts, reaching about **$250K** in a few months between April and August.  

The most significant dip occurred in **April 2016**, primarily driven by a slowdown in **Europe’s order volume**. Since Europe represents the largest market, any fluctuation there had an outsized effect on overall performance.  

Through deeper analysis, I found that while order volume fluctuations drove revenue peaks and dips, delivery efficiency (OTD) wasn’t strongly correlated with revenue. Shipping faster didn’t necessarily mean selling more — meaning something deeper was shaping the company’s growth.  



<img width="1303" height="730" alt="Screenshot 2025-12-06 235534" src="https://github.com/user-attachments/assets/429b8b70-690c-4e1d-b4f0-b13db74baf8a" />




---

## Insights Deep Dive  

### Shipping Mode Performance  

At this stage, I shifted focus from markets to shipping modes, aiming to understand whether the delays were linked to transportation type rather than geography.  

The scatter plot comparing revenue vs. average delay revealed a clear trade-off: higher-revenue shipping modes often showed longer delays, especially **Second Class** shipments. This shifted the narrative — the challenge wasn’t customer demand, it was operational execution.  

- **Second Class** shipping generated one of the highest average delays (~2.5 days) yet ranked third in total revenue. Customers kept choosing it, suggesting price or availability outweighed punctuality.  
- **Standard Class** emerged as the most reliable performer. It had balanced revenue, strong OTD, and — interestingly — it was the **only mode that delivered orders in advance**.  
- **First Class**, despite being the premium option, consistently showed a high rate of late or cancelled deliveries, making it the weakest in delivery reliability.  
- Across all modes, **Late Delivery** dominated the delivery status counts. However, when orders did arrive early (“Advanced Delivery”), they tended to align with higher revenue and smoother operations — again, tied exclusively to **Standard Class**.  

When testing the hypothesis — “Does improving OTD increase total revenue?” — the data said no.  

The **Pearson correlation** between OTD and revenue was weak, meaning that improving on-time delivery alone wouldn’t directly boost sales. Profitability leaned more on **order volume and shipping mode efficiency** than delivery speed.  

**Key takeaway:**  
Customers tolerate delay when the trade-off is convenience or lower cost. Standard Class quietly proved operational excellence that should be scaled across other modes.  

<img width="1498" height="442" alt="22222" src="https://github.com/user-attachments/assets/86cfd721-4165-49a4-be64-df73d190839e" />



---

### Root Cause Analysis  

After identifying the underperforming modes, I focused on understanding **why** the delays occurred.  

The problem didn’t lie in the shipping mode itself but in **where the shipments originated**. Two states repeatedly surfaced as pain points: **Puerto Rico (PR)** and **California (CA)**.  

- Both states handled the largest order volumes and contributed the highest revenue totals, especially among delayed shipments.  
- When plotting average delay days vs. total sales, PR and CA consistently appeared as **high-revenue, high-delay clusters**.  
- The departments most affected were **Footwear, Apparel, Tech, Outdoors, and Golf** — categories that also had the highest cross-market demand.  
- These findings suggest that warehouse congestion and extended transport distances from these states were the main drivers of delay.  

**In plain terms:**  
The company’s most profitable markets rely too heavily on two overburdened states for fulfillment. As a result, even a strong sales performance is undermined by recurring delivery inefficiencies.  



<img width="1498" height="381" alt="33333" src="https://github.com/user-attachments/assets/d6c731df-8abf-4cdc-88d2-541ffea6e416" />



---

**Recommendations:**  
- Redistribute order processing and fulfillment load from PR and CA to less saturated warehouses.  
- Streamline Second Class routes or merge overlapping paths with Standard Class to reduce redundancy.  
- Develop a predictive delay model that flags high-risk orders before allocation based on route and warehouse congestion.  

This shift would reduce the systemic bottleneck at its source — not by pushing orders to ship faster, but by sending them through smarter routes in the first place.  

---

