USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialDiscount]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_MaterialDiscount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Type] [int] NULL,
	[Customer_Id] [int] NULL,
	[Branch_Id] [int] NULL,
	[Group_Id] [int] NULL,
	[Type_Id] [int] NULL,
	[Category_Id] [int] NULL,
	[SubCategory_Id] [int] NULL,
	[Make_Id] [int] NULL,
	[Model_Number_Id] [int] NULL,
	[Item_Id] [int] NULL,
	[Discount] [numeric](18, 2) NOT NULL,
	[Based_On] [varchar](1) NULL,
	[From_Qty] [int] NOT NULL,
	[To_Qty] [int] NOT NULL,
	[Price_Type] [int] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialDiscount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Category]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_FAS_AccountMaster] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[FAS_AccountMaster] ([Accd_Key])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_FAS_AccountMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Gen_BranchMaster] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[Gen_BranchMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Gen_BranchMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Gen_LookupItem] FOREIGN KEY([Price_Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Gen_LookupItem]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Group]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Inv_MaterialMaster] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Inv_MaterialMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Make] FOREIGN KEY([Make_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Make]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Model_Number] FOREIGN KEY([Model_Number_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Model_Number]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_SubCategory] FOREIGN KEY([SubCategory_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_SubCategory]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Type] FOREIGN KEY([Type_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Type]
GO
