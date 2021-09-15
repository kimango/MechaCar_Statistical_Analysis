# MechaCar_Statistical_Analysis

## Overview
The project used the statistics and hypothesis tests to check the series of datasets from the automotive industry. 

## Linear Regression to Predict MPG 
![Linear Regression](https://github.com/kimango/MechaCar_Statistical_Analysis/blob/main/Module%2015th%20Images/Linear%20Regression.PNG)
 * The R-square is 0.71 or 71% of the variations in mpg can be descried by changes in the vehicle length, the vehicle weight, the spoiler angle, the drivetrain and the ground clearance. We can consider this linear model as structured to predict mpg of MechaCar models.
 
## Summary of Suspension Coils
  * All Manufucturing Lot
![All Manufucturing](https://github.com/kimango/MechaCar_Statistical_Analysis/blob/main/Module%2015th%20Images/Suspension%20Coil%20Mean.PNG)

   * Each Manufucturing Lot
![Each Manufucturing](https://github.com/kimango/MechaCar_Statistical_Analysis/blob/main/Module%2015th%20Images/Manufacturing%20lot.PNG)
   
   * The specs showed that all manufacturing lots in total with a global variance of 62.3 psi.
   * Lot 1 has a variance of 0.98 psi, Lot 2 has a variance of 7.47 psi and Lot 3 has 170.

## T-test on Suspension Coils
   * T-Test All Manufucturing Lots vs. Population Mean
   ![T-Test All Manufucturing Lots vs. Population Mean](https://github.com/kimango/MechaCar_Statistical_Analysis/blob/main/Module%2015th%20Images/T-test%20all.PNG)
     * All manufacturing lots is statistically similar to the population mean of 1498.78
     
   *  T-Test Lot 1
   ![T-Test 1](https://github.com/kimango/MechaCar_Statistical_Analysis/blob/main/Module%2015th%20Images/T-test%20Lot%201.PNG)
      
   * T-Test Lot 2
   ![T-Test 2](https://github.com/kimango/MechaCar_Statistical_Analysis/blob/main/Module%2015th%20Images/T-test%20Lot%202.PNG)
   
   *  T-Test Lot 3
   ![T-Test 3](https://github.com/kimango/MechaCar_Statistical_Analysis/blob/main/Module%2015th%20Images/T-test%20Lot%203.PNG)
      * The p-values for Lot 2 and 3 have the same significant level, so we can conclude that the PSI for Lot 2 and 3 are statistically similar to the population mean.


## Study Design
* We compare the performance of the MechaCar examples against the vehicles from the competition, we would need to perform a statistical analysis based on the following metrics:

 1. Power.
 2. Fuel economy (mpg).
 3. Braking Distance.
 
 * The null hypothesis is that each performance metrics is statistically similar between the MechaCar model and all vehicle from the other companies.
