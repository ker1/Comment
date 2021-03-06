SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[SnapshotData]
Print 'Create Table [dbo].[SnapshotData]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SnapshotData] (
		[SnapshotDataID]        [uniqueidentifier] NOT NULL,
		[CreatedDate]           [datetime] NOT NULL,
		[ParamsHash]            [int] NULL,
		[QueryParams]           [ntext] NULL,
		[EffectiveParams]       [ntext] NULL,
		[Description]           [nvarchar](512) NULL,
		[DependsOnUser]         [bit] NULL,
		[PermanentRefcount]     [int] NOT NULL,
		[TransientRefcount]     [int] NOT NULL,
		[ExpirationDate]        [datetime] NOT NULL,
		[PageCount]             [int] NULL,
		[HasDocMap]             [bit] NULL,
		[Machine]               [nvarchar](512) NOT NULL,
		[PaginationMode]        [smallint] NULL,
		[ProcessingFlags]       [int] NULL,
		[IsCached]              [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SnapshotData]
	ADD
	CONSTRAINT [DF__SnapshotD__IsCac__21B6055D]
	DEFAULT ((0)) FOR [IsCached]
GO
CREATE CLUSTERED INDEX [IX_SnapshotData]
	ON [dbo].[SnapshotData] ([SnapshotDataID], [ParamsHash])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SnapshotCleaning]
	ON [dbo].[SnapshotData] ([PermanentRefcount], [TransientRefcount])
	INCLUDE ([Machine])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IS_SnapshotExpiration]
	ON [dbo].[SnapshotData] ([PermanentRefcount], [ExpirationDate])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[SnapshotData] SET (LOCK_ESCALATION = TABLE)
GO

