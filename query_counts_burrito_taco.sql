/* 
The first step was to analyze the presence of "burrito" and "taco" in the column, considering two possible approaches:
(1) Detailed-oriented approach:
 - Exclude items that are not standalone burritos or tacos, such as bowls, wraps, combos, salads, and flatbreads (with the possibility of refining further).
(2) General approach:
- Only adjust for plural variations and include all relevant entries in the count.

Conclusion: For this case, I chose the detailed-oriented approach (1) to demonstrate the importance of investigating the data thoroughly after understanding the business requirements. 

The test before start:
(1) SELECT DISTINCT menus_name FROM menu_options_prices 
(2) Understand the variations about the names with burritos and tacos.
(3) Refine our filtering criteria to improve accuracy in the final query.
*/

WITH 
menu_counts AS (
    SELECT 
        l.city,
		SUM(CASE 
		    WHEN m.menus_name LIKE '%burrito%' 
		    AND m.menus_name NOT LIKE '%bowl%' 
		    AND m.menus_name NOT LIKE '%wrap%' 
		    AND m.menus_name NOT LIKE '%combo%'
		    THEN 1 ELSE 0 
		END) AS burrito_count,	
		SUM(CASE 
		    WHEN m.menus_name LIKE '%taco%' 
		    AND m.menus_name NOT LIKE '%salad%' 
		    AND m.menus_name NOT LIKE '%flatbread%' 
		    AND m.menus_name NOT LIKE '%bowl%'
		    THEN 1 ELSE 0 
		END) AS taco_count
    FROM locations AS l
    JOIN menu_options_prices AS m 
        ON l.id = m.id
    GROUP BY l.city
)
SELECT 
    mc.city,
    mc.burrito_count,
    mc.taco_count,
    CASE 
        WHEN mc.taco_count = 0 THEN NULL 
        ELSE CAST(mc.burrito_count AS FLOAT) / mc.taco_count 
    END AS burrito_to_taco_ratio
FROM menu_counts AS mc
ORDER BY burrito_to_taco_ratio DESC