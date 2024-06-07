CREATE TABLE  STUDIES
(
PNAME CHAR(30),	
INSTITUTE CHAR(30),	
COURSE CHAR(30),	
COURSE_FEE INT
)
SELECT * FROM STUDIES
INSERT INTO STUDIES VALUES('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK','PRAGATHI','DCAP',5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000)

CREATE TABLE SOFTWARE
(
PNAME CHAR(30),	
TITLE CHAR(30),	
DEVELOPIN CHAR(30),	
SCOST DECIMAL,	
DCOST INT,	
SOLD INT
)
SELECT * FROM SOFTWARE
INSERT INTO SOFTWARE VALUES('MARY','README','CPP',300,1200,84),
('ANAND','PARACHUTES','BASIC',399.95,6000,43),
('ANAND','VIDEO TITLING','PASCAL',7500,16000,9),
('JULIANA','INVENTORY','COBOL',3000,3500,0),
('KAMALA','PAYROLL PKG.','DBASE',9000,20000,7),
('MARY','FINANCIAL ACCT.','ORACLE',18000,85000,4),
('MARY','CODE GENERATOR','C',4500,20000,23),
('PATTRICK','README','CPP',300,1200,84),
('QADIR','BOMBS AWAY','ASSEMBLY',750,3000,11),
('QADIR','VACCINES','C',1900,3100,21),
('RAMESH','HOTEL MGMT.','DBASE',13000,35000,4),
('RAMESH','DEAD LEE','PASCAL',599.95,4500,73),
('REMITHA','PC UTILITIES','C',725,5000,51),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500,6000,7),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100,75000,2),
('VIJAYA','TSR EDITOR','C',900,700,6)

