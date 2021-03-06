USE [Inspired]
GO
/****** Object:  Table [dbo].[FAS_AccountMaster]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FAS_AccountMaster](
	[Accd_Key] [int] IDENTITY(1,1) NOT NULL,
	[Acc_Code] [varchar](50) NOT NULL,
	[Acc_Description] [varchar](500) NOT NULL,
	[Acc_Type] [varchar](50) NOT NULL,
	[Price_Type] [int] NULL,
	[Company_Id] [int] NOT NULL,
	[Branch_Id] [int] NOT NULL,
 CONSTRAINT [PK_FAS_AccountMaster] PRIMARY KEY CLUSTERED 
(
	[Accd_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[FAS_AccountMaster]  WITH CHECK ADD  CONSTRAINT [FK_FAS_AccountMaster_Gen_BranchMaster] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[Gen_BranchMaster] ([Id])
GO
ALTER TABLE [dbo].[FAS_AccountMaster] CHECK CONSTRAINT [FK_FAS_AccountMaster_Gen_BranchMaster]
GO
ALTER TABLE [dbo].[FAS_AccountMaster]  WITH CHECK ADD  CONSTRAINT [FK_FAS_AccountMaster_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[FAS_AccountMaster] CHECK CONSTRAINT [FK_FAS_AccountMaster_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[FAS_AccountMaster]  WITH CHECK ADD  CONSTRAINT [FK_FAS_AccountMaster_Gen_LookupItem] FOREIGN KEY([Price_Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[FAS_AccountMaster] CHECK CONSTRAINT [FK_FAS_AccountMaster_Gen_LookupItem]
GO
