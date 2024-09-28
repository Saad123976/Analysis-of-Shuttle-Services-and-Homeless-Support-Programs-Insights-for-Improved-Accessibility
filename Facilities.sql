select * from facilities;

-- Retrieve All Data for a Specific Program (Petworth Library)

SELECT 
    *
FROM
    facilities
WHERE
    program_name = 'Petworth Library';
    
-- Total Programs in the city

SELECT 
    COUNT(program_name)
FROM
    facilities;
    
-- All Programs Offering Case Management

SELECT 
    program_name, Case_Management
FROM
    facilities
WHERE
    Case_Management = 'Yes';
    
-- Count Programs by Accessibility Services Offered

SELECT 
    program_name, COUNT(*) AS facility_count
FROM
    facilities
WHERE
    Accessibility_Services = 'Yes'
GROUP BY program_name;

-- List Programs with Meals and Refreshments

SELECT 
    program_name
FROM
    facilities
WHERE
    Meals = 'Yes' and Refreshments = 'Yes';
    
--  Programs That Are Open to the Public

SELECT 
    program_name, Open_To_Public
FROM
    facilities
WHERE
    Open_To_Public = 'Yes' Or Open_To_Public = 'By Appointment';

-- Total Clients Served Per Day by Program

SELECT 
    program_name,
    SUM(Clients_Served_Per_Day) AS 'Clients Served Per Day'
FROM
    facilities
GROUP BY program_name;

-- Programs That Offer Multiple Services (Adult_Literacy, Art_Therapy, Child_Care)

SELECT 
    program_name
FROM
    facilities
WHERE
    Adult_Literacy = 'Yes'
        OR Art_Therapy = 'Yes'
        OR Child_Care = 'Yes';
        
--  All Programs with Contact Information

SELECT 
    program_name, Phone_Number
FROM
    facilities
WHERE
    Phone_Number != 'N/A';
    
-- Programs without food services

SELECT 
    program_name
FROM
    facilities
WHERE
    Food_Groceries = 'No';
    
--  Average number of clients served per day (Art_Therapy, Child_Care and other services)

SELECT 
    (CASE
        WHEN Art_Therapy = 'Yes' THEN 'Art_Therapy'
        WHEN Child_Care = 'Yes' THEN 'Child_Care'
        ELSE 'Other Services'
    END) AS Service_Type,
    AVG(Clients_Served_Per_Day) AS Avg_Clients_Served_per_day
FROM
    facilities
GROUP BY Service_Typed;
    
--  Programs that provide both medical benefits and legal services

SELECT 
    program_name, Medical_Services, Legal_Services
FROM
    facilities
WHERE
    Medical_Services = 'Yes'
        AND Legal_Services = 'Yes';	
        


