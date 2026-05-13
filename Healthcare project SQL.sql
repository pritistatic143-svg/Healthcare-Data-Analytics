create database Bank_project;


-- Year wise loan amount Stats-----------------------------------------------------------------------------------------------------------------------
select year(issue_d) as Year,
Round(sum(loan_amnt)/1000,2) as  total_loan
from `bank_project`.`banking_project`
group by year(issue_d)
order by Year;

-- Grade and sub grade wise revol_bal-----------------------------------------------------------------------------------------------------------------
Select 
    grade,
    sub_grade,
    Round(Sum(Revol_bal)/1000,2) AS total_revol_bal
FROM `bank_project`.`banking_project`
Group by grade, sub_grade
order by grade;

-- Total Payment for Verified Status Vs Total Payment for Non Verified Status -------------------------------------------------------------------------
Select 
    verification_status,
    Round(SUM(total_pymnt)/1000,2)AS total_payment
from `bank_project`.`banking_project`
Group by verification_status;

-- State wise and month wise loan status---------------------------------------------------------------------------------------------------------------
SELECT 
    addr_state,
    Month(issue_d) AS month,
    loan_status,
    count(*) AS total_loans
from `bank_project`.`banking_project`
group by addr_state, MONTH(issue_d), loan_status
order by addr_state;

-- Home ownership Vs last payment date stats-----------------------------------------------------------------------------------------------------------
select home_ownership,
count(*) as total_loans
from `bank_project`.`banking_project`
group by home_ownership
order by home_ownership;

select Last_pymnt_d from `bank_project`.`banking_project`;
select issue_d from `bank_project`.`banking_project`;

DESCRIBE bank_project.banking_project;

select count(ï»¿id) from bank_project.banking_project;


SET SQL_SAFE_UPDATES = 0;
UPDATE bank_project.banking_project
SET issue_d = STR_TO_DATE(issue_d, '%d-%m-%Y');












