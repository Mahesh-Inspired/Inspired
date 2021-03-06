USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialPrice]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account_Id] [int] NULL,
	[Item_Id] [int] NOT NULL,
	[From_Qty] [int] NOT NULL,
	[To_Qty] [int] NOT NULL,
	[Price_Type] [int] NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialPrice_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Inv_MaterialPrice]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialPrice_FAS_AccountMaster] FOREIGN KEY([Account_Id])
REFERENCES [dbo].[FAS_AccountMaster] ([Accd_Key])
GO
ALTER TABLE [dbo].[Inv_MaterialPrice] CHECK CONSTRAINT [FK_Inv_MaterialPrice_FAS_AccountMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialPrice]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialPrice_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialPrice] CHECK CONSTRAINT [FK_Inv_MaterialPrice_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialPrice]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialPrice_Gen_LookupItem] FOREIGN KEY([Price_Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialPrice] CHECK CONSTRAINT [FK_Inv_MaterialPrice_Gen_LookupItem]
GO
ALTER TABLE [dbo].[Inv_MaterialPrice]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialPrice_Inv_MaterialMaster] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialPrice] CHECK CONSTRAINT [FK_Inv_MaterialPrice_Inv_MaterialMaster]
GO