CREATE TABLE PROGRAMMER
(
PNAME CHAR(30),	
DOB DATE,	
DOJ DATE,	
GENDER CHAR(5),	
PROF1 CHAR(30),	
PROF2 CHAR(30),	
SALARY INT
)
SELECT * FROM PROGRAMMER
INSERT INTO PROGRAMMER VALUES('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800),
('QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500)


SELECT * FROM STUDIES
SELECT * FROM SOFTWARE
SELECT * FROM PROGRAMMER

--Q.1 Find out the selling cost AVG for packages developed in Pascal--
SELECT AVG(SCOST)AS SCOST_AVG FROM SOFTWARE WHERE DEVELOPIN='PASCAL'

--Q.2 Display Names, Ages of all Programmers--
SELECT PNAME, DATEDIFF(YY,DOB,GETDATE())AS AGE FROM PROGRAMMER

--Q.3 Display the Names of those who have done the DAP Course--
SELECT PNAME FROM STUDIES WHERE COURSE='DAP'

--Q.4 Display the Names and Date of Births of all Programmers Born in January--
SELECT PNAME,DOB FROM PROGRAMMER WHERE MONTH(DOB)=01

--Q.5.	What is the Highest Number of copies sold by a Package?--
SELECT MAX(SOLD)AS HIGHEST_NO_COPIES FROM SOFTWARE

--Q.6.	Display lowest course Fee--
SELECT MIN(COURSE_FEE)AS LOWEST_FEE FROM STUDIES

--Q.7.	How many programmers done the PGDCA Course?--
SELECT * FROM STUDIES WHERE COURSE='PGDCA'

--Q.8.	How much revenue has been earned thru sales of Packages Developed in C.--
SELECT SUM(SCOST*SOLD)AS REVENUE FROM SOFTWARE WHERE DEVELOPIN LIKE 'C'

--Q.9.	Display the Details of the Software Developed by Ramesh.--
SELECT * FROM SOFTWARE WHERE PNAME='RAMESH'

--Q.10.	How many Programmers Studied at Sabhari?--
SELECT COUNT(PNAME) FROM STUDIES WHERE INSTITUTE='SABHARI'

--Q.11.	Display details of Packages whose sales crossed the 2000 Mark--
SELECT * FROM SOFTWARE WHERE (DCOST*SOLD) > 2000

--Q.12.	Display the Details of Packages for which Development Cost have beenrecovered.--
SELECT * FROM SOFTWARE where SCOST*SOLD >= DCOST

--Q.13.	What is the cost of the costliest software development in Basic?--
SELECT MAX(DCOST) FROM SOFTWARE WHERE  DEVELOPIN = 'BASIC'

--Q.14.	How many Packages Developed in DBASE?--
SELECT COUNT(TITLE) FROM SOFTWARE WHERE DEVELOPIN='DBASE'

--Q.15.	How many programmers studied in Pragathi?--
SELECT COUNT(PNAME) FROM STUDIES WHERE INSTITUTE='PRAGATHI'

--Q.16.	How many Programmers Paid 5000 to 10000 for their course?--
SELECT COUNT(PNAME) FROM STUDIES WHERE COURSE_FEE BETWEEN 5000 AND 10000

--Q.17.	What is AVG Course Fee--
SELECT AVG(COURSE_FEE)AS AVG_FEE FROM STUDIES

--Q.18.	Display the details of the Programmers Knowing C.--
SELECT * FROM PROGRAMMER WHERE PROF1 = 'C' OR PROF2 = 'C'

--Q.19.	How many Programmers know either COBOL or PASCAL.--
SELECT COUNT(PNAME) AS PROGRAMMERS FROM PROGRAMMER WHERE PROF1 = 'COBOL' OR PROF2 = 'PASCAL' OR PROF1 = 'PASCAL' OR PROF2 = 'COBOL'

--Q.20.	How many Programmers Don’t know PASCAL and C--
SELECT COUNT(PNAME) AS PROGRAMMERS FROM PROGRAMMER WHERE PROF1 NOT IN('PASCAL','C') OR PROF2 NOT IN('PASCAL','C')

--Q.21.	How old is the Oldest Male Programmer--
SELECT MAX(DATEDIFF(YY,DOB,GETDATE()))AS AGE FROM PROGRAMMER WHERE GENDER='M'

--Q.22.	What is the AVG age of Female Programmers?--
SELECT AVG(DATEDIFF(YY,DOB,GETDATE()))AS AVG_AGE FROM PROGRAMMER WHERE GENDER='F'

--Q.23.	Calculate the Experience in Years for each Programmer and Display with their names in Descending order--
SELECT *,DATEDIFF(YY,DOJ,GETDATE())AS EXPERIENCE FROM PROGRAMMER ORDER BY PNAME DESC

--Q.24.	Who are the Programmers who celebrate their Birthday’s During the Current Month?--
SELECT COUNT(PNAME)AS PROGRAMMER FROM PROGRAMMER WHERE MONTH(DOB)=MONTH(GETDATE())
SELECT * FROM PROGRAMMER WHERE MONTH(DOB)=MONTH(GETDATE())

--Q.25.	How many Female Programmers are there?--
SELECT COUNT(PNAME)AS FEMALE_PROGRAMMER FROM PROGRAMMER WHERE GENDER='F'

--Q.26.	What are the Languages studied by Male Programmers--
SELECT DISTINCT PROF1 AS LANGUAGES FROM PROGRAMMER WHERE GENDER='M' UNION SELECT DISTINCT PROF2 FROM PROGRAMMER WHERE GENDER='M'

--Q.27.	What is the AVG Salary?--
SELECT AVG(SALARY)AS AVG_SAL FROM PROGRAMMER

--Q.28.	How many people draw salary 2000 to 4000?--
SELECT COUNT(PNAME) FROM PROGRAMMER WHERE SALARY BETWEEN 2000 AND 4000

--Q.29.	Display the details of those who don’t know Clipper, COBOL or PASCAL--
SELECT * FROM PROGRAMMER WHERE PROF1 NOT IN('CLIPPER','COBOL','PASCAL') AND  PROF2 NOT IN('CLIPPER','COBOL','PASCAL')

--Q.30.	Display the Cost of Package Developed By each Programmer.--
SELECT PNAME,SUM(DCOST)AS COST_PACKAGE FROM SOFTWARE GROUP BY PNAME

--Q.31.	Display the sales values of the Packages Developed by the each Programmer.--
SELECT PNAME,SUM(SCOST*SOLD)AS SALE_VALUE FROM SOFTWARE GROUP BY PNAME

--Q.32.	Display the Number of Packages sold by Each Programmer--
SELECT PNAME,SUM(SOLD)AS PACKAGE_NO FROM SOFTWARE GROUP BY PNAME

--Q.33.	Display the sales cost of the packages Developed by each Programmer Language wise.--
SELECT DEVELOPIN,SUM(SCOST)AS SALES_COST FROM SOFTWARE GROUP BY DEVELOPIN

--Q.34.	Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy--
SELECT DEVELOPIN, AVG(DCOST)AS AVG_DCOST, AVG(SCOST)AS AVG_SCOST ,AVG(SOLD)AS AVG_PRICE FROM SOFTWARE GROUP BY DEVELOPIN

--Q.35.	Display each programmer’s name, costliest and cheapest Packages Developed by him or her--
SELECT PNAME,MAX(DCOST),MIN(DCOST) FROM SOFTWARE GROUP BY PNAME

--Q.36.	Display each institute name with number of Courses, Average Cost per Course--
SELECT INSTITUTE,COUNT(COURSE)AS NO_OF_COURSE,AVG(COURSE_FEE)AS COST_PER_COURSE FROM STUDIES GROUP BY INSTITUTE

--Q.37.	Display each institute Name with Number of Students.---
SELECT INSTITUTE,COUNT(PNAME)AS NO_OF_STUDENT FROM STUDIES GROUP BY INSTITUTE

--Q.38.	Display Names of Male and Female Programmers. Gender also--
SELECT PNAME,GENDER FROM PROGRAMMER WHERE GENDER='M' UNION SELECT PNAME,GENDER FROM PROGRAMMER WHERE GENDER='F' ORDER BY GENDER DESC
SELECT PNAME,GENDER FROM PROGRAMMER ORDER BY GENDER DESC

--Q.39.	Display the Name of Programmers and Their Packages.--
SELECT PNAME,SALARY FROM PROGRAMMER ORDER BY SALARY DESC

--Q.40.	Display the Number of Packages in Each Language Except C and C++.--
SELECT COUNT(SALARY) FROM PROGRAMMER WHERE PROF1 NOT IN('C','CPP') OR PROF2 NOT IN('C','CPP')

--Q.41.	Display the Number of Packages in Each Language for which Development Cost is less than 1000--
SELECT DEVELOPIN AS LANGUAGE, COUNT(TITLE) As NUMBER_OF_PACKAGES FROM SOFTWARE WHERE DCOST<1000 GROUP BY DEVELOPIN

--Q.42.	Display AVG Difference between SCOST, DCOST for Each Package--
SELECT AVG(DCOST-SCOST)AS AVG_DIFF FROM SOFTWARE 

--Q.43.	Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered--
SELECT SUM(SCOST)AS TOTAL_SCOST, SUM(DCOST)AS TOTAL_DCOST, SUM(DCOST-(SOLD*SCOST))AS RECOVERED FROM SOFTWARE 
GROUP BY pname HAVING SUM(DCOST)>SUM(SOLD*SCOST)

--Q.44.	Display Highest, Lowest and Average Salaries for those earning more than 2000.--
SELECT MAX(SALARY)AS HIGH_SAL, MIN(SALARY)AS LOW_SAL, AVG(SALARY)AS AVG_SAL FROM PROGRAMMER WHERE SALARY>2000

--Q.45.	Who is the Highest Paid C Programmers?--
SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1='C' OR PROF2='C')

--Q.46.	Who is the Highest Paid Female COBOL Programmer?--
SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE(PROF1='COBOL' OR PROF2='COBOL') AND GENDER='F')

