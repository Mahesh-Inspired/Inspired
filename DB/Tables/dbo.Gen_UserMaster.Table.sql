USE [Inspired]
GO
/****** Object:  Table [dbo].[Gen_UserMaster]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gen_UserMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[Branch_Id] [int] NULL,
	[Status] [varchar](1) NULL,
 CONSTRAINT [PK_Gen_UserMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gen_UserMaster]  WITH CHECK ADD  CONSTRAINT [AspNetUser] FOREIGN KEY([UserName])
REFERENCES [dbo].[AspNetUsers] ([UserName])
GO
ALTER TABLE [dbo].[Gen_UserMaster] CHECK CONSTRAINT [AspNetUser]
GO
ALTER TABLE [dbo].[Gen_UserMaster]  WITH CHECK ADD  CONSTRAINT [Branch] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[Gen_BranchMaster] ([Id])
GO
ALTER TABLE [dbo].[Gen_UserMaster] CHECK CONSTRAINT [Branch]
GO
ALTER TABLE [dbo].[Gen_UserMaster]  WITH CHECK ADD  CONSTRAINT [Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Gen_UserMaster] CHECK CONSTRAINT [Company]
GO
