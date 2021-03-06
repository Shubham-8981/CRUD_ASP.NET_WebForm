USE [Employee]

/****** Create Table ******/
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Address] [varchar](250) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

/****** Create StoredProcedure ContactCreateOrUpdate ******/

Create PROC ContactCreateOrUpdate 
@ConatctID int,
@Name varchar(50),
@Mobile varchar(50),
@Address varchar(250)
AS
BEGIN
IF(@ConatctID=0)
	BEGIN
	INSERT INTO Contact(Name,Mobile,Address)
	VALUES(@Name,@Mobile,@Address)
	END
ELSE
	BEGIN
	UPDATE Contact
	SET
		Name = @Name,
		Mobile = @Mobile,
		Address = @Address
	WHERE ContactID= @ConatctID
	END

END

/****** Create StoredProcedure ContactDeleteByID ******/

Create PROC ContactDeleteByID
@ContactID int
AS
	BEGIN
	DELETE FROM Contact
	WHERE ContactID = @ContactID
	END

/****** Create StoredProcedure ContactViewAll ******/

Create PROC [dbo].[ContactViewAll]
AS
	BEGIN
	SELECT *
	FROM Contact
	END

/****** Create StoredProcedure ContactViewByID  ******/

Create PROC [dbo].[ContactViewByID]
@ContactID int
As
	BEGIN
	SELECT *
	FROm Contact
	WHERE ContactID = @ContactID
	END
