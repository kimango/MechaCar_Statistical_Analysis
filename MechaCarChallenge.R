> library(readr)
> library(tidyverse)
> MechaCar_mpg <- read_csv("MechaCar_Statistical_Analysis/MechaCar_mpg.csv")
Rows: 50 Columns: 6                                                                                             
0s-- Column specification ------------------------------------------------------------------------------------------
  Delimiter: ","
dbl (6): vehicle_length, vehicle_weight, spoiler_angle, ground_clearance, AWD, mpg

i Use `spec()` to retrieve the full column specification for this data.
i Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(MechaCar_mpg)
> head(MechaCar_mpg)
# A tibble: 6 x 6
vehicle_length vehicle_weight spoiler_angle ground_clearance   AWD   mpg
<dbl>          <dbl>         <dbl>            <dbl> <dbl> <dbl>
  1           14.7          6408.          48.8             14.6     1  49.0
2           12.5          5182.          90               14.4     1  36.8
3           20            8338.          78.6             12.3     0  80  
4           13.4          9420.          55.9             13.0     1  18.9
5           15.4          3773.          26.1             15.1     1  63.8
6           14.5          7287.          30.6             13.1     0  48.5
> ## Linear Regression to Predict MPG
  > lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + AWD + ground_clearance,data=MechaCar_mpg)

Call:
  lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
       AWD + ground_clearance, data = MechaCar_mpg)

Coefficients:
  (Intercept)    vehicle_length    vehicle_weight     spoiler_angle               AWD  ground_clearance  
-1.040e+02         6.267e+00         1.245e-03         6.877e-02        -3.411e+00         3.546e+00  

> # Generate Summary
  > summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + AWD + ground_clearance,data=MechaCar_mpg))

Call:
  lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
       AWD + ground_clearance, data = MechaCar_mpg)

Residuals:
  Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
  vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
  vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

> library(readr)
> Suspension_Coil <- read_csv("MechaCar_Statistical_Analysis/Suspension_Coil.csv")
Rows: 150 Columns: 3                                                                                                                                  
-- Column specification -------------------------------------------------------------------------------------------
  Delimiter: ","
chr (2): VehicleID, Manufacturing_Lot
dbl (1): PSI

i Use `spec()` to retrieve the full column specification for this data.
i Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(Suspension_Coil)
> head(Suspension_Coil)
# A tibble: 6 x 3
VehicleID Manufacturing_Lot   PSI
<chr>     <chr>             <dbl>
  1 V40858    Lot1               1499
2 V40607    Lot1               1500
3 V31443    Lot1               1500
4 V6004     Lot1               1500
5 V7000     Lot1               1501
6 V17344    Lot1               1501
> # Total Summary Table
  > total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
> total_summary
# A tibble: 1 x 4
Mean Median Variance    SD
<dbl>  <dbl>    <dbl> <dbl>
  1 1499.   1500     62.3  7.89
> lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
> lot_summary
# A tibble: 3 x 5
# Groups:   Manufacturing_Lot [3]
Manufacturing_Lot  Mean Median Variance     SD
<chr>             <dbl>  <dbl>    <dbl>  <dbl>
  1 Lot1              1500   1500     0.980  0.990
2 Lot2              1500.  1500     7.47   2.73 
3 Lot3              1496.  1498.  170.    13.0  
> global_sample_table <- suspension_coil_data %>% sample_n(50)
Error in sample_n(., 50) : object 'suspension_coil_data' not found
> global_sample_table <- Suspension_Coil %>% sample_n(50)
> plt <- ggplot(Suspension_Coil,aes(x=PSI))
> plt + geom_density()
> plt <- ggplot(global_sample_table,aes(x=PSI))
> plt + geom_density()
> plt <- ggplot(global_sample_table,aes(x=log10(PSI)))
> plt + geom_density()
> plt <- ggplot(global_sample_table,aes(x=log10(PSI)))
> plt + geom_density()
> t.test(global_sample_table$PSI,mu=mean(Suspension_Coil$PSI))

One Sample t-test

data:  global_sample_table$PSI
t = 0.89414, df = 49, p-value = 0.3756
alternative hypothesis: true mean is not equal to 1498.78
95 percent confidence interval:
  1497.557 1501.963
sample estimates:
  mean of x 
1499.76 

