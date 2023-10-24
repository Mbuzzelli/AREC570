*Maria Buzzelli
*AREC 570 Reproducibility Excercise

*Read the 1952-1967 data into your favorite program
clear all
import delimited "/Users/mariabuzzelli/Desktop/gdp_le_52-67.csv"

*Create a single table spanning 1952-1967 with the following columns: continent, country, year, lifeExp, pop, and gdp.
ssc install tabout
tabout continent country year pop gdp using "table_output.txt", replace

*Calculate gdp per capita and name it gdpPercap

gen gdpPercap = 0
replace gdpPercap = gdp/pop 

*Visualize life expectancy and gdp per capita over time for Canada in the 1950s and 1960s using a line plot.
keep if country == "Canada" & year >= 1952 & year <= 1967
twoway (line lifeexp year, lc(blue) lw(thick)) ///
       (line gdpPercap year, lc(red) lw(thick)), ///
       title("Life Expectancy and GDP per Capita Over Time in Canada") ///
       xtitle("Year") ytitle("Life Expectancy / GDP per Capita") ///
       legend(label(1 "Life Expectancy") label(2 "GDP per Capita"))

*Regress life expectancy on gdp per capita and display the regression table
regress lifeexp gdpPercap
