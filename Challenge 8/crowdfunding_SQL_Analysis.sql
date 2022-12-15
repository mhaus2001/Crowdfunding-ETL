-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
Select backers_count, cf_id, outcome 
From campaign
Where outcome = 'live'
Order By backers_count Desc;



-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
Select Count(backer_id) backer_id, cf_id
From backers
Group By cf_id
Order By backer_id Desc;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
Select contacts.first_name, contacts.last_name, contacts.email, (campaign.goal-campaign.pledged) As RemainingGoalAmount
Into email_contacts_remaining_goal_amount
From campaign
Inner Join contacts
On campaign.contact_id = contacts.contact_id
Where campaign.outcome = 'live'
Order By RemainingGoalAmount Desc;

-- Check the table

SELECT * FROM email_contacts_remaining_goal_amount ;
-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
Select backers.email,
       backers.first_name,
	   backers.last_name,
	   backers.cf_id,
	   campaign.company_name,
	   campaign.description,
	   campaign.end_date,
	   campaign.goal-campaign.pledged As "Left of Goal"
Into email_backers_remaining_goal_amount
From backers
Inner Join campaign
ON backers.cf_id = campaign.cf_id
Where outcome = 'live'
Order By backers.last_name Asc ;



-- Check the table
SELECT * FROM email_backers_remaining_goal_amount ;