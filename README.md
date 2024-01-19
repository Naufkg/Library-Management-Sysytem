# Library Management System

[View PDF with Screenshots Of the project done in MySql Workbench](https://docs.google.com/document/d/1ToY-4Afb3QT28_c_SzCeJgrdheKW9lQjSGZzLBg5Gug/edit?usp=sharing)


### Introduction
In this article, we will build Library Management System using MYSQL. We will build the database, which includes tables.
This system is handy for people going to the library and searching for their desired book and for the librarian to guide them and take care of these things. 
It ensures that everything works in systematic order, given that each person taking or returning books needs to enter the record in the system.

### Purpose
Library Management System is a system that shows all the available books and their count and also books taken by people, the date on which they took that particular book, expected date of return,
membership details, and so on. Everything will be crystal clear. There will be no ambiguity. It will be beneficial for both students and librarians.
This library management is very efficient and also cost-effective. It saves a lot of time for both librarians and also students. With this, manual work is reduced, requiring less staff and maintenance. This system is user-friendly and also very easy to use.

### Data Types Used And it's Description

1.INT(size) - A medium integer. Signed range is from -2147483648 to 2147483647. Unsigned range is
              from 0 to 4294967295. The size parameter specifies the maximum display width (which is 255)

2.DECIMAL(size, d) - The total number of digits is specified in size. The number of digits
     after the decimal point is specified in the d parameter. The maximum number for size is 65. The
     maximum number for d is 30. The default value for size is 10. The default value for d is 0.

3.VARCHAR - VARCHAR, on the other hand, is a
     variable-length character data type, which only uses as much storage as needed for the
     actual data, resulting in more efficient storage usage for shorter strings.

4.ENUM(val1, val2, val3, ...) - A string object that can have only one value, chosen from a
    list of possible values. You can list up to 65535 values in an ENUM list. If a value is
    inserted that is not in the list, a blank value will be inserted.

5.DATE - A date. Format: YYYY-MM-DD. The supported range is from '1000-01-01' to '9999-12-31'

6.TIME - A time. Format: hh:mm:ss. The supported range is from '-838:59:59' to '838:59:59'

### Dataset Keys Used

1.Primary Key -
● Primary key is a candidate key that is most appropriate to become main key of the table.
● Primary key is selected from the list of candidate key and there can only be 1 primary key
for a table.
● This key will not allow null values or duplicate values.

2.Foreign Key-
● This key is used to link tables via primary key.
● Foreign key of a table is primary key of other table.

### Data Requirements / Relations/ Tables
Create a database named library and the following TABLES in the database:
1. Branch
2. Employee
3. Books
4. Customer
5. IssueStatus
6. ReturnStatus

### Attributes 
1. Branch
Branch_no - Set as PRIMARY KEY 
Manager_Id 
Branch_address 
Contact_no

2. Employee 
Emp_Id – Set as PRIMARY KEY 
Emp_name 
Position 
Salary
Branch_no - Set as FOREIGN KEY and it refers to the Branch_no in the Branch table 

3. Books 
ISBN - Set as PRIMARY KEY 
Book_title 
Category 
Rental_Price 
Status [Give yes if book available and no if book not available] 
Author 
Publisher

4. Customer 
Customer_Id - Set as PRIMARY KEY 
Customer_name 
Customer_address 
Reg_date

5. IssueStatus 
Issue_Id - Set as PRIMARY KEY 
Issued_cust – Set as FOREIGN KEY and it refers to the customer_id in the CUSTOMER table  Issued_book_name
Issue_date
Isbn_book – Set as FOREIGN KEY and it should refer to isbn in BOOKS table

6. ReturnStatus 
Return_Id - Set as PRIMARY KEY 
Return_cust 
Return_book_name 
Return_date 
Isbn_book2 - Set as FOREIGN KEY and it should refer to isbn in BOOKS table.

### Conclusion
The library management system is essential for colleges, schools, and many more places these days. A lot of manual work can be reduced with this library management system. And also, a lot of glitches like wrong borrow date and miscalculation of fine amount are avoided. As it is a computer-managed system and so these are all avoided. It is also efficient and cost-effective. The Library management system stores the details of books and also details of persons. So overall, we have seen-

To build a database to maintain all the related information
We built tables separately to store data.
Learned the purpose of the library management system.