> psi_lot1_sample <- Suspension_Coil %>% subset(Manufacturing_Lot=='Lot1') %>% sample_n(25)
> force(mean_cl_boot)
function (x, ...) 
{
  check_installed("Hmisc")
  fun <- getExportedValue("Hmisc", fun)
  result <- do.call(fun, list(x = quote(x), ...))
  rename(new_data_frame(as.list(result)), c(Median = "y", 
                                            Mean = "y", Lower = "ymin", Upper = "ymax"))
}
<bytecode: 0x000001a625e87540>
  <environment: 0x000001a626253f60>
  > t.test(psi_lot1_sample$PSI,mu=mean(Suspension_Coil$PSI))

One Sample t-test

data:  psi_lot1_sample$PSI
t = 7.6825, df = 24, p-value = 6.414e-08
alternative hypothesis: true mean is not equal to 1498.78
95 percent confidence interval:
  1499.789 1500.531
sample estimates:
  mean of x 
1500.16 

> force(stat_summary)
function (mapping = NULL, data = NULL, geom = "pointrange", 
          position = "identity", ..., fun.data = NULL, fun = NULL, 
          fun.max = NULL, fun.min = NULL, fun.args = list(), na.rm = FALSE, 
          orientation = NA, show.legend = NA, inherit.aes = TRUE, fun.y, 
          fun.ymin, fun.ymax) 
{
  if (!missing(fun.y)) {
    warn("`fun.y` is deprecated. Use `fun` instead.")
    fun = fun %||% fun.y
  }
  if (!missing(fun.ymin)) {
    warn("`fun.ymin` is deprecated. Use `fun.min` instead.")
    fun.min = fun.min %||% fun.ymin
  }
  if (!missing(fun.ymax)) {
    warn("`fun.ymax` is deprecated. Use `fun.max` instead.")
    fun.max = fun.max %||% fun.ymax
  }
  layer(data = data, mapping = mapping, stat = StatSummary, 
        geom = geom, position = position, show.legend = show.legend, 
        inherit.aes = inherit.aes, params = list(fun.data = fun.data, 
                                                 fun = fun, fun.max = fun.max, fun.min = fun.min, 
                                                 fun.args = fun.args, na.rm = na.rm, orientation = orientation, 
                                                 ...))
}
<bytecode: 0x000001a62f9d0380>
  <environment: namespace:ggplot2>
  > total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
> View(Scale)
> View(Stat)
> View(Stat)
> force(StatSum)
> total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
> total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
> t.test(psi_lot1_sample$PSI,mu=mean(Suspension_Coil$PSI))

One Sample t-test

data:  psi_lot1_sample$PSI
t = 7.6825, df = 24, p-value = 6.414e-08
alternative hypothesis: true mean is not equal to 1498.78
95 percent confidence interval:
  1499.789 1500.531
sample estimates:
  mean of x 
1500.16 

> psi_lot2_sample <- Suspension_Coil %>% subset(Manufacturing_Lot=='Lot2') %>% sample_n(25)
> psi_lot2_sample <- suspension_coil_data %>% subset(Manufacturing_Lot=='Lot2') %>% sample_n(25)
Error in subset(., Manufacturing_Lot == "Lot2") : 
  object 'suspension_coil_data' not found
> psi_lot2_sample <- Suspension_Coil %>% subset(Manufacturing_Lot=='Lot2') %>% sample_n(25)
> t.test(psi_lot2_sample$PSI,mu=mean(Suspension_Coil$PSI))

One Sample t-test

data:  psi_lot2_sample$PSI
t = 2.9254, df = 24, p-value = 0.007404
alternative hypothesis: true mean is not equal to 1498.78
95 percent confidence interval:
  1499.257 1501.543
sample estimates:
  mean of x 
1500.4 

> psi_lot3_sample <- Suspension_Coil %>% subset(Manufacturing_Lot=='Lot3') %>% sample_n(25)
> t.test(psi_lot3_sample$PSI,mu=mean(Suspension_Coil$PSI))

One Sample t-test

data:  psi_lot3_sample$PSI
t = -1.4598, df = 24, p-value = 0.1573
alternative hypothesis: true mean is not equal to 1498.78
95 percent confidence interval:
  1490.235 1500.245
sample estimates:
  mean of x 
1495.24 


                                                                             