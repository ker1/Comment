SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[TempDataSets]
Print 'Create Table [dbo].[TempDataSets]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempDataSets] (
		[ID]         [uniqueidentifier] NOT NULL,
		[ItemID]     [uniqueidentifier] NOT NULL,
		[LinkID]     [uniqueidentifier] NULL,
		[Name]       [nvarchar](260) NOT NULL,
		CONSTRAINT [PK_TempDataSet]
		PRIMARY KEY
		NONCLUSTERED
		([ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_TempDataSet_ItemID_Name]
	ON [dbo].[TempDataSets] ([ItemID], [Name])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DataSetLinkID]
	ON [dbo].[TempDataSets] ([LinkID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[TempDataSets] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[TempDataSets]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DataSetItemID]
	FOREIGN KEY ([ItemID]) REFERENCES [dbo].[TempCatalog] ([TempCatalogID])
ALTER TABLE [dbo].[TempDataSets]
	CHECK CONSTRAINT [FK_DataSetItemID]

GO

