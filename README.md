Airbnb San Francisco Market Analysis
Course: MSMI 603 – Applied Statistics in Marketing Intelligence
Authors: Sean McDevitt, Taiyi Huang, Jayce Guan, Quan Nguyen
Date: December 12, 2024

Overview
This project applies data-driven analytics to understand the San Francisco Airbnb market, providing recommendations for host recruitment strategy. Using detailed listing and review data, we answer three critical business questions:

Which types of listings should Airbnb prioritize for recruitment?

Is it more effective to focus on individual hosts or company hosts?

Which amenities should Airbnb encourage hosts to offer?

Our methodology combines descriptive statistics, regression modeling, and data visualization in R to deliver actionable insights.

Repository Structure
Final Project.R
Complete R script for data cleaning, exploratory analysis, regression modeling, and visualization.
Key analyses include:

Room type and guest ratings

Host type and amenities effects

Text mining of reviews for amenity mentions

Stats Final Project Written Report.docx
Comprehensive written report with methodology, findings, interpretations, and strategic recommendations.

SF_Listings.csv
Main dataset: San Francisco Airbnb listings.

SF_Reviews.csv
Supplementary dataset: Guest reviews for text and sentiment analysis.

How to Run the Analysis
Clone or download this repository.

Place SF_Listings.csv and SF_Reviews.csv in your working directory.

Open Final Project.R in RStudio or your preferred IDE.

Run the script sequentially to reproduce all results, tables, and visualizations.

Key Insights
Entire homes/apartments consistently receive the highest guest ratings.

Individual hosts outperform companies in guest ratings, even when controlling for amenities.

Outdoor furniture is the only amenity with a significant positive effect on ratings; surprisingly, basic amenities like Wi-Fi and TV are associated with lower satisfaction, suggesting potential quality or expectation issues.

Visual Outputs
The project generates the following key visualizations:

Average ratings by room type

Ratings comparison: Individual vs. company hosts

Amenity effects on guest satisfaction (regression plots)

Most mentioned amenities in guest reviews (word clouds/frequency charts)

Contact
Questions or suggestions?
Contact: Quan Nguyen (qhnguyen5@dons.usfca.edu)
Or open an issue on GitHub.

<sub>This project was completed as part of the MSMI program at the University of San Francisco for educational purposes.</sub>
