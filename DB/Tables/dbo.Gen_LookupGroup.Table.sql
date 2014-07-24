USE [Inspired]
GO
/****** Object:  Table [dbo].[Gen_LookupGroup]    Script Date: 24/07/2014 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gen_LookupGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LookupType_Id] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Gen_LookupGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gen_LookupGroup]  WITH CHECK ADD  CONSTRAINT [FK_Gen_LookupGroup_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Gen_LookupGroup] CHECK CONSTRAINT [FK_Gen_LookupGroup_Company]
GO
