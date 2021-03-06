SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ExecutionCache]
Print 'Create Table [dbo].[ExecutionCache]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ExecutionCache] (
		[ExecutionCacheID]       [uniqueidentifier] NOT NULL,
		[ReportID]               [uniqueidentifier] NOT NULL,
		[ExpirationFlags]        [int] NOT NULL,
		[AbsoluteExpiration]     [datetime] NULL,
		[RelativeExpiration]     [int] NULL,
		[SnapshotDataID]         [uniqueidentifier] NOT NULL,
		[LastUsedTime]           [datetime] NOT NULL,
		[ParamsHash]             [int] NOT NULL,
		CONSTRAINT [PK_ExecutionCache]
		PRIMARY KEY
		NONCLUSTERED
		([ExecutionCacheID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExecutionCache]
	ADD
	CONSTRAINT [DF__Execution__LastU__398D8EEE]
	DEFAULT (getdate()) FOR [LastUsedTime]
GO
ALTER TABLE [dbo].[ExecutionCache]
	ADD
	CONSTRAINT [DF__Execution__Param__440B1D61]
	DEFAULT ((0)) FOR [ParamsHash]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_ExecutionCache]
	ON [dbo].[ExecutionCache] ([AbsoluteExpiration] DESC, [ReportID], [SnapshotDataID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SnapshotDataID]
	ON [dbo].[ExecutionCache] ([SnapshotDataID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CacheLookup]
	ON [dbo].[ExecutionCache] ([ReportID], [ParamsHash], [AbsoluteExpiration] DESC)
	INCLUDE ([SnapshotDataID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExecutionCache] SET (LOCK_ESCALATION = TABLE)
GO

