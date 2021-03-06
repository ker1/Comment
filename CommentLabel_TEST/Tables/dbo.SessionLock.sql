SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[SessionLock]
Print 'Create Table [dbo].[SessionLock]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SessionLock] (
		[SessionID]       [varchar](32) NOT NULL,
		[LockVersion]     [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SessionLock]
	ADD
	CONSTRAINT [DF__SessionLo__LockV__46E78A0C]
	DEFAULT ((0)) FOR [LockVersion]
GO
CREATE UNIQUE CLUSTERED INDEX [IDX_SessionLock]
	ON [dbo].[SessionLock] ([SessionID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[SessionLock] SET (LOCK_ESCALATION = TABLE)
GO

