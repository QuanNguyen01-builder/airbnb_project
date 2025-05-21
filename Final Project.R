# Load required libraries
library(dplyr)
library(ggplot2)

# Summarize average ratings by room type
room_type_avg_ratings <- merged_data %>%
  group_by(room_type) %>%
  summarize(
    avg_rating = mean(rating, na.rm = TRUE)
  )

# Create the bar chart
ggplot(room_type_avg_ratings, aes(x = room_type, y = avg_rating, fill = room_type)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Average Ratings by Room Type",
    x = "Room Type",
    y = "Average Rating",
    fill = "Room Type"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = "Set2")


summary(lm(avg_rating ~ room_type, data = listings))

listings <- read.csv("SF_listings.csv")


individuals <- listings$host_listings_count == 1
summary(lm(data = listings, avg_rating ~ individuals))
listings$amenity_count <- sapply(strsplit(listings$amenities, ", "), length)
str(listings)

summary(lm(data = listings, avg_rating ~ individuals + amenity_count))


str(listings)


# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the dataset
file_path <- "SF_Listings.csv"
listings <- read.csv(file_path)

# Classify host types based on stricter assumption: >5 listings = Company
listings <- listings %>%
  mutate(
    host_type_stricter = ifelse(host_listings_count > 5, "Company", "Individual"),
    num_amenities = sapply(strsplit(as.character(amenities), ", "), length) # Count number of amenities
  )

# Calculate average ratings and number of amenities by host type
summary_stricter <- listings %>%
  group_by(host_type_stricter) %>%
  summarise(
    avg_rating = mean(avg_rating, na.rm = TRUE),
    avg_num_amenities = mean(num_amenities, na.rm = TRUE)
  )

# Print the summary table
print(summary_stricter)

# Visualization: Average Ratings by Host Type (Stricter Assumption)
ggplot(listings, aes(x = host_type_stricter, y = avg_rating, fill = host_type_stricter)) +
  geom_boxplot() +
  labs(
    title = "Average Ratings by Host Type (Stricter Assumption)",
    x = "Host Type",
    y = "Average Rating"
  ) +
  theme_minimal()

# Visualization: Number of Amenities by Host Type (Stricter Assumption)
ggplot(listings, aes(x = host_type_stricter, y = num_amenities, fill = host_type_stricter)) +
  geom_boxplot() +
  labs(
    title = "Number of Amenities by Host Type (Stricter Assumption)",
    x = "Host Type",
    y = "Number of Amenities"
  ) +
  theme_minimal()


ggplot(listings, aes(x = avg_rating, fill = host_type_stricter)) +
  geom_histogram(binwidth = 0.1, alpha = 0.7, position = "identity") +
  labs(
    title = "Distribution of Average Ratings by Host Type (Stricter Assumption)",
    x = "Average Rating",
    y = "Count",
    fill = "Host Type"
  ) +
  theme_minimal()


# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset (ensure the path is correct)
sf_listings <- read.csv("SF_Listings.csv")

sf_listings$amenities_count <- rowSums(sf_listings[, c("tv", "washer", "dedicated.workspace", 
                                                       "dishwasher", "security.cameras.on.property", 
                                                       "room.darkening.shades", "pets.allowed", 
                                                       "outdoor.furniture", "air.conditioning")], na.rm = TRUE)
# Filter data for analysis
sf_listings_filtered <- sf_listings %>%
  select(avg_rating, amenities_count) %>%
  filter(!is.na(avg_rating))  # Remove rows with missing ratings