--Q.47.	Display the names of the highest paid programmers for each Language.---
SELECT DISTINCT PROF1, MAX(SALARY) AS MAX_SAL FROM PROGRAMMER GROUP BY PROF1 UNION SELECT DISTINCT PROF2, MAX(SALARY) AS MAX_SAL FROM PROGRAMMER GROUP BY PROF2

--Q.48.	Who is the least experienced Programmer.---
SELECT * FROM PROGRAMMER WHERE DATEDIFF(YY,DOJ,GETDATE()) =(SELECT MIN(DATEDIFF(YY,DOJ,GETDATE())) FROM PROGRAMMER)

--Q.49.	Who is the most experienced male programmer knowing PASCAL.--
SELECT * FROM PROGRAMMER WHERE DATEDIFF(YY,DOJ,GETDATE()) IN
(SELECT MAX(DATEDIFF(YY,DOJ,GETDATE())) FROM PROGRAMMER WHERE GENDER='M' AND (PROF1='PASCAL' OR PROF2='PASCAL'))

--Q.50.	Which Language is known by only one Programmer?--
SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1)=1 UNION
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1

-- **Q.51.	Who is the Above Programmer Referred in 50?--

--Q.52.	Who is the Youngest Programmer knowing DBASE?--
SELECT PNAME FROM PROGRAMMER WHERE DATEDIFF(YY,DOB,GETDATE())=
(SELECT MIN(DATEDIFF(YY,DOB,GETDATE()))AS YOUNGEST FROM PROGRAMMER WHERE (PROF1='DBASE' OR PROF2 ='DBASE')) 

