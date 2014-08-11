USE [Inspired]
GO
/****** Object:  Table [dbo].[Gen_CompanyMaster]    Script Date: 11/08/2014 21:03:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gen_CompanyMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Code] [nvarchar](10) NOT NULL,
	[Company_Description] [varchar](500) NOT NULL,
	[Status] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Gen_CompanyMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
