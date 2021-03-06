SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[TempCatalog]
Print 'Create Table [dbo].[TempCatalog]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempCatalog] (
		[EditSessionID]               [varchar](32) NOT NULL,
		[TempCatalogID]               [uniqueidentifier] NOT NULL,
		[ContextPath]                 [nvarchar](425) NOT NULL,
		[Name]                        [nvarchar](425) NOT NULL,
		[Content]                     [varbinary](max) NULL,
		[Description]                 [nvarchar](max) NULL,
		[Intermediate]                [uniqueidentifier] NULL,
		[IntermediateIsPermanent]     [bit] NOT NULL,
		[Property]                    [nvarchar](max) NULL,
		[Parameter]                   [nvarchar](max) NULL,
		[OwnerID]                     [uniqueidentifier] NOT NULL,
		[CreationTime]                [datetime] NOT NULL,
		[ExpirationTime]              [datetime] NOT NULL,
		[DataCacheHash]               [varbinary](64) NULL,
		CONSTRAINT [UNIQ_TempCatalogID]
		UNIQUE
		NONCLUSTERED
		([TempCatalogID])
		ON [PRIMARY],
		CONSTRAINT [PK_TempCatalog]
		PRIMARY KEY
		CLUSTERED
		([EditSessionID], [ContextPath])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TempCatalog]
	ADD
	CONSTRAINT [DF__TempCatal__Inter__3D5E1FD2]
	DEFAULT ((0)) FOR [IntermediateIsPermanent]
GO
CREATE NONCLUSTERED INDEX [IX_Cleanup]
	ON [dbo].[TempCatalog] ([ExpirationTime])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[TempCatalog] SET (LOCK_ESCALATION = TABLE)
GO