--Q.53.	Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?--
SELECT * FROM PROGRAMMER WHERE SALARY>3000 AND GENDER='F' AND 
(PROF1 NOT IN('C','CPP','ORACLE','DBASE') AND PROF2 NOT IN('C','CPP','ORACLE','DBASE'))

--Q.54.	Which Institute has most number of Students?--
select institute,COUNT(*)AS STUDENT from studies group by INSTITUTE order by count(*) desc 

--Q.55.	What is the Costliest course?---
SELECT COURSE,MAX(COURSE_FEE)AS COSTLY_COURSE FROM STUDIES GROUP BY COURSE ORDER BY MAX(COURSE_FEE) DESC
SELECT COURSE FROM STUDIES WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES)

--Q.56.	Which course has been done by the most of the Students?--
SELECT COURSE,COUNT(PNAME)AS STUDENT FROM STUDIES GROUP BY COURSE ORDER BY STUDENT DESC

--Q.57.	Which Institute conducts costliest course.---
SELECT INSTITUTE FROM STUDIES WHERE COURSE_FEE=(SELECT MAX(COURSE_FEE) FROM STUDIES)

--Q.58.	Display the name of the Institute and Course, which has below AVG coursefee--
SELECT INSTITUTE, COURSE FROM STUDIES WHERE COURSE_FEE<(SELECT AVG(COURSE_FEE) FROM STUDIES)

--Q.59.	Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee,--
SELECT COURSE FROM STUDIES WHERE COURSE_FEE<(SELECT AVG(COURSE_FEE)+1000 FROM STUDIES) 
AND COURSE_FEE>(SELECT AVG(COURSE_FEE)-1000 FROM STUDIES)

--Q.60.	Which package has the Highest Developmentcost?--
SELECT TITLE AS PACKAGE,DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE)

--Q.61.	Which course has below AVG number ofStudents?--


--Q.62.	Which Package has the lowest selling cost?--
SELECT TITLE AS PACKAGE FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE)

--Q.63.	Who Developed the Package that has sold the least number of copies?--
SELECT PNAME,SOLD FROM SOFTWARE WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE)


--Q.64.	Which language has used to develop the package, which has the highest sales amount?--
SELECT DEVELOPIN,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE)

--Q.65.	How many copies of package that has the least difference between development and selling cost where sold--
SELECT SOLD,TITLE FROM SOFTWARE WHERE TITLE = (SELECT TITLE FROM SOFTWARE
WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE))

--Q.66.	Which is the costliest package developed in PASCAL--
SELECT TITLE FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST)FROM SOFTWARE WHERE DEVELOPIN='PASCAL')

--Q.67.	Which language was used to develop the most number of Packages.--
SELECT DEVELOPIN FROM SOFTWARE GROUP BY DEVELOPIN  HAVING DEVELOPIN = (SELECT MAX(DEVELOPIN) FROM SOFTWARE)

--Q.68.	Which programmer has developed the highest number of Packages?--
SELECT PNAME FROM SOFTWARE GROUP BY PNAME HAVING PNAME = (SELECT MAX(PNAME) FROM SOFTWARE)

--Q.69.	Who is the Author of the Costliest Package?--
SELECT DISTINCT PNAME FROM SOFTWARE WHERE DCOST =(SELECT MAX(DCOST) FROM SOFTWARE)

--Q.70.	Display the names of the packages, which have sold less than the AVG number of copies--
SELECT TITLE FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE)

--Q.71.	Who are the authors of the Packages, which have recovered more than double the Development cost?--
SELECT DISTINCT PNAME AS AUTHORS FROM SOFTWARE WHERE (SOLD*SCOST)> 2*DCOST

