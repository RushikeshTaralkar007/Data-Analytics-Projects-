Create Database Ola;

use Ola;

select * from bookings;


-- Q1) Retrive All Successful Bookings.

Create view Succesful_Bookings As 
select * From bookings where Booking_Status = 'Success';


select * From Succesful_Bookings;



-- Q2) Find The Average Ride Distance For Each Vehicle Type.


Create view ride_distance_for_each_vehicle As 
select Vehicle_Type , Avg(Ride_Distance) AS Average_Distance From bookings group by Vehicle_Type;

select * From ride_distance_for_each_vehicle;


-- Q3) Get The Total Number Of Cancelled Rides By Customers.

Create View canceled_ride_by_customers As 
select Count(*) From bookings where Booking_Status = 'Canceled by Customer';

select * from canceled_ride_by_customers;



-- Q4) List Top 5 Customers Who booked the Highest Number OF rides.

Create View Top_5_Customers As 
select Customer_ID , Count(Booking_ID) As 
Total_Rides From bookings group by Customer_ID 
order by Total_Rides desc Limit 5;

Select * From Top_5_Customers;



-- Q5) Get The Number OF Rides Cancelled By Drivers Due To Personal and car-related issues.

Create View Canceled_By_Driver_Personal_Issue As 
select count(*) From bookings where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from Canceled_By_Driver_Personal_Issue;



-- Q6) Find The Maximum And Minimum Driver Ratings For Prime sedan Bookings.

Create View Min_Max_Driver_Ratings As 
select max(Driver_Ratings) As Max_Ratings , 
min(Driver_Ratings) As Min_Ratings 
From bookings where Vehicle_Type = 'Prime Sedan';

select * from Min_Max_Driver_Ratings;



-- Q7) Retrive all rides where payment was made using UPI.

Create View UPI_Payment As 
select * From bookings where Payment_Method = 'UPI';

select * from UPI_Payment;


-- Q8) Find The average customer rating per vehicle type .

create view customer_rating_per_vehicle_type As 
select Vehicle_Type , Avg(Customer_Rating) As Avg_Customer_Ratings 
From bookings group by Vehicle_Type;


Select * From customer_rating_per_vehicle_type;



-- Q9) Calculate The Total Booking Value of Rides Complete Succesfully.

Create View Total_Success_Booking_Value As
select Sum(Booking_Value) As Total_Successful_Value 
From bookings where Booking_Status = 'Success';

Select * From Total_Success_Booking_Value;



-- Q10) List All Incomplete Rides Along With The Reason .

Create View Incomplete_Rides_Along_With_Reason As 
select Booking_ID ,Incomplete_Rides_Reason From bookings where Incomplete_Rides = 'Yes';

Select * from Incomplete_Rides_Along_With_Reason;



