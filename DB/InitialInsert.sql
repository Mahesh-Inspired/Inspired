
insert into Gen_CompanyMaster (Id,Company_Code,Company_Description,Status) values (3,'1','Inspired Lighting','A');
insert into Gen_BranchMaster (Company_Id,Description) values (3, 'Default Branch')
insert into Gen_UserMaster (UserName, Company_Id, Branch_Id, STatus) values ('InventoryUser1',3,1,'A')

insert into gen_lookuptype  values (1,'Material Statuses','Active',3,1,getdate())
insert into gen_lookuptype  values (2,'Category types','Active',3,1,getdate())
insert into Gen_LookupType  values (3, 'YesNo','Active',3,1,GETDATE())
insert into Gen_LookupType  values (4, 'Specification Group','Active',3,1,GETDATE())
insert into Gen_LookupType  values (5, 'Specification','Active',3,1,GETDATE())

select * from Gen_LookupItem
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (1,1, 'Active',1,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (2,1, 'Passive',2,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (3,1, 'Temporary',3,3,1,getdate())

insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (10,2, 'Group of Lights',1,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (11,2, 'Type of Lights',1,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (12,2, 'Category',1,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (13,2, 'Sub Category',1,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (14,2, 'Make',1,3,1,getdate())

insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (20,3, 'Yes',1,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (21,3, 'No',2,3,1,getdate())

insert into Gen_LookupGroup(Id, LookupType_Id, Description,Company_Id, User_Id,Last_Updated) values(1,4,'General',3,1,getdate())
insert into Gen_LookupGroup(Id, LookupType_Id, Description,Company_Id, User_Id,Last_Updated) values(2,4,'Packaging',3,1,getdate())


insert into Gen_lookupItem (Id,LookupType_Id,LookupGroup_Id, Description, ordinal, Company_Id, User_Id, last_update) values (30,4,1, 'Specification 1',1,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,LookupGroup_Id, Description, ordinal, Company_Id, User_Id, last_update) values (31,4,2, 'Height',2,3,1,getdate())





insert into Inv_CategoryMaster (Type, Code, Description, Status, Company_Id, User_Id, Last_Updated) values (1,'Group1','My Test Group of lights','A',3,1,GETDATE())