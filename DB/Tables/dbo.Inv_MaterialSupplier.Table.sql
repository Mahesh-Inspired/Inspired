USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialSupplier]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_MaterialSupplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Supplier_Code] [int] NOT NULL,
	[Ref_Number] [varchar](50) NOT NULL,
	[Min_Order] [int] NULL,
	[Notes] [text] NULL,
	[Currency] [int] NOT NULL,
	[Cost] [numeric](18, 2) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSupplier_FAS_AccountMaster] FOREIGN KEY([Supplier_Code])
REFERENCES [dbo].[FAS_AccountMaster] ([Accd_Key])
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier] CHECK CONSTRAINT [FK_Inv_MaterialSupplier_FAS_AccountMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSupplier_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier] CHECK CONSTRAINT [FK_Inv_MaterialSupplier_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSupplier_Gen_LookupItem] FOREIGN KEY([Currency])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier] CHECK CONSTRAINT [FK_Inv_MaterialSupplier_Gen_LookupItem]
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSupplier_Inv_MaterialMaster] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier] CHECK CONSTRAINT [FK_Inv_MaterialSupplier_Inv_MaterialMaster]
GO
