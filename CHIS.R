---
title: "CHIS.R"
author: "H Karen Tam"
date: "November 12, 2017"
output: html_document
---

```{r setup, include=FALSE}

```
#### Exploring Data Exercise - mosaic plot 

```{r}
# Explore the dataset with summary and str
summary(adult)

str(adult)

# Age histogram
ggplot(adult, aes (x = SRAGE_P)) +
  geom_histogram()

# BMI histogram
ggplot(adult, aes (x = BMI_P)) +
  geom_histogram()

# Age colored by BMI, default binwidth
ggplot(adult, aes (x = SRAGE_P, fill= factor(RBMI))) +
  geom_histogram(binwidth = 1)

```
#### Binwidth

What is this binwidth for the age variable, SRAGE_P, of the adult dataset?

30 bin, 2.23 binwidth.

#### Data Cleaning

```{R}
# Remove individual aboves 84
adult <- adult[adult$SRAGE_P <= 84]

# Remove individuals with a BMI below 16 and above or equal to 52
adult <- adult[adult$BMI_P >= 16 & adult$BMI_P <= 52]

# Relabel the race variable: (values are numbers in data frame) 

adult$RACEHPR2 <- factor(adult$RACEHPR2, labels = c("Latino", "Asian", "African American", "White"))

# Relabel the BMI categories variable: (values are numbers in data frame)

adult$RBMI <- factor(adult$RBMI, labels = c("Under-weight", "Normal-weight", "Over-weight", "Obese"))

```

#### Multiple Histograms Exercise

```{r}
# The dataset adult is available

# The color scale used in the plot
BMI_fill <- scale_fill_brewer("BMI Category", palette = "Reds")

# Theme to fix category display in faceted plot
fix_strips <- theme(strip.text.y = element_text(angle = 0, hjust = 0, vjust = 0.1, size = 14),
                    strip.background = element_blank(),
                    legend.position = "none")

# Histogram, add BMI_fill and customizations
ggplot(adult, aes (x = SRAGE_P, fill= factor(RBMI))) +
  geom_histogram(binwidth = 1) +
  fix_strips + BMI_fill + facet_grid(.~RBMI) + theme_classic()

```

#### Exercise for Histograms with values from other column 

