USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_WarehouseMaster]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_WarehouseMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Location] [varchar](500) NULL,
	[Type] [int] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[Branch_Id] [int] NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_WarehouseMaster_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Inv_WarehouseMaster]  WITH CHECK ADD  CONSTRAINT [FK_Inv_WarehouseMaster_Gen_BranchMaster] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[Gen_BranchMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_WarehouseMaster] CHECK CONSTRAINT [FK_Inv_WarehouseMaster_Gen_BranchMaster]
GO
ALTER TABLE [dbo].[Inv_WarehouseMaster]  WITH CHECK ADD  CONSTRAINT [FK_Inv_WarehouseMaster_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_WarehouseMaster] CHECK CONSTRAINT [FK_Inv_WarehouseMaster_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_WarehouseMaster]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseType_Lookup] FOREIGN KEY([Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_WarehouseMaster] CHECK CONSTRAINT [FK_WarehouseType_Lookup]
GO
