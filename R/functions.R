#' Fit a model of life expectancy by year
#'
#' @param data Tibbe; Input gapminder data for one country. Must include columns
#' 'lifeExp', 'year_rel', and 'country'
#'
#' @return Tibble; results of fitting a linear model of life expectancy by year
#' 
fit_life_exp_mod <- function(data) {
  lm(lifeExp ~ year_rel, data) %>%
    tidy() %>%
    mutate(country = unique(data$country))
}