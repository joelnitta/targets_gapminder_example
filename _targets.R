# Load packages
source("R/packages.R")

# Load custom functions
source("R/functions.R")

# Define workflow plan
list(
  # Import data ----
  # 'gapminder' dataset including life expectancy by year for various countries
  tar_url(gapminder_url, "https://raw.githubusercontent.com/jennybc/gapminder/main/inst/extdata/gapminder.tsv"),
  tar_target(gapminder_raw, read_tsv(gapminder_url)),
 
  # Tidy data ----
  # Add `year_rel` column starting from 0 for modeling
  tar_group_by(
    gapminder,
    mutate(gapminder_raw, year_rel = year - min(year)),
    # Group by country for looping
    country),
  
  # Fit model ----
  # Fit life expectancy by year model for each country
  tar_target(
    life_exp_mods,
    fit_life_exp_mod(gapminder),
    pattern = map(gapminder)
  ),
  
  # Report results ----
  tar_render(
    life_exp_report,
    "gapminder_report.Rmd"
  )
)
