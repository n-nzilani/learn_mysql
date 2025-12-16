-- data cleaning

select * from layoffs;
-- remove duplicates
-- copying the table 
CREATE TABLE layoffs_staging 
select * from layoffs; 
select * from layoffs_staging;

WITH layoffs_cte AS(
SELECT * ,
ROW_NUMBER () 
OVER( PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM  layoffs_staging )
SELECT * FROM layoffs_cte 
WHERE row_num >1;

-- You cannot delete rows from a CTE, only from an actual table. This can't work,A CTE is just a temporary result set, not a real table.
WITH layoffs_cte AS(
SELECT * ,
ROW_NUMBER () 
OVER( PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM  layoffs_staging )
DELETE FROM layoffs_cte 
WHERE row_num >1;



SELECT * FROM layoffs_staging
where company ='Casper';

SELECT * FROM layoffs_staging
where company ='Oda';

drop table layoffs_staging2;



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num`  int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoffs_staging2
SELECT *,
ROW_NUMBER() OVER
(PARTITION BY  company ,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions ) as row_num
FROM layoffs_staging;

select * from layoffs_staging2;

SELECT * FROM layoffs_staging2 
where row_num >1;

DELETE FROM layoffs_staging2 
where row_num >1;

-- ===== 2.standardise the data -Finding issues then fixing it...
SELECT * FROM layoffs_staging2 ;

Start TRANSACTION;
UPDATE layoffs_staging2 
SET company =trim(company);
COMMIT;

CREATE TABLE  layoffs_staging3
SELECT * FROM layoffs_staging2;
SELECT * FROM layoffs_staging3;



START TRANSACTION ;
UPDATE layoffs_staging3 
SET industry ='crypto';
SELECT distinct(industry) from layoffs_staging3;
rollback;

COMMIT;

SELECT distinct(industry) from layoffs_staging2
ORDER BY 1;
 
START TRANSACTION;
UPDATE layoffs_staging2
SET industry = 'Crypto'
where industry like 'Crypt%';

commit;

SELECT distinct(location) from layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET location = 'Dusseldorf'
WHERE location IN ('Düsseldorf', 'Dusseldorf', 'DÃ¼sseldorf');

SELECT DISTINCT location
FROM layoffs_staging2
WHERE location LIKE '%Florian%';

UPDATE layoffs_staging2
SET location = 'Florianópolis'
WHERE location IN ('FlorianÃ³polis');

UPDATE layoffs_staging2
SET location = 'Malmö'
WHERE location IN ('MalmÃ¶', 'Malmo');

SELECT distinct(country) from layoffs_staging2
ORDER BY 1;

START TRANSACTION;
update layoffs_staging2 
set country = 'United States'
where country like 'United%' ;
rollback;


START TRANSACTION;
update layoffs_staging2 
set country = TRim(TRAILING '.' FROM country)
 ;
 START TRANSACTION;
 update layoffs_staging2
 set `date`= str_to_date(`date`,'%m/%d/%Y');
 COMMIT;
 
 ALTER TABLE layoffs_staging2
 MODIFY COLUMN `date` DATE;
 SELECT * from layoffs_staging2;
 
 -- 3.Null Values or Blank Values
 SELECT * FROM layoffs_staging2
WHERE industry IS NULL
OR industry ='';

SELECT * from layoffs_staging2
WHERE company = 'Airbnb';

select * from  layoffs_staging2 t1
  join layoffs_staging2 t2
  on t1.company=t2.company
  where (t1.industry IS  NULL OR t1.industry ='')
  and t2.industry IS NOT NULL;
  
UPDATE  layoffs_staging2 t1
SET industry = NULL 

WHERE industry= ''; 

UPDATE  layoffs_staging2 t1
  join layoffs_staging2 t2
  on t1.company=t2.company
  SET t1.industry=t2.industry
  where t1.industry IS  NULL 
  and t2.industry IS NOT NULL;

SELECT * FROM layoffs_staging2 
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


DELETE FROM layoffs_staging2 
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

SELECT * FROM layoffs_staging2 ;