SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ChunkSegmentMapping]
Print 'Create Table [dbo].[ChunkSegmentMapping]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ChunkSegmentMapping] (
		[ChunkId]              [uniqueidentifier] NOT NULL,
		[SegmentId]            [uniqueidentifier] NOT NULL,
		[StartByte]            [bigint] NOT NULL,
		[LogicalByteCount]     [int] NOT NULL,
		[ActualByteCount]      [int] NOT NULL,
		CONSTRAINT [PK_ChunkSegmentMapping]
		PRIMARY KEY
		CLUSTERED
		([ChunkId], [SegmentId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping]
	ADD
	CONSTRAINT [Positive_StartByte]
	CHECK
	([StartByte]>=(0))
GO
ALTER TABLE [dbo].[ChunkSegmentMapping]
CHECK CONSTRAINT [Positive_StartByte]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping]
	ADD
	CONSTRAINT [Positive_LogicalByteCount]
	CHECK
	([LogicalByteCount]>=(0))
GO
ALTER TABLE [dbo].[ChunkSegmentMapping]
CHECK CONSTRAINT [Positive_LogicalByteCount]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping]
	ADD
	CONSTRAINT [Positive_ActualByteCount]
	CHECK
	([ActualByteCount]>=(0))
GO
ALTER TABLE [dbo].[ChunkSegmentMapping]
CHECK CONSTRAINT [Positive_ActualByteCount]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UNIQ_ChunkId_StartByte]
	ON [dbo].[ChunkSegmentMapping] ([ChunkId], [StartByte])
	INCLUDE ([LogicalByteCount], [ActualByteCount])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ChunkSegmentMapping_SegmentId]
	ON [dbo].[ChunkSegmentMapping] ([SegmentId])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping] SET (LOCK_ESCALATION = TABLE)
GO

