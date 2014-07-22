USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_CategoryMaster]    Script Date: 21/07/2014 16:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_CategoryMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Description] [varchar](500) NULL,
	[Status] [varchar](1) NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_CategoryMaster] PRIMARY KEY CLUSTERED 
(
	[Type] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Inv_CategoryMaster]  WITH CHECK ADD  CONSTRAINT [FK_CategoryType_Lookup] FOREIGN KEY([Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_CategoryMaster] CHECK CONSTRAINT [FK_CategoryType_Lookup]
GO
ALTER TABLE [dbo].[Inv_CategoryMaster]  WITH CHECK ADD  CONSTRAINT [FK_Inv_CategoryMaster_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_CategoryMaster] CHECK CONSTRAINT [FK_Inv_CategoryMaster_Gen_CompanyMaster]
GO
