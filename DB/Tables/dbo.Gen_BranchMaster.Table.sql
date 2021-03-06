USE [Inspired]
GO
/****** Object:  Table [dbo].[Gen_BranchMaster]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gen_BranchMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[Description] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Gen_BranchMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gen_BranchMaster]  WITH CHECK ADD  CONSTRAINT [FK_Gen_BranchMaster_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Gen_BranchMaster] CHECK CONSTRAINT [FK_Gen_BranchMaster_Gen_CompanyMaster]
GO
