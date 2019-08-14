# R-function: plot_lm()
R function to easily plot linear or higher order models using an explanatory and a response variable.
Includes various options of graphical adjustments, prediction of confidence intervals, adding to existing plots and more. 

Default model formula: lm(resp.data ~ expl.data)
## Usage
```
x <- c(32,45,64, 80,96,110,118,126,144,152.5,158)
y <- c(65,80,94,100,106,108.5,100,86,64,35.3,15)
```
### Linear model
If only explanatory and response data are provided, a linear model and 95% confidence interval will be used
Adjusted r² and model p-value will be printed in the console. In this case a linear model does not descibe the data very well and the model is not significant (r² = 0.121, p.val = 0.157)   
```
plot_lm(expl.data = x, resp.data = y)
```
### Higher order models
Degrees of freedom for the model can be set using the "d" option, default = 1
```
plot_lm(expl.data = x, resp.data = y, d = 2)
```

### Customization
```
plot_lm(expl.data = x, resp.data = y, d = 2, pch = 21, bg = "deepskyblue", cex = 2, las = 1,
        main = "x ~ y²", xlab = "x value", ylab = "y value",
        mod.pos = "back", l1.col = "black", l2.col = "lightgrey", plot.result = "bottomleft")
```
### Full List of options
```


resp.data         numeric vector of response Variables 
expl.data         numeric vector of explanatory variables
d                 degrees of freedom  

l1.col            color of model line 
l2.col            color of lines for predicted confidence interval
mod.pos           positions model lines in front or behind points (options: "front" (default), "back")
plot.result       toggle if model result (r² and p-val) should be displayed in plot. (options: "topright", "topleft,
                  "bottomright", "bottomleft", "center")
predict           set confidence interval. default: 0.95. If set to FALSE no predictions are made

main              plot title
xlab              name of x-axis
ylab              name of x-axis
col               color of symbols specified in "pch"
bg                fill color of symbols specified in "pch" if available 
pch               set point character         
lty               set linetype
lwd               set linewidth
axes              should axes be plotted? default = TRUE
ylim              set limits for y-axis using c(lower_limit, upper_limit)
xlim              set limits for x-axis using c(lower_limit, upper_limit)
add               should point and model be added to existing plot? default = FALSE
```
