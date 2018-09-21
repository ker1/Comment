SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[CustomerCustomerDemo]
Print 'Create Table [dbo].[CustomerCustomerDemo]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerCustomerDemo] (
		[CustomerID]         [nchar](5) NOT NULL,
		[CustomerTypeID]     [nchar](10) NOT NULL,
		CONSTRAINT [PK_CustomerCustomerDemo]
		PRIMARY KEY
		NONCLUSTERED
		([CustomerID], [CustomerTypeID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerCustomerDemo] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[CustomerCustomerDemo]
	WITH CHECK
	ADD CONSTRAINT [FK_CustomerCustomerDemo]
	FOREIGN KEY ([CustomerTypeID]) REFERENCES [dbo].[CustomerDemographics] ([CustomerTypeID])
ALTER TABLE [dbo].[CustomerCustomerDemo]
	CHECK CONSTRAINT [FK_CustomerCustomerDemo]

GO
ALTER TABLE [dbo].[CustomerCustomerDemo]
	WITH CHECK
	ADD CONSTRAINT [FK_CustomerCustomerDemo_Customers]
	FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID])
ALTER TABLE [dbo].[CustomerCustomerDemo]
	CHECK CONSTRAINT [FK_CustomerCustomerDemo_Customers]

GO

