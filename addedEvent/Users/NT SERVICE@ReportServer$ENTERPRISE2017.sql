SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create User [NT SERVICE\ReportServer$ENTERPRISE2017]
Print 'Create User [NT SERVICE\ReportServer$ENTERPRISE2017]'
GO
CREATE USER [NT SERVICE\ReportServer$ENTERPRISE2017]
	FOR LOGIN [NT SERVICE\ReportServer$ENTERPRISE2017]
	WITH DEFAULT_SCHEMA = [NT SERVICE\ReportServer$ENTERPRISE2017]
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
