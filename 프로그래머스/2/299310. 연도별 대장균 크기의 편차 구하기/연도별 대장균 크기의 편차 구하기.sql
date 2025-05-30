-- 코드를 작성해주세요
SELECT 
    EXTRACT(YEAR FROM DIFFERENTIATION_DATE) AS YEAR,
    (MAX_SIZE - E.SIZE_OF_COLONY) AS YEAR_DEV,
    E.ID
FROM 
    ECOLI_DATA E
JOIN (
    SELECT 
        EXTRACT(YEAR FROM DIFFERENTIATION_DATE) AS YEAR,
        MAX(SIZE_OF_COLONY) AS MAX_SIZE
    FROM 
        ECOLI_DATA
    GROUP BY 
        EXTRACT(YEAR FROM DIFFERENTIATION_DATE)
) M ON EXTRACT(YEAR FROM E.DIFFERENTIATION_DATE) = M.YEAR
ORDER BY 
    YEAR ASC,
    YEAR_DEV ASC;