# Create a scatter plot
ggplot(sf_listings_filtered, aes(x = amenities_count, y = avg_rating)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", col = "blue") +
  labs(
    title = "Impact of Number of Amenities on Average Rating",
    x = "Number of Amenities",
    y = "Average Rating"
  ) +
  theme_minimal()


# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset (ensure the path is correct)
sf_listings <- read.csv("SF_Listings.csv")

# Calculate the number of amenities per listing
sf_listings$amenities_count <- rowSums(sf_listings[, c("tv", "washer", "dedicated.workspace", 
                                                       "dishwasher", "security.cameras.on.property", 
                                                       "room.darkening.shades", "pets.allowed", 
                                                       "outdoor.furniture", "air.conditioning")], na.rm = TRUE)

# Classify host type based on the number of listings
sf_listings <- sf_listings %>%
  mutate(host_type = ifelse(host_listings_count <= 1, "Individual", "Company"))

# Filter data for analysis
sf_listings_filtered <- sf_listings %>%
  select(avg_rating = avg_rating, amenities_count, host_type) %>%  # Replace with correct rating column name
  filter(!is.na(avg_rating))  # Remove rows with missing ratings

# Create a regression model
model <- lm(avg_rating ~ host_type + amenities_count, data = sf_listings_filtered)

# Generate predictions for visualization
predictions <- sf_listings_filtered %>%
  mutate(predicted_rating = predict(model, .))

# Create a scatter plot with regression lines
ggplot(predictions, aes(x = amenities_count, y = avg_rating, color = host_type)) +
  geom_point(alpha = 0.6) +
  geom_line(aes(y = predicted_rating), size = 1) +
  labs(
    title = "Impact of Host Type and Amenities on Ratings",
    x = "Number of Amenities",
    y = "Average Rating",
    color = "Host Type"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

install.packages("tidytext")

# Load necessary libraries
library(dplyr)
library(tidyr)
library(ggplot2)
library(tidytext)
library(stringr)

# Load the dataset
reviews <- read.csv("SF_reviews.csv")  # Replace with your file name

# Check the structure of the dataset
str(reviews)

# Assume the review comments are stored in a column named "review_text"
# Convert the text to lowercase for consistent analysis
reviews <- reviews %>%
  mutate(review_text = tolower(comments))

# Define a list of amenities to search for
amenities <- c("wi-fi", "wifi", "kitchen", "workspace", "desk", 
               "outdoor", "hot tub", "patio", "balcony")

# Create a binary indicator for each amenity in the reviews
for (amenity in amenities) {
  reviews[[amenity]] <- ifelse(str_detect(reviews$review_text, amenity), 1, 0)
}

# Summarize the counts of each amenity mention
amenity_counts <- reviews %>%
  summarize(across(all_of(amenities), sum)) %>%
  pivot_longer(cols = everything(), names_to = "amenity", values_to = "mentions")

# Visualize the counts of mentions
ggplot(amenity_counts, aes(x = reorder(amenity, mentions), y = mentions, fill = mentions)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(
    title = "Frequency of Amenity Mentions in Reviews",
    x = "Amenity",
    y = "Number of Mentions"
  ) +
  theme_minimal()

# Load necessary libraries
library(dplyr)

# Load the dataset
listings <- read.csv("SF_listings.csv")  # Replace with your dataset file name

# Example dataset preparation (Ensure your dataset has these columns or update accordingly)
# Assuming amenities are binary columns (1 = present, 0 = absent) and average ratings are in "avg_rating"
listings <- listings %>%
  mutate(
    outdoor_space = as.numeric(outdoor_space),  # Binary: 1 if present, 0 otherwise
    dedicated_workspace = as.numeric(dedicated_workspace),
    wifi = as.numeric(wifi),
    kitchen = as.numeric(kitchen),
    hot_tub = as.numeric(hot_tub)
  )

# Run the regression model
amenities_model <- lm(avg_rating ~ outdoor_space + dedicated_workspace + wifi + kitchen + hot_tub, data = listings)

# View the summary of the regression results
summary(amenities_model)

# Regression formula
# Corrected regression formula
summary(lm(data = listings, avg_rating ~ outdoor.furniture + dedicated.workspace + wifi + kitchen + tv)

grep("outdoor", colnames(listings), value = TRUE)
# Load ggplot2 library
library(ggplot2)

# Create a data frame for the chart
data <- data.frame(
  Amenity = c("Outdoor Furniture", "Dedicated Workspace", "Wi-Fi", "Kitchen", "TV"),
  Coefficient = c(0.113, 0.024, -0.079, -0.001, -0.075),
  p_value = c(0.001, 0.105, 0.0009, 0.934, 0.000000268)
)

# Add a significance column based on p-value
data$Significance <- ifelse(data$p_value < 0.05, "Significant", "Not Significant")

# Create the bar chart
ggplot(data, aes(x = Amenity, y = Coefficient, fill = Significance)) +
  geom_bar(stat = "identity", position = "dodge", alpha = 0.8) +
  geom_text(aes(label = paste0("p = ", format(p_value, digits = 3))),
            vjust = ifelse(data$Coefficient > 0, -0.5, 1.5), size = 4) +
  scale_fill_manual(values = c("Significant" = "green", "Not Significant" = "gray")) +
  labs(
    title = "Effect of Amenities on Ratings",
    x = "Amenity",
    y = "Coefficient (Effect on Ratings)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 12)
  ) +
  geom_hline(yintercept = 0, color = "black", linetype = "dashed", size = 0.8)

