SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Segment]
Print 'Create Table [dbo].[Segment]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Segment] (
		[SegmentId]     [uniqueidentifier] NOT NULL,
		[Content]       [varbinary](max) NULL,
		CONSTRAINT [PK_Segment]
		PRIMARY KEY
		CLUSTERED
		([SegmentId])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Segment]
	ADD
	CONSTRAINT [DF_Segment_SegmentId]
	DEFAULT (newsequentialid()) FOR [SegmentId]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SegmentMetadata]
	ON [dbo].[Segment] ([SegmentId])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Segment] SET (LOCK_ESCALATION = TABLE)
GO

