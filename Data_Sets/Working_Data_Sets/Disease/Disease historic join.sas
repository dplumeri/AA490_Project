options user = disease;
PROC SQL;
   CREATE TABLE Disease_Historic_Join AS 
   SELECT t1.Date, 
          t1.Gender, 
          t1.Age_group, 
          t1.Population_in_thousands, 
          t2.Disease, 
          t2.Cases_in_1000s
      FROM disease_historic_final t1, disease_case_final t2
      WHERE (t1.Date = t2.Year_char AND t1.Age_group = t2.Age AND t1.Gender = t2.Gender);
QUIT;
