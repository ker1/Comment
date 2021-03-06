SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[SessionData]
Print 'Create Table [dbo].[SessionData]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SessionData] (
		[SessionID]                  [varchar](32) NOT NULL,
		[CompiledDefinition]         [uniqueidentifier] NULL,
		[SnapshotDataID]             [uniqueidentifier] NULL,
		[IsPermanentSnapshot]        [bit] NULL,
		[ReportPath]                 [nvarchar](464) NULL,
		[Timeout]                    [int] NOT NULL,
		[AutoRefreshSeconds]         [int] NULL,
		[Expiration]                 [datetime] NOT NULL,
		[ShowHideInfo]               [image] NULL,
		[DataSourceInfo]             [image] NULL,
		[OwnerID]                    [uniqueidentifier] NOT NULL,
		[EffectiveParams]            [ntext] NULL,
		[CreationTime]               [datetime] NOT NULL,
		[HasInteractivity]           [bit] NULL,
		[SnapshotExpirationDate]     [datetime] NULL,
		[HistoryDate]                [datetime] NULL,
		[PageHeight]                 [float] NULL,
		[PageWidth]                  [float] NULL,
		[TopMargin]                  [float] NULL,
		[BottomMargin]               [float] NULL,
		[LeftMargin]                 [float] NULL,
		[RightMargin]                [float] NULL,
		[AwaitingFirstExecution]     [bit] NULL,
		[EditSessionID]              [varchar](32) NULL,
		[DataSetInfo]                [varbinary](max) NULL,
		[SitePath]                   [nvarchar](440) NULL,
		[SiteZone]                   [int] NOT NULL,
		[ReportDefinitionPath]       [nvarchar](464) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SessionData]
	ADD
	CONSTRAINT [DF__SessionDa__SiteZ__44FF419A]
	DEFAULT ((0)) FOR [SiteZone]
GO
CREATE UNIQUE CLUSTERED INDEX [IDX_SessionData]
	ON [dbo].[SessionData] ([SessionID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SessionCleanup]
	ON [dbo].[SessionData] ([Expiration])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SessionSnapshotID]
	ON [dbo].[SessionData] ([SnapshotDataID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_EditSessionID]
	ON [dbo].[SessionData] ([EditSessionID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[SessionData] SET (LOCK_ESCALATION = TABLE)
GO

