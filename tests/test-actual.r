## Was having problems with directory navigation when running testthat::test_dir("tests")
## This just sets the wd to the main directory 
setwd(paste(getwd(), "..", sep="/"))

source("code/run_linear_reg.r")

test_that("Testing beta coefficient", {
    expect_equal(
        as.numeric(model$coefficient[2]), ## Named numeric was throwing error
        expected = 0.00076,
        tolerance = 0.0001
    )
})

test_that("Testing number of observations", {
    expect_equal(
        model$nobs, 
        1704
    )
})

library(testdat)
source("code/get_gapminder_data.r")

test_that("Testing data", {
    expect_unique(
        data = gapminder, 
        c(year, country)
    )
    expect_range(
        data = gapminder, 
        gdpPercap,
        0, 
        1e6
    )
    expect_values(
        data = gapminder,
        continent,
        c("Asia", "Europe", "Africa", "Americas", "Oceania")
    )
})