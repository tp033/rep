select COUNT(*)  from schedule WHERE FORMAT(frarr,'MM/dd/yyyy hh:mm:ss tt') ='01/09/2018 :00 AM'

select distinct [toLoc]   from schedule where toLoc like '%d%' UNION select distinct [fromLoc] AS found from schedule where fromLoc like '%d%' 

select * from schedule 



select COUNT(*) from schedule 
    WHERE ('1/8/2018 11:11:00 AM' BETWEEN frarr AND todept 
    OR '6/11/2018 11:11:00 AM' BETWEEN frarr AND todept 
     OR '6/11/2018 11:11:00 AM' BETWEEN frarr AND todept )
     AND vessel = 'da'

	 --select COUNT(*) from schedule 
  --  WHERE '4/9/2018 11:11:00 AM' BETWEEN frarr AND todept
  --   OR '5/11/2018 11:11:00 AM' BETWEEN frarr AND todept 
  --  OR '6/11/2018 11:11:00 AM' BETWEEN frarr AND todept 
  --   OR '6/11/2018 11:11:00 AM' BETWEEN frarr AND todept 
  --   AND vessel = 'r32'

	 --select COUNT(*) from schedule 
  --  WHERE '4/9/2018 11:11:00 AM' BETWEEN FORMAT(frarr,'MM/dd/yyyy hh:mm:ss tt')  AND FORMAT(todept,'MM/dd/yyyy hh:mm:ss tt')  
  --   OR '5/11/2018 11:11:00 AM' BETWEEN FORMAT(frarr,'MM/dd/yyyy hh:mm:ss tt')  AND FORMAT(todept,'MM/dd/yyyy hh:mm:ss tt')  
  --  OR '6/11/2018 11:11:00 AM' BETWEEN FORMAT(frarr,'MM/dd/yyyy hh:mm:ss tt')  AND FORMAT(todept,'MM/dd/yyyy hh:mm:ss tt')  
  --   OR '6/11/2018 11:11:00 AM' BETWEEN FORMAT(frarr,'MM/dd/yyyy hh:mm:ss tt')  AND FORMAT(todept,'MM/dd/yyyy hh:mm:ss tt')  
  --   AND vessel = 'r32'