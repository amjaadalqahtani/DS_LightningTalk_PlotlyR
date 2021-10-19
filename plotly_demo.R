# 1- Basic Interactive Plotting

library(tidyverse)
library(gapminder)
library(plotly)

glimpse(gapminder)
view(gapminder)
# download "CO2 emissions per person" dataset .csv file from https://www.gapminder.org/data/

co2 <- data.frame(co2_emissions_tonnes_per_person)
co2 %>%
  plot_ly(x = ~ï..country) %>%
  add_trace(y = ~X2018, type = "bar") %>%
  layout(
    title = "Co2 Emissions by Country",
    xaxis = list(title = "Country"),
    yaxis = list(title = "Co2")
  )

# Another e.g.

library(tidyverse)
library(plotly)

stringr::str_subset(objects("package:plotly"), pattern ="^add_")

airquality
airquality %>%
  plot_ly(x = ~Solar.R) %>%
  add_trace(y = ~Ozone, type = "scatter") %>%
  layout(
    title = "SolarR vs. Ozone",
    xaxis = list(title = "temp"),
    yaxis = list(title = "ozone")
  )

# 2- Animations

library(plotly)
library(gapminder)

df <- gapminder 
fig <- df %>%
  plot_ly(x = ~gdpPercap, y = ~lifeExp, 
          size = ~pop, 
          color = ~continent, 
          frame = ~year, 
          text = ~country, 
          hoverinfo = "text",
          type = 'scatter',
          mode = 'markers'
  )
fig <- fig %>% layout(
  xaxis = list(
    type = "log"
  )
)

fig <- fig %>% animation_opts(
  1000, easing = "elastic", redraw = FALSE
)

fig <- fig %>%
  animation_button(
    x = 1, xanchor = "right", y = 0, yanchor = "bottom"
  )

fig

# Another animations e.g.

library(plotly)
glimpse('https://raw.githubusercontent.com/plotly/datasets/master/2011_february_us_airport_traffic.csv')

df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2011_february_us_airport_traffic.csv')

# geo styling
g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray95"),
  subunitcolor = toRGB("gray85"),
  countrycolor = toRGB("gray85"),
  countrywidth = 0.5,
  subunitwidth = 0.5
)

fig <- plot_geo(df, lat = ~lat, lon = ~long)
fig <- fig %>% add_markers(
  text = ~paste(airport, city, state, paste("Arrivals:", cnt), sep = "<br />"),
  color = ~cnt, symbol = I("square"), size = I(8), hoverinfo = "text"
)
fig <- fig %>% colorbar(title = "Incoming flights<br />February 2011")
fig <- fig %>% layout(
  title = 'Most trafficked US airports<br />(Hover for airport)', geo = g
)

fig
