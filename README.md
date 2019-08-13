# R-function: plot_lm()
R function to easily plot linear or higher order models using an explanatory and a response variable.
Includes various options of graphical adjustments, prediction of confidence intervals, adding to existing plots and more. 

## Usage
```
x <- c(32,45,64, 80,96,110,118,126,144,152.5,158)
y <- c(65,80,94,100,106,108.5,100,86,64,35.3,15)
```
### Linear model
If only explanatory and response data are provided, a linear model and 95% confidence interval will be used
```
plot_lm(expl.data = x, resp.data = y)
```
### Higher order models
Degrees of freedom for the model can be set using the "d" option, default = 1
```
plot_lm(expl.data = x, resp.data = y, d = 2)
```
