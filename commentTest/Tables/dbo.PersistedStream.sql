SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[PersistedStream]
Print 'Create Table [dbo].[PersistedStream]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersistedStream] (
		[SessionID]          [varchar](32) NOT NULL,
		[Index]              [int] NOT NULL,
		[Content]            [image] NULL,
		[Name]               [nvarchar](260) NULL,
		[MimeType]           [nvarchar](260) NULL,
		[Extension]          [nvarchar](260) NULL,
		[Encoding]           [nvarchar](260) NULL,
		[Error]              [nvarchar](512) NULL,
		[RefCount]           [int] NOT NULL,
		[ExpirationDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_PersistedStream]
		PRIMARY KEY
		CLUSTERED
		([SessionID], [Index])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PersistedStream] SET (LOCK_ESCALATION = TABLE)
GO

