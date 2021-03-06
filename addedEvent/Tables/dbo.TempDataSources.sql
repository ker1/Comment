SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[TempDataSources]
Print 'Create Table [dbo].[TempDataSources]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempDataSources] (
		[DSID]                                     [uniqueidentifier] NOT NULL,
		[ItemID]                                   [uniqueidentifier] NOT NULL,
		[Name]                                     [nvarchar](260) NULL,
		[Extension]                                [nvarchar](260) NULL,
		[Link]                                     [uniqueidentifier] NULL,
		[CredentialRetrieval]                      [int] NULL,
		[Prompt]                                   [ntext] NULL,
		[ConnectionString]                         [image] NULL,
		[OriginalConnectionString]                 [image] NULL,
		[OriginalConnectStringExpressionBased]     [bit] NULL,
		[UserName]                                 [image] NULL,
		[Password]                                 [image] NULL,
		[Flags]                                    [int] NULL,
		[Version]                                  [int] NOT NULL,
		CONSTRAINT [PK_DataSource]
		PRIMARY KEY
		CLUSTERED
		([DSID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DataSourceItemID]
	ON [dbo].[TempDataSources] ([ItemID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[TempDataSources] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [dbo].[TempDataSources]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DataSourceItemID]
	FOREIGN KEY ([ItemID]) REFERENCES [dbo].[TempCatalog] ([TempCatalogID])
ALTER TABLE [dbo].[TempDataSources]
	CHECK CONSTRAINT [FK_DataSourceItemID]

GO

