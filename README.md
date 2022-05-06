# targets_gapminder_example

An example of using the [targets R package](https://github.com/ropensci/targets) to analyze the [gapminder dataset](https://github.com/jennybc/gapminder).

## Installing R packages

`renv` is used to maintain package versions. Packages for this project can be installed with `renv::restore()`.

## Running the example

After installing packages, run `targets::tar_make()`. The analysis will run and a final report will be produced as `gapminder_report.html`.

## Continuous integration

This project [uses GitHub Actions to run the targets workflow](https://github.com/wlandau/targets-minimal#continuous-deployment) and generate the report each time a commit is pushed to the repo.

The report can be viewed at https://joelnitta.github.io/targets_gapminder_example/

## License

[Creative Commons Attribution CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode)
