-- creating a database 'library'
create database library;

-- USE command is used to specify the database that you want to work with.
use library;



-- creating tables
#1. Branch
create table Branch(
Branch_no int PRIMARY KEY ,
Manager_Id int,
Branch_address varchar(220),
Contact_no varchar(15)
);

-- inserting values into the branch table

INSERT INTO branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
    (101, 1, '123 Main St, Cityville', '555-1111'),
    (102, 2, '456 Elm St, Townsville', '555-2222'),
    (103, 3, '789 Oak St, Villagetown', '555-3333'),
    (104, 4, '321 Pine St, Countryside', '555-4444'),
    (105, 5, '654 Maple St, Suburbia', '555-5555'),
    (106, 6, '987 Cedar St, Hamlet', '555-6666'),
    (107, 7, '210 Birch St, Ruralville', '555-7777'),
    (108, 8, '543 Spruce St, Farmland', '555-8888');
    
    select * from branch;



#2. Employee
create table Employee(
Emp_Id int PRIMARY KEY ,
Emp_name varchar(220),
position varchar(220),
Salary decimal(10,2),
Branch_no int,
	foreign key(Branch_no) references Branch(branch_no)
);

-- inserting values into the table
INSERT INTO employee (Emp_Id, Emp_name, Position, Salary,Branch_no)
VALUES
	(1, 'John Doe', 'Manager', 75000.00, 101),
    (2, 'Jane Smith', 'Developer', 60000.00, 102),
    (3, 'Bob Johnson', 'Analyst', 50000.00, 103),
    (4, 'Alice Williams', 'HR Specialist', 55000.00, 104),
    (5, 'Charlie Brown', 'Designer', 65000.00, 105),
    (6, 'Eva Davis', 'Marketing Coordinator', 48000.00, 106),
    (7, 'Michael Lee', 'Sales Representative', 60000.00, 101),
    (8, 'Olivia White', 'Support Specialist', 52000.00, 102);
    
  select * from employee;  
  
  
  
    #3. Books
    create table Books(
    ISBN VARCHAR(15) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),         
    Author VARCHAR(255),
    Publisher VARCHAR(255)
    );
    
    #ENUM
    /*
    In MySQL, the ENUM type is used to define a set of constant values. 
    It is a string object that can have one value chosen from a predefined list of allowed values. 
    The values in an ENUM list are case-insensitive
    */
    
    -- inserting values into the table
    INSERT INTO books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
    ('9780141927298', '1984', 'Dystopian', 9.99, 'yes', 'George Orwell', 'Penguin Books'),
    ('9780061120084', 'To Kill a Mockingbird', 'Fiction', 8.99, 'yes', 'Harper Lee', 'HarperCollins'),
    ('9780141187761', 'The Catcher in the Rye', 'Coming-of-Age', 7.99, 'no', 'J.D. Salinger', 'Penguin Books'),
    ('9780141439518', 'Pride and Prejudice', 'Romance', 10.99, 'yes', 'Jane Austen', 'Penguin Books'),
    ('9780547928227', 'The Hobbit', 'Fantasy', 11.99, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin'),
    ('9780307474278', 'The Da Vinci Code', 'Mystery', 12.99, 'yes', 'Dan Brown', 'Anchor Books'),
    ('9781408855652', 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 14.99, 'no', 'J.K. Rowling', 'Bloomsbury'),
    ('9780743273565', 'The Great Gatsby', 'Classic', 9.99, 'yes', 'F. Scott Fitzgerald', 'Scribner');
    
select * from books;



#4. Customer
create table Customer(
Customer_Id int PRIMARY KEY ,
Customer_name varchar(220),
Customer_address varchar(220),
Reg_date date
);

-- inserting values to the above table
INSERT INTO customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
    (1, 'John Doe', '123 Main St, Cityville', '2021-12-15'),
    (2, 'Jane Smith', '456 Elm St, Townsville', '2022-01-05'),
    (3, 'Bob Johnson', '789 Oak St, Villagetown', '2021-11-20'),
    (4, 'Alice Williams', '321 Pine St, Countryside', '2022-02-02'),
    (5, 'Charlie Brown', '654 Maple St, Suburbia', '2022-02-15'),
    (6, 'Eva Davis', '987 Cedar St, Hamlet', '2022-03-01'),
    (7, 'Michael Lee', '210 Birch St, Ruralville', '2022-03-12'),
    (8, 'Olivia White', '543 Spruce St, Farmland', '2022-04-05');
    
    select * from customer;
   
   
    
    #5. IssueStatus
    create table IssueStatus(
    Issue_Id int PRIMARY KEY ,
    Issued_cust int ,
		FOREIGN KEY(issued_cust) references customer(customer_id),
    Issued_book_name varchar(220),
    Issue_date date,
    Isbn_book varchar(15),
			FOREIGN KEY(isbn_book) references books(isbn) 
	);
 
-- inserting values to issuestatus table
   insert into IssueStatus(Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
   values
    -- no issue status for the first row
    (2, 2, 'To Kill a Mockingbird', '2022-02-05', '9780061120084'),
    -- no issue status for the third row
    (4, 4, 'Pride and Prejudice', '2022-05-02', '9780141439518'),
    (5, 5, 'The Catcher in the Rye', '2022-05-15', '9780547928227'),
    (6, 6, 'The Hobbit', '2023-06-01', '9780307474278'),
    (7, 7, 'The Da Vinci Code', '2022-07-12', '9781408855652'),
    (8, 8, 'Harry Potter and the Sorcerer''s Stone', '2022-08-05', '9780141187761');
    
    select * from issuestatus;
    update issuestatus
    set issued_book_name='The History of Ancient Civilizations'
    where issue_id=8;
    
    
    
#6. ReturnStatus
create table ReturnStatus(
Return_Id int PRIMARY KEY ,
Return_cust int,
Return_book_name varchar(220),
Return_date date,
Isbn_book2 varchar(15),
	 FOREIGN KEY(Isbn_book2) references Books(isbn)
);

-- inserting values to the corresponding table 
INSERT INTO returnstatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
    (1, 1, 'The Great Gatsby', '2022-02-05', '9780743273565'),
    (2, 2, 'To Kill a Mockingbird', '2022-03-15', '9780061120084'),
    (3, 3, '1984', '2022-04-20', '9780141927298'),
    (4, 4, 'Pride and Prejudice', '2022-05-10', '9780141439518'),
    (5, 5, 'The Catcher in the Rye', '2022-06-25', '9780547928227'),
    (6, 6, 'The Hobbit', '2022-07-10', '9780307474278'),
    (7, 7, 'The Da Vinci Code', '2022-08-20', '9781408855652'),
    (8, 8, 'Harry Potter and the Sorcerer''s Stone', '2022-09-05', '9780141187761');
    
    select * from returnstatus;
    
    update returnstatus
    set return_book_name='The History of Ancient Civilizations'
    where return_id=8;
    
    
    
    -- 1. Retrieving the book title, category, and rental price of all available books.
    select book_title,category,rental_price,status from Books where status='yes';
    
    
    -- 2. Listing the employee names and their respective salaries in descending order of salary.
    select emp_id,emp_name,salary from employee order by salary desc;
    
    
    -- 3. Retrieving the book titles and the corresponding customers who have issued those books.
    select * from customer;
    select * from issuestatus;
    
  select  i.issued_book_name as Book_title , c.customer_id,c.customer_name,customer_address 
  from issuestatus i join customer c
  on i.issued_cust=c.customer_id;
  
    
    
-- 4. Displaying the total count of books in each category.
    select * from books;
    select count(*) 'total count of books', category from books group by category;
    
    
    
    
-- 5. Retrieving the employee names and their positions for the employees whose salaries are above Rs.50,000.
select * from employee;
select emp_name,position,salary from employee where salary>50000;





-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select * from customer;
select * from issuestatus;

select c.customer_name,c.reg_date
from customer c
left join
issuestatus i on c.customer_id=i.issued_cust
where reg_date<'2022-01-01' and i.issued_cust is null;



-- 7. Displaying the branch numbers and the total count of employees in each branch.
select * from branch;
select * from employee;
select branch_no,count(*) 'total count of employees' from employee group by branch_no;



-- 8. Displaying the names of customers who have issued books in the month of June 2023.
select c.customer_name,i.issue_date
from customer c join issuestatus i
on c.customer_id=i.issued_cust
where month(issue_date)='06' and year(issue_date)='2023';



-- 9. Retrieving the book_title from the book table containing history.
select * from books;
update books
set Book_title='The History of Ancient Civilizations',Category='History',Rental_price=12.99,Status='Yes',Author='John Historian',publisher='Historical Press'
where isbn='9781408855652';

select book_title,category from books where category='History';





-- 10.Retrieving the branch numbers along with the count of employees for branches having more than 5 employees
select * from branch;
select * from employee;

select branch_no,count(*) 'count of employee' from employee group by branch_no having count(*)>5;




-- Retrieving the branch numbers along with the count of employees for branches having more than 1 employees
select branch_no,count(*) 'count of employee' from employee group by branch_no having count(*)>1;


-- Retreiving employee details in the Analyst position
select * from employee where position='Analyst';



-- retreiving the book details with highest rental price
select * from books order by rental_price desc limit 1;


-- Retrieve all returned books and their corresponding customers.
select * from returnstatus;
select * from customer;

select c.customer_name,rs.return_id,rs.return_book_name, rs.return_date 
from customer c  join returnstatus rs
on  c.customer_id=rs.return_cust;