--Q.72.	Display the programmer Name and the cheapest packages developed by them in each language.--
SELECT PNAME,TITLE FROM SOFTWARE WHERE DCOST IN (SELECT MIN(DCOST) FROM SOFTWARE GROUP BY DEVELOPIN)

--Q.73.	Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.--
SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME)
UNION
SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY PNAME)

--Q.74.	Who is the youngest male Programmer born in 1965?--
SELECT PNAME FROM PROGRAMMER WHERE DATEDIFF(YY,DOB,GETDATE())=(SELECT MIN(DATEDIFF(YY,DOB,GETDATE())) FROM PROGRAMMER) AND GENDER='M'

--Q.75.	Who is the oldest Female Programmer who joined in 1992?--
SELECT PNAME,DATEDIFF(YY,DOB,GETDATE())AS AGE FROM PROGRAMMER WHERE YEAR(DOJ)='1992' AND GENDER='F' ORDER BY AGE DESC

--Q.76.	In which year was the most number of Programmers born.--
SELECT YEAR(DOB)AS B_YEAR,COUNT(YEAR(DOB))AS NO_PROG FROM PROGRAMMER GROUP BY YEAR(DOB) ORDER BY NO_PROG DESC

--Q.77.	In which month did most number of programmers join?--
SELECT DATENAME(MM,DOJ)AS JOIN_MON,COUNT(PNAME)AS PROG FROM PROGRAMMER GROUP BY DATENAME(MM,DOJ) ORDER BY PROG DESC 

--Q.78.	In which language are most of the programmer’s proficient.--
SELECT prof1,prof2,COUNT(pname)AS PROGR FROM PROGRAMMER GROUP BY prof1,prof2 ORDER BY PROGR DESC

--Q.79.	Who are the male programmers earning below the AVG salary of Female Programmers?--
SELECT * FROM PROGRAMMER WHERE SALARY<(SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER='F') AND GENDER='M'

--Q.80.	Who are the Female Programmers earning more than the Highest Paid?--
SELECT * FROM PROGRAMMER WHERE SALARY>(SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER='M') AND GENDER='F'

-- **Q.81.	Which language has been stated as the proficiency by most of the Programmers?--

--Q.82.	Display the details of those who are drawing the same salary--
SELECT * FROM PROGRAMMER WHERE Salary IN
(SELECT SALARY FROM PROGRAMMER GROUP BY SALARY HAVING Count(SALARY) > 1)

--Q.83.	Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.--
SELECT * FROM PROGRAMMER P INNER JOIN SOFTWARE S ON P.PNAME=S.PNAME WHERE GENDER='M' AND SALARY>3000

--Q.84.	Display the details of the packages developed in Pascal by the Female Programmers.--
SELECT * FROM SOFTWARE S INNER JOIN PROGRAMMER P ON S.PNAME=P.PNAME WHERE P.GENDER='F' AND S.DEVELOPIN='PASCAL' 

--Q.85.	Display the details of the Programmers who joined before 1990--
SELECT * FROM PROGRAMMER WHERE YEAR(DOJ)<1990

--Q.86.	Display the details of the Software Developed in C By female programmers of Pragathi--
SELECT * FROM SOFTWARE S INNER JOIN PROGRAMMER P ON S.PNAME=P.PNAME INNER JOIN STUDIES ST ON P.PNAME=ST.PNAME
WHERE S.DEVELOPIN='C' AND P.GENDER='F' AND ST.INSTITUTE='PRAGATHI'
 

--Q.87.	Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise--
SELECT ST.INSTITUTE,COUNT(S.DEVELOPIN)AS DEVLOP,COUNT(S.SOLD)AS SOLD,SUM(S.SOLD*S.SCOST)AS SALES 
FROM SOFTWARE S INNER JOIN STUDIES ST ON S.PNAME=ST.PNAME GROUP BY ST.INSTITUTE

-- **Q.88.	Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in 
--which most number of Programmers studied--
 
--Q.89.	Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975--
SELECT * FROM PROGRAMMER WHERE YEAR(DOB)<1965 AND GENDER='M' UNION
SELECT * FROM PROGRAMMER WHERE YEAR(DOB)>1975 AND GENDER='F'

--Q.90.	Display the details of the software that has developed in the language which is neither 
--the first nor the second proficiency of the programmers--
SELECT * FROM PROGRAMMER P INNER JOIN SOFTWARE S ON P.PNAME=S.PNAME WHERE S.DEVELOPIN NOT IN(P.PROF1,P.PROF2)


