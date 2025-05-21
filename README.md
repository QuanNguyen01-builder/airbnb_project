# Airbnb San Francisco Market Analysis

This project analyzes Airbnb listings in San Francisco using data-driven approaches to answer three key business questions for host recruitment specialists.  
**Course:** MSMI 603 - Applied Statistics in Marketing Intelligence  
**Authors:** Sean McDevitt, Taiyi Huang, Jayce Guan, Quan Nguyen  
**Date:** December 12th, 2024

## Project Overview

We explore three main questions:
1. **What types of listings should Airbnb recruit?**
2. **Should Airbnb focus on individuals or companies as hosts?**
3. **What amenities should Airbnb incentivize?**

Our approach uses descriptive statistics, regression modeling, and data visualization in R to generate actionable insights.

## File Descriptions

- **Final Project.R**  
  Contains all the R code for data cleaning, analysis, modeling, and visualization. Includes:
  - Room type and ratings analysis
  - Host type and amenities regression
  - Text analysis of reviews for amenity mentions
  - Visualization scripts

- **Stats Final Project Written Report.docx**  
  The full written report, including methodology, results, interpretations, and recommendations.

- **SF_Listings.csv**  
  Main dataset of Airbnb listings in San Francisco.

- **SF_Reviews.csv**  
  Dataset of guest reviews for text analysis.

## How to Reproduce the Analysis

1. Clone the repository.
2. Open `Final Project.R` in RStudio.
3. Ensure all datasets (`SF_Listings.csv`, `SF_Reviews.csv`) are in your working directory.
4. Run the R script step by step to reproduce tables and figures from the report.

## Main Insights

- **Entire homes consistently receive higher guest ratings.**
- **Individual hosts outperform companies in guest ratings, even after controlling for amenities.**
- **Outdoor furniture is the only amenity with a significant positive effect on ratings; Wi-Fi and TV surprisingly correlate with lower satisfaction, suggesting quality issues.**

## Visualizations

The code generates the following key visualizations:
- Average ratings by room type
- Host type vs. ratings boxplots
- Amenity effect on ratings (regression bar charts)
- Word frequency of amenities in guest reviews

## Contact

For questions, please get in touch with Quan Nguyen at qhnguyen5@dons.usfca.edu or open an issue on GitHub.

---

*This project was developed for academic purposes at the University of San Francisco.*

