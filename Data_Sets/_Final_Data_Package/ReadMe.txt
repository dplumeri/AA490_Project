===============================
ANALYTICS ANONYMOUS 

Scott Bagley 

Austin Bertrand 

Robert Michell 

Dan Plumeri 

-------------------------------
Instructions for Genrating Code
================================

Step 1. Labor Recoding/Cleaning
	a. In the _Final_Data_Package, open the Labor.sas File.
	b. Adjust the Libname line so that it reflects a directory native to your machine.
	c. Run the code.
	d. In the Step_1 Library, you should now have a file caled Og_labor_and_join and
	Cross_join_labor_2. These are your input and scoring files respectively.
Step 2. Disease Recoding/Cleaning
	a. In the _Final_Data_Package folder, open the Disease.sas File.
	b. Adjust the Libname line so that it reflects a directory native to your machine.
	c. Run the code.
	d. In the Step_2 Library, you should now have a file called Disease_historic_join_1
	and Disease_future_join_1. These are your input and scoring files respectively.
Step 3. Labor Modeling
	a. In the _Final_Data_Package, under the Model Packages folder, open 
	the Labor_Foce_Model_Package.spk. This is the model for Labor.
	b. In the model, disconnect all of the links of each modeling node to the model
	comparrison node with the exception of the "Champion Model" Node
	c. Run the model
Step 4. Disease Modeling
	In the _Final_Data_Package, under the Model Packages folder, open 
	the Labor_Foce_Model_Package.spk. This is the model for Labor.
	b. In the model, disconnect all of the links of each modeling node to the model
	comparrison node with the exception of the "Champion Model" Node
	c. Run the model
Step 5. Social Security
	a. In the _Final_Data_Package, open the Social_Security.sas File.
	b. Adjust the Libname line so that it reflects a directory native to your machine.
	c. Run the code. 
	***YOU MAY HAVE TO RUN THIS CODE TWICE***
	d. Results for each scenario can be found in the SS_Calc Library. A more detailed 		description of each can table be found in the report. 