# Renting Barcelona
This project consist in create a database in MySQL for a renting company. 

## Project Overview
This project involves creating a MySQL database for a company specializing in temporary and long-term rentals in Barcelona. 
The objective is to analyze and optimize market strategies to enhance services across various neighborhoods and districts, recognizing the growth in the tourist rental market driven by platforms like Airbnb.

## Objective
- Analyze Barcelona's rental market to optimize strategy.
- Provide enhanced services tailored to specific neighborhoods and districts.

## Key Questions Explored
- Which districts have the highest concentration of tourist rentals?
- What are the average rent prices by district and neighborhood?
- What is the average price per night for Airbnb rentals by district?
- Which neighborhoods have high concentrations of tourists versus locals?

### Data Sources:
- [Airbnb Barcelona Dataset](https://www.kaggle.com/datasets/thedevastator/comparative-analysis-of-airbnb-prices-in-barcelo)
- [Housing Prices in Barcelona Dataset](https://www.kaggle.com/datasets/thedevastator/housing-prices-in-barcelona)
- [Barcelona Price Rent Dataset](https://www.kaggle.com/datasets/salaudeentaofeek/barcelona-price-rent-dataset-from-2014-2022)
- [Percentage of Foreign & Locals Dataset](https://www.kaggle.com/datasets/macmotx/barcelona-data-airbnb-listings-10-years?select=bcn_dataset2015_2019.csv)


## Methodology

### Data Collection
Datasets were sourced from Kaggle, including information on Airbnb listings, rental prices, and population statistics.

### Data Cleaning
Data was cleaned and organized using the following steps:
- Removed duplicates and irrelevant columns.
- Standardized formats (e.g., date, currency).
- Handled missing values through imputation or removal.

### Database Creation
1. **Table Design**:
    - Designed tables to store data on districts, neighborhoods, populations, rents, and Airbnb listings.
    - Defined primary keys, foreign keys, and indices to optimize query performance.

2. **Import Data into MySQL**:
    - Utilized `LOAD DATA INFILE` for bulk data import.
    - Verified data integrity post-import.

3. **Preprocessing**:
    - Utilized `unidecode` library for data normalization.
    - Cleaned and formatted data using Jupyter Notebook with `unidecode`.