--Q.91.	Display the details of the software developed by the male students of Sabhari.--
SELECT * FROM SOFTWARE S INNER JOIN PROGRAMMER P ON S.PNAME=P.PNAME INNER JOIN STUDIES ST ON P.PNAME=ST.PNAME
WHERE P.GENDER='M' AND ST.INSTITUTE='SABHARI'

--Q.92.	Display the names of the programmers who have not developed any packages.--
SELECT PNAME FROM PROGRAMMER WHERE PNAME NOT IN(SELECT PNAME FROM SOFTWARE)

--Q.93.	What is the total cost of the Software developed by the programmers of Apple?--
SELECT SUM(S.SCOST)AS TOTAL_SALE FROM SOFTWARE S INNER JOIN STUDIES ST ON S.PNAME = ST.PNAME WHERE ST.INSTITUTE='APPLE'

--Q.94.	Who are the programmers who joined on the same day?---
SELECT DATENAME(DD,DOJ),PNAME FROM PROGRAMMER WHERE DATENAME(DD,DOJ) IN (SELECT DATENAME(DD,DOJ) 
FROM PROGRAMMER GROUP BY DATENAME(DD,DOJ)HAVING Count(DATENAME(DD,DOJ)) > 1)
SELECT * FROM STUDIES
SELECT * FROM SOFTWARE
SELECT * FROM PROGRAMMER
--Q.95.	Who are the programmers who have the same Prof2?
SELECT PROF2,PNAME FROM PROGRAMMER WHERE PROF2 IN (SELECT PROF2
FROM PROGRAMMER GROUP BY PROF2 HAVING Count(PROF2) > 1)

--Q.96.	Display the total sales value of the software, institute wise.--
SELECT ST.INSTITUTE,SUM(S.SCOST)AS TOTAL_SALES FROM STUDIES ST INNER JOIN SOFTWARE S ON ST.PNAME=S.PNAME GROUP BY ST.INSTITUTE

--Q.97.	In which institute does the person who developed the costliest package studied--
SELECT INSTITUTE FROM STUDIES WHERE PNAME =(SELECT PNAME FROM SOFTWARE WHERE DCOST =(SELECT MAX(DCOST) FROM SOFTWARE))

--Q.98.	Which language listed in prof1, prof2 has not been used to develop any package.---
SELECT PROF1 FROM PROGRAMMER WHERE PROF1 NOT IN(SELECT DEVELOPIN FROM SOFTWARE) UNION
SELECT PROF2 FROM PROGRAMMER WHERE PROF2 NOT IN(SELECT DEVELOPIN FROM SOFTWARE)

--**Q.99.	How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.--

--Q.100.What is the AVG salary for those whose software sales is more than 50,000/-.--
SELECT AVG(P.SALARY)AS AVG_SAL FROM PROGRAMMER P INNER JOIN SOFTWARE S ON P.PNAME=S.PNAME WHERE (S.SCOST*S.SOLD)>50000

--Q.101.How many packages were developed by students, who studied in institute that charge the lowest course fee?--
SELECT COUNT(S.DEVELOPIN)AS PACKAGE, MIN(ST.COURSE_FEE) FROM SOFTWARE S INNER JOIN STUDIES ST ON S.PNAME=ST.PNAME GROUP BY S.DEVELOPIN
ORDER BY MIN(ST.COURSE_FEE) 

--Q.102.How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?--
SELECT COUNT(DEVELOPIN)AS PACKAGE FROM  SOFTWARE GROUP BY DEVELOPIN HAVING MIN(DCOST)=(SELECT MIN(DCOST) FROM SOFTWARE)


--**Q.103.How many packages were developed by the female programmers earning more than the highest paid male programmer?--

--**Q.104.How many packages are developed by the most experienced programmer form BDPS---

--Q.105.List the programmers (form the software table) and the institutes they studied.--
SELECT * FROM STUDIES WHERE PNAME NOT IN(SELECT PNAME FROM SOFTWARE)

--**Q.106.List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF--

--Q.107.List the programmer names (from the programmer table) and No. Of Packages each has developed--
SELECT PNAME,COUNT(DEVELOPIN)AS NO_OF_PACKAGE FROM SOFTWARE GROUP BY PNAME