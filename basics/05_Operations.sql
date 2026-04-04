/*
Problem 1
In the invoices_fact table, multiply the hours_spent to the hours_rate and rename this new column to added_value.
Order by activity_id in ascending order.
Note: This is calculating the total pay based on a particular activity_id.
*/
SELECT
    activity_id,
    hours_spent * hours_rate AS added_value
FROM
    invoices_fact
ORDER BY
    activity_id ASC;

/*
Problem 2
In the invoices_fact table divide the hours_spent by the hours_rate and rename this column to efficiency_ratio. 
Return the activity_id as well. 
Order by activity_id in ascending order.
*/

SELECT 
    activity_id,
    hours_spent / hours_rate AS efficiency_ratio
FROM 
    invoices_fact 
ORDER BY
    activity_id;

/*
Problem 3
In the invoices_fact table, suppose each project has a fixed budget cap.
You’re told the budget cap is $100,000 for every activity.

Subtract the actual cost of the activity (calculated as hours_spent * hours_rate) from the budget cap to find how much budget is left. 
Name this new column remaining_budget.

Return the activity_id and remaining_budget, and order the results by activity_id in ascending order.
*/

SELECT
    activity_id,
    100000 - (hours_spent * hours_rate) as remaining_budget
FROM
    invoices_fact
ORDER BY
    activity_id ASC;

/*
Problem 4
In the invoices_fact table, each activity has a base cost calculated as hours_spent * hours_rate. 
Assume a flat travel fee of $150 is charged per activity.

Add this flat fee to the base cost, and name the resulting column total_cost_with_travel.
Return the activity_id and total_cost_with_travel, ordered by activity_id in ascending order.
*/
SELECT
    activity_id,
    (hours_spent * hours_rate) + 150  AS total_cost_with_travel
FROM
    invoices_fact