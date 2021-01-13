create database GUCera

GO 
USE GUCera

/****** Object:  Table [Admin]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin](
	[id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Assignment]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assignment](
	[cid] [int] NOT NULL,
	[number] [int] NOT NULL,
	[type] [varchar](10) NOT NULL,
	[fullGrade] [int] NULL,
	[weight] [decimal](4, 1) NULL,
	[deadline] [datetime] NULL,
	[content] [varchar](200) NULL,
PRIMARY KEY CLUSTERED
(
	[cid] ASC,
	[number] ASC,
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Course]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[creditHours] [int] NULL,
	[name] [varchar](10) NULL,
	[courseDescription] [varchar](200) NULL,
	[price] [decimal](6, 2) NULL,
	[content] [varchar](200) NULL,
	[adminId] [int] NULL,
	[instructorId] [int] NULL,
	[accepted] [bit] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CoursePrerequisiteCourse]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CoursePrerequisiteCourse](
	[cid] [int] NOT NULL,
	[preid] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[cid] ASC,
	[preid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CreditCard]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CreditCard](
	[number] [varchar](15) NOT NULL,
	[cardHolderName] [varchar](16) NULL,
	[expiryDate] [datetime] NULL,
	[cvv] [varchar](3) NULL,
PRIMARY KEY CLUSTERED
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Feedback]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Feedback](
	[cid] [int] NOT NULL,
	[number] [int] IDENTITY(1,1) NOT NULL,
	[comment] [varchar](100) NULL,
	[numberOfLikes] [int] NULL,
	[sid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[cid] ASC,
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Instructor]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Instructor](
	[id] [int] NOT NULL,
	[rating] [decimal](2, 1) NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [InstructorTeachCourse]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [InstructorTeachCourse](
	[insid] [int] NOT NULL,
	[cid] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[insid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Promocode]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Promocode](
	[code] [varchar](6) NOT NULL,
	[isuueDate] [datetime] NULL,
	[expiryDate] [datetime] NULL,
	[discount] [decimal](4, 2) NULL,
	[adminId] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Student]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Student](
	[id] [int] NOT NULL,
	[gpa] [decimal](3, 2) NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [StudentAddCreditCard]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StudentAddCreditCard](
	[sid] [int] NOT NULL,
	[creditCardNumber] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[sid] ASC,
	[creditCardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [StudentCertifyCourse]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StudentCertifyCourse](
	[sid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[issueDate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[sid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [StudentHasPromocode]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StudentHasPromocode](
	[sid] [int] NOT NULL,
	[code] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[sid] ASC,
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [StudentRateInstructor]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StudentRateInstructor](
	[sid] [int] NOT NULL,
	[insid] [int] NOT NULL,
	[rate] [decimal](2, 1) NULL,
PRIMARY KEY CLUSTERED
(
	[sid] ASC,
	[insid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [StudentTakeAssignment]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StudentTakeAssignment](
	[sid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[assignmentNumber] [int] NOT NULL,
	[assignmenttype] [varchar](10) NOT NULL,
	[grade] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED
(
	[sid] ASC,
	[cid] ASC,
	[assignmentNumber] ASC,
	[assignmenttype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [StudentTakeCourse]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StudentTakeCourse](
	[sid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[insid] [int] NOT NULL,
	[payedfor] [bit] NULL,
	[grade] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED
(
	[sid] ASC,
	[cid] ASC,
	[insid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [UserMobileNumber]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UserMobileNumber](
	[id] [int] NOT NULL,
	[mobileNumber] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC,
	[mobileNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Users]    Script Date: 1/13/2021 7:23:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](10) NULL,
	[lastName] [varchar](10) NULL,
	[password] [varchar](10) NULL,
	[gender] [bit] NULL,
	[email] [varchar](50) NULL,
	[address] [varchar](50) NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Feedback] ADD  DEFAULT ((0)) FOR [numberOfLikes]
GO
ALTER TABLE [Admin]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [Users] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Assignment]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [Course] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Course]  WITH CHECK ADD FOREIGN KEY([adminId])
REFERENCES [Admin] ([id])
GO
ALTER TABLE [Course]  WITH CHECK ADD FOREIGN KEY([instructorId])
REFERENCES [Instructor] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [CoursePrerequisiteCourse]  WITH CHECK ADD FOREIGN KEY([preid])
REFERENCES [Course] ([id])
GO
ALTER TABLE [CoursePrerequisiteCourse]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [Course] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Feedback]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [Course] ([id])
GO
ALTER TABLE [Feedback]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [Student] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Instructor]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [Users] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [InstructorTeachCourse]  WITH CHECK ADD FOREIGN KEY([insid])
REFERENCES [Instructor] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [InstructorTeachCourse]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [Course] ([id])
GO
ALTER TABLE [Promocode]  WITH CHECK ADD FOREIGN KEY([adminId])
REFERENCES [Admin] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Student]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [Users] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [StudentAddCreditCard]  WITH CHECK ADD FOREIGN KEY([creditCardNumber])
REFERENCES [CreditCard] ([number])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [StudentAddCreditCard]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [Student] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [StudentCertifyCourse]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [Course] ([id])
GO
ALTER TABLE [StudentCertifyCourse]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [Student] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [StudentHasPromocode]  WITH CHECK ADD FOREIGN KEY([code])
REFERENCES [Promocode] ([code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [StudentHasPromocode]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [Student] ([id])
GO
ALTER TABLE [StudentRateInstructor]  WITH CHECK ADD FOREIGN KEY([insid])
REFERENCES [Instructor] ([id])
GO
ALTER TABLE [StudentRateInstructor]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [Student] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [StudentTakeAssignment]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [Student] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [StudentTakeAssignment]  WITH CHECK ADD FOREIGN KEY([cid], [assignmentNumber], [assignmenttype])
REFERENCES [Assignment] ([cid], [number], [type])
GO
ALTER TABLE [StudentTakeCourse]  WITH CHECK ADD FOREIGN KEY([insid])
REFERENCES [Instructor] ([id])
GO
ALTER TABLE [StudentTakeCourse]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [Course] ([id])
GO
ALTER TABLE [StudentTakeCourse]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [Student] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [UserMobileNumber]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [Users] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Assignment]  WITH CHECK ADD CHECK  (([weight]>=(0) AND [weight]<=(100)))
GO
ALTER TABLE [Assignment]  WITH CHECK ADD CHECK  (([type]='project' OR [type]='exam' OR [type]='quiz'))
GO
ALTER TABLE [StudentTakeAssignment]  WITH CHECK ADD CHECK  (([grade]>=(0) AND [grade]<=(100)))
GO
ALTER TABLE [StudentTakeCourse]  WITH CHECK ADD CHECK  (([grade]>=(0) AND [grade]<=(100)))
GO



/****** Object:  UserDefinedFunction [dbo].[checkStudentEnrolledInCourse]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------
--Student

CREATE FUNCTION [dbo].[checkStudentEnrolledInCourse]
(@sid INT, @cid INT)
RETURNS BIT
BEGIN
DECLARE @returnValue BIT
IF(EXISTS(SELECT * FROM StudentTakeCourse WHERE sid = @sid AND cid = @cid))
SET @returnValue = '1'
ELSE
SET @returnValue = '0'
RETURN @returnValue
END

GO
/****** Object:  StoredProcedure [dbo].[AddAnotherInstructorToCourse]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- 4 add another instructor to the course  ----
CREATE Proc [dbo].[AddAnotherInstructorToCourse]
@insid int,
@cid int,
@adderIns int
As
if(exists(select * from Course where instructorId=@adderIns and id =@cid ))
Insert into InstructorTeachCourse(insid,cid) values(@insid, @cid)
else
print 'ERROR'


GO
/****** Object:  StoredProcedure [dbo].[addCreditCard]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[addCreditCard]
@sid int,
@number varchar(15),
@cardHolderName varchar(16),
@expiryDate datetime,
@cvv varchar(3)
AS
IF (EXISTS(SELECT * FROM Users WHERE id=@sid))
BEGIN
INSERT INTO CreditCard VALUES (@number,@cardholderName,@expiryDate,@cvv)
insert into StudentAddCreditCard values(@sid,@number)
END

GO
/****** Object:  StoredProcedure [dbo].[addFeedback]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--I can add feedback for the course I am enrolled in.
CREATE PROC [dbo].[addFeedback]
@comment VARCHAR(100),
@cid INT,
@sid INT
AS
BEGIN
IF(dbo.checkStudentEnrolledInCourse(@sid,@cid)='1')
INSERT INTO Feedback (cid,comment,sid) VALUES (@cid,@comment,@sid)
ELSE
print 'student not enrolled in course'
END


GO
/****** Object:  StoredProcedure [dbo].[addMobile]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------

create proc [dbo].[addMobile]
@ID varchar(20),
@mobile_number varchar(20)
as
begin
if @ID is not null and @mobile_number is not null
insert into UserMobileNumber values(@ID,@mobile_number)
end

GO
/****** Object:  StoredProcedure [dbo].[AdminAcceptRejectCourse]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- 6 Accept/Reject any of the requested courses that are added by instructors ---
CREATE Proc [dbo].[AdminAcceptRejectCourse]
@adminid int,
@courseId int
As
UPDATE Course
SET accepted = 1 , adminId=@adminid
Where id = @courseId


GO
/****** Object:  StoredProcedure [dbo].[AdminCreatePromocode]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- 7 Create new Promo codes by inserting all promo code detail ---
CREATE Proc [dbo].[AdminCreatePromocode]
@code varchar(6),
@isuueDate datetime,
@expiryDate datetime,
@discount decimal(4,2),
@adminId int
As
IF @code is Null or
@isuueDate is Null or
@expiryDate is Null or
@discount is Null or
@adminId is Null
Print 'Cannot create promocode'
Else
Insert into Promocode Values(@code,@isuueDate,@expiryDate,@discount,@adminId)


GO
/****** Object:  StoredProcedure [dbo].[AdminIssuePromocodeToStudent]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----- 10 Issue the promo code created to any student ----
CREATE Proc [dbo].[AdminIssuePromocodeToStudent]
@sid int,
@pid varchar(6)
As
If @pid is Null or
@sid is Null
Print 'Error'
Else
Insert into StudentHasPromocode Values(@sid, @pid)


GO
/****** Object:  StoredProcedure [dbo].[AdminListAllStudents]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- 8 List all students in the system -----
CREATE Proc [dbo].[AdminListAllStudents]
As
Select *
from Users u inner join Student s on u.id = s.id
GO
/****** Object:  StoredProcedure [dbo].[AdminListInstr]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------------------------
--- 1 List all instructors in the system ----

CREATE Proc [dbo].[AdminListInstr]
As
Select u.firstName, u.lastName
from Users u inner join Instructor i on u.id = i.id

GO
/****** Object:  StoredProcedure [dbo].[AdminViewAllCourses]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- 3 List all courses in the system ------
CREATE Proc [dbo].[AdminViewAllCourses]
As
Select name, creditHours, price, content, accepted
From Course

GO
/****** Object:  StoredProcedure [dbo].[AdminViewCourseDetails]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---- 5 View any course details such as course description and content ----
CREATE Proc [dbo].[AdminViewCourseDetails]
@courseId int
As
Select name, creditHours, price, content, accepted
From Course
Where @courseId = id


GO
/****** Object:  StoredProcedure [dbo].[AdminViewInstructorProfile]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--- 2 view the profile of any instructor that contains all his/her information -----
CREATE Proc [dbo].[AdminViewInstructorProfile]
@instrId int
As
Select u.firstName, u.lastName, u.gender, u.email, u.address, i.rating
from Users u inner join Instructor i on u.id = i.id
WHERE @instrId = i.id

GO
/****** Object:  StoredProcedure [dbo].[AdminViewNonAcceptedCourses]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--- 4 List all the courses added by instructors not yet accepted ----
CREATE Proc [dbo].[AdminViewNonAcceptedCourses]
As
Select *
From Course
Where accepted = 0 or accepted is null
GO
/****** Object:  StoredProcedure [dbo].[AdminViewStudentProfile]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- 9  view the profile of any student that contains all his/her information ----
CREATE Proc [dbo].[AdminViewStudentProfile]
@sid int
As
Select u.firstName, u.lastName, u.gender, u.email, u.address, s.gpa
from Users u inner join Student s on u.id = s.id
WHERE @sid = s.id



GO
/****** Object:  StoredProcedure [dbo].[availableCourses]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[availableCourses]
@sid int
AS
SELECT Course.name
FROM Course
WHERE Course.accepted = '1'
    EXCEPT
select name
from StudentTakeCourse
         inner join Course on StudentTakeCourse.cid = Course.id
where StudentTakeCourse.sid = @sid
GO
/****** Object:  StoredProcedure [dbo].[calculateFinalGrade]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[calculateFinalGrade]
    @cid int ,
    @sid int ,
    @insId int
AS
BEGIN

    declare @studentScore decimal(5,2)

    select @studentScore =  sum(ROUND( A.weight*(T.grade/A.fullGrade ) , 2 ))
    from Assignment A inner join StudentTakeAssignment T on A.cid = T.cid and A.number = T.assignmentNumber and A.type = T.assignmenttype
    where T.sid = @sid and T.cid = @cid

    update StudentTakeCourse
    set grade = @studentScore
    where cid=@cid and sid=@sid and insid=@insId

END
GO
/****** Object:  StoredProcedure [dbo].[courseInformation]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[courseInformation]
@id int
AS
IF(EXISTS(SELECT * FROM Course WHERE id = @id))
BEGIN
SELECT Course.*, Users.firstName,Users.lastName FROM Course  INNER JOIN Instructor ON Course.instructorId = Instructor.id
INNER JOIN Users ON Instructor.id = Users.id
WHERE Course.id = @id
END


GO
/****** Object:  StoredProcedure [dbo].[DefineAssignmentOfCourseOfCertianType]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- 6 Define Assignment of a course of a certian type ----
CREATE Proc [dbo].[DefineAssignmentOfCourseOfCertianType] @instId int,
                                                  @cid int,
                                                  @number int,
                                                  @type varchar(10),
                                                  @fullGrade int,
                                                  @weight decimal(4, 1),
                                                  @deadline datetime,
                                                  @content varchar(200),
                                                  @sucess int output
As
declare @weights int
select @weights = sum(weight)
from course C
         inner join Assignment A on C.id = A.cid where c.id = @cid
    if (@weights + @weight > 100)
        set @sucess = 0
    else
        set @sucess = 1

    if (@sucess = 1 and exists(select *
               from Course
               where id = @cid
                 and instructorId = @instId))
        Insert into Assignment values (@cid, @number, @type, @fullGrade, @weight, @deadline, @content)
GO
/****** Object:  StoredProcedure [dbo].[DefineCoursePrerequisites]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------
CREATE Proc [dbo].[DefineCoursePrerequisites]
@cid int ,
@prerequsiteId int
As
if(exists(select * from Course where id=@cid))
Insert into CoursePrerequisiteCourse values (@cid,@prerequsiteId)

GO
/****** Object:  StoredProcedure [dbo].[editMyProfile]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[editMyProfile]
@id int,
@firstName varchar(10),
@lastName varchar(10),
@password varchar(10),
@gender binary,
@email varchar(10),
@address varchar(10)
AS
IF (EXISTS(SELECT * FROM Users WHERE id=@id))
BEGIN
IF (@firstName IS NOT NULL )
UPDATE Users SET firstName = @firstName WHERE id=@id
IF (@lastName IS NOT NULL)
UPDATE Users SET lastName = @lastName WHERE id=@id
IF (@password IS NOT NULL)
UPDATE Users SET [password] = @password WHERE id=@id
IF (@gender IS NOT NULL)
UPDATE Users SET gender = @gender WHERE id=@id
IF (@email IS NOT NULL)
UPDATE Users SET email = @emaiL WHERE id=@id
IF (@address IS NOT NULL)
UPDATE Users SET address = @address WHERE id=@id
END
ELSE
print 'User not found'

GO
/****** Object:  StoredProcedure [dbo].[enrollInCourse]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Enroll in a course which I had viewed its information.
-- which instructor ??
Create PROC [dbo].[enrollInCourse]
@sid INT,
@cid INT,
@instr int
AS
BEGIN
If (EXISTS ((select * from InstructorTeachCourse where insid = @instr and cid=@cid )))
Begin
if (exists(select * from CoursePrerequisiteCourse where cid=@cid))
begin
if(exists(select * from StudentTakeCourse where sid=@sid and
cid in (select preid from CoursePrerequisiteCourse where cid=@cid) ) )
INSERT INTO StudentTakeCourse (sid,cid,insid) VALUES (@sid,@cid,@instr)
else
print 'Student didnt take this course pre-requisite'
end
else
INSERT INTO StudentTakeCourse (sid,cid,insid) VALUES (@sid,@cid,@instr)
END
else
print 'This instructor does not teach this course'
END

GO
/****** Object:  StoredProcedure [dbo].[enrollInCourseViewContent]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[enrollInCourseViewContent]
@id int,
@cid int
AS
BEGIN
IF (EXISTS(SELECT * FROM Users WHERE id=@id))
SELECT C.* FROM Course C INNER JOIN StudentTakeCourse STC ON C.id = STC.cid INNER JOIN Student S ON STC.sid = S.id
INNER JOIN Users Us ON Us.id = S.id
WHERE Us.id = @id and c.id=@cid
ELSE
print 'not a user'
END


GO
/****** Object:  StoredProcedure [dbo].[InstAddCourse]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------
--Instructor
--- 1 Add a new course content and description  ----
CREATE Proc [dbo].[InstAddCourse]
@creditHours int,
@name varchar(10),
@content varchar(200) ,
@description varchar(200) ,
@price DECIMAL(6,2),
@instructorId int
As
if(exists(select * from Instructor where id=@instructorId))
Insert into Course(creditHours,name,price,instructorId , content , courseDescription) values
(@creditHours,@name,@price,@instructorId , @content , @description)
declare @cid int
select @cid = SCOPE_IDENTITY()
insert into InstructorTeachCourse(cid,insid) values(@cid,@instructorId)

GO
/****** Object:  StoredProcedure [dbo].[InstructorgradeAssignmentOfAStudent]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- 9 Instructor grade the assignemnt submitted by the student  ----

CREATE Proc [dbo].[InstructorgradeAssignmentOfAStudent]
@instrId int,
@sid int ,
@cid int,
@assignmentNumber int,
@type varchar(10),
@grade decimal(5,2)
As
if(exists(select * from StudentTakeAssignment S inner join Course C
on C.id =S.cid where cid=@cid and assignmentNumber=@assignmentNumber and sid=@sid and instructorId= @instrId and assignmenttype=@type))
update StudentTakeAssignment
set grade=@grade
where sid=@sid and cid=@cid and assignmentNumber=@assignmentNumber and assignmenttype =@type

GO
/****** Object:  StoredProcedure [dbo].[InstructorIssueCertificateToStudent]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- 12 instructor issue certificate to a student   ----
Create Proc [dbo].[InstructorIssueCertificateToStudent]
@cid int ,
@sid int ,
@insId int,
@issueDate datetime
As
if(
exists(select * from StudentTakeCourse where sid=@sid and grade >2.0 and cid=@cid))
Insert into StudentCertifyCourse values (@sid,@cid,@issueDate)



GO
/****** Object:  StoredProcedure [dbo].[InstructorRegister]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------
CREATE proc [dbo].[InstructorRegister]
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@email varchar(50),
@gender bit,
@address varchar(50)
as
begin
insert into users(firstName,lastName,password,email,gender,address)
values(@first_name,@last_name,@password,@email,@gender,@address)
declare @id int
SELECT @id=SCOPE_IDENTITY()
insert into Instructor values(@id,0)
end
GO
/****** Object:  StoredProcedure [dbo].[InstructorViewAcceptedCoursesByAdmin]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- 5 List my courses that were accepted by the admin ----
CREATE Proc [dbo].[InstructorViewAcceptedCoursesByAdmin]
@instrId int
As
Select id ,name, creditHours
From Course
Where accepted=1 and instructorId=@instrId

GO
/****** Object:  StoredProcedure [dbo].[InstructorViewAssignmentsStudents]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- 8 Instructor view assignments of his students  ----

CREATE Proc [dbo].[InstructorViewAssignmentsStudents]
@instrId int,
@cid int
As
Select sid ,cid,assignmentNumber, assignmenttype, grade
From StudentTakeAssignment S inner join course c on s.cid = c.id
Where cid=@cid and c.instructorId =@instrId

GO
/****** Object:  StoredProcedure [dbo].[payCourse]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[payCourse]
@cid INT,
@sid INT
AS
BEGIN
IF (EXISTS(SELECT * FROM StudentHasPromoCode WHERE sid = @sid ))
update StudentTakeCourse
set payedfor =1
where  cid = @cid and  sid=@sid

END
GO
/****** Object:  StoredProcedure [dbo].[rateInstructor]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[rateInstructor]
@rate DECIMAL (2,1),
@sid INT,
@insid INT
AS
BEGIN
IF(dbo.checkStudentEnrolledInCourse(@sid,@insid)='1')
INSERT INTO StudentRateInstructor (sid,insid,rate) VALUES (@sid,@insid,@rate)
ELSE
print 'student not enrolled in insturctor course'
END


GO
/****** Object:  StoredProcedure [dbo].[studentRegister]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------
CREATE proc [dbo].[studentRegister]
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@email varchar(50),
@gender bit,
@address varchar(50)
as
begin
insert into users(firstName,lastName,password,email,gender,address)
values(@first_name,@last_name,@password,@email,@gender,@address)
declare @id int
SELECT @id=SCOPE_IDENTITY()
insert into Student values(@id,0)
end
GO
/****** Object:  StoredProcedure [dbo].[submitAssign]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[submitAssign]
@assignType VARCHAR(10),
@assignnumber int,
@sid INT,
@cid INT
AS
BEGIN
IF (EXISTS(SELECT * FROM StudentTakeCourse WHERE cid = @cid AND sid = @sid ))

INSERT INTO StudentTakeAssignment values (@sid,@cid,@assignnumber,@assignType,null)
ELSE
print 'not enrolled in course'
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCourseContent]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- 2 update course content  ----
CREATE Proc [dbo].[UpdateCourseContent]
@instrId int,
@courseId int,
@content varchar(200)
As
if(exists(select * from Course where id=@courseId))
update Course
set content=@content
where id=@courseId and accepted <>0 and accepted is not null and instructorId=@instrId

GO
/****** Object:  StoredProcedure [dbo].[UpdateCourseDescription]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------
--- 3 update course description ----

CREATE Proc [dbo].[UpdateCourseDescription]
@instrId int,
@courseId int,
@courseDescription varchar(200)
As
if(exists(select * from Course where id=@courseId))
update Course
set courseDescription=@courseDescription
where id=@courseId and accepted <>0 and accepted is not null and instructorId=@instrId

GO
/****** Object:  StoredProcedure [dbo].[updateInstructorRate]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[updateInstructorRate]
@insid int
As
if(exists(select * from Instructor where id=@insid))
declare @avgRating float
select @avgRating=avg(rate)
from StudentRateInstructor
where insid=@insid

update Instructor
set rating=@avgRating
where id=@insid


GO
/****** Object:  StoredProcedure [dbo].[userLogin]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------
CREATE proc [dbo].[userLogin]
@id int,
@password varchar(20),
@success bit output,
@type int output
as
begin
if exists(
select ID,password
from users
where id=@id and password=@password)
begin
set @success =1
-- check user type 0-->Instructor,1-->Admin,2-->Student
if exists(select id from Student where id=@id)
set @type=0
if exists(select id from Instructor where id=@id)
set @type=1
if exists(select id from Admin where id=@id)
set @type=2
end
else
begin
set @success=0
set @type=-1
end
end
GO
/****** Object:  StoredProcedure [dbo].[viewAssign]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[viewAssign]
@courseId int,
@Sid int
AS
BEGIN
IF (EXISTS(SELECT * FROM Users WHERE id=@Sid))
SELECT A.* FROM Assignment A INNER JOIN Course C
ON A.cid = C.id WHERE C.id = @courseId and
not exists (select * from StudentTakeAssignment where sid = @Sid and cid = @courseId
and StudentTakeAssignment.assignmentNumber = A.number and StudentTakeAssignment.assignmenttype=A.type)
ELSE
print 'not a user'
END
GO
/****** Object:  StoredProcedure [dbo].[viewAssignGrades]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--View the grades of each assignment type.
CREATE PROC [dbo].[viewAssignGrades]
@assignnumber int,
@assignType VARCHAR(10),
@cid INT,
@sid INT,
@assignGrade INT OUTPUT
AS
IF(EXISTS(SELECT * FROM StudentTakeAssignment STC INNER JOIN Course C
ON STC.cid = C.id INNER JOIN Assignment A ON STC.assignmentNumber = A.number
WHERE STC.cid = @cid AND STC.sid = @sid AND C.id = @cid AND A.[type] = @assignType ))

SELECT @assignGrade = STC.grade FROM StudentTakeAssignment STC  INNER JOIN Course C
ON STC.cid = C.id INNER JOIN Assignment A ON STC.assignmentNumber = A.number
WHERE STC.cid = @cid AND STC.sid = @sid AND C.id = @cid AND A.[type] = @assignType
and A.number=@assignnumber
ELSE
print 'user does not take course'

GO
/****** Object:  StoredProcedure [dbo].[viewCertificate]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[viewCertificate]
@cid INT,
@sid INT
AS
BEGIN
IF (dbo.checkStudentEnrolledInCourse(@sid,@cid)='1' AND EXISTS(SELECT A.fullGrade FROM Assignment A
INNER JOIN Course C ON A.cid = C.id WHERE C.id= @cid ) )
SELECT * FROM StudentCertifyCourse WHERE sid = @sid AND cid = @cid
ELSE
print 'student not enrolled in course or did not finish course'
END


GO
/****** Object:  StoredProcedure [dbo].[ViewFeedbacksAddedByStudentsOnMyCourse]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- 10 View feedbacks added by students on my course  ----

CREATE Proc [dbo].[ViewFeedbacksAddedByStudentsOnMyCourse]
@instrId int,
@cid int
As
Select number,comment ,numberOfLikes
From Feedback f inner join course c on c.id = f.cid
Where cid=@cid and instructorId =@instrId

GO
/****** Object:  StoredProcedure [dbo].[viewFinalGrade]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[viewFinalGrade]
@cid INT,
@sid INT,
@finalgrade decimal(10,2) OUTPUT
AS
BEGIN
IF(dbo.checkStudentEnrolledInCourse(@sid,@cid) = '1' )
SELECT @finalgrade=Grade
FROM StudentTakeCourse
where cid=@cid and sid=@sid
END




GO
/****** Object:  StoredProcedure [dbo].[ViewInstructorProfile]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- 7 Instructor view his profile  ----
CREATE Proc [dbo].[ViewInstructorProfile]
@instrId int
As
Select *
from Users u inner join Instructor i on u.id = i.id
left outer join  UserMobileNumber im on im.id=u.id
WHERE i.id=@instrId
GO
/****** Object:  StoredProcedure [dbo].[viewMyProfile]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[viewMyProfile]
@id int
AS
BEGIN
IF (EXISTS(Select * FROM Users WHERE id = @id  ))
SELECT * FROM Student INNER JOIN Users ON Student.id = Users.id
WHERE Student.id = @id
ELSE
print 'User not found'
END

GO
/****** Object:  StoredProcedure [dbo].[viewPromocode]    Script Date: 1/13/2021 7:25:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[viewPromocode]
@sid int
AS
SELECT P.* FROM Promocode  P inner join StudentHasPromocode SP on SP.code = P.code
where SP.sid=@sid

GO
