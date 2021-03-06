USE [Inspired]
GO
/****** Object:  Table [dbo].[Gen_LookupGroup]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gen_LookupGroup](
	[Id] [int] NOT NULL,
	[LookupType_Id] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[IsHidden] [bit] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Gen_LookupGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Gen_LookupGroup] ADD  CONSTRAINT [DF_Gen_LookupGroup_IsHidden]  DEFAULT ((0)) FOR [IsHidden]
GO
ALTER TABLE [dbo].[Gen_LookupGroup]  WITH CHECK ADD  CONSTRAINT [FK_Gen_LookupGroup_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Gen_LookupGroup] CHECK CONSTRAINT [FK_Gen_LookupGroup_Company]
GO
