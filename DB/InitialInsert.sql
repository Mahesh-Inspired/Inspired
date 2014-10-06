
delete from Gen_LookupItem
delete from Gen_LookupType
delete from Gen_LookupGroup

select * from gen_lookuptype


delete from gen_lookuptype where id = 3

insert into Gen_CompanyMaster (Id,Company_Code,Company_Description,Status) values (3,'1','Inspired Lighting','A');
insert into Gen_BranchMaster (Company_Id,Description) values (3, 'Default Branch')
insert into Gen_UserMaster (UserName, Company_Id, Branch_Id, STatus) values ('InventoryUser1',3,1,'A')

insert into gen_lookuptype  values (1,'Material Statuses','Active',3,1,getdate()) -- 1 - 9
insert into gen_lookuptype  values (2,'Category types','Active',3,1,getdate()) -- 10-19
insert into Gen_LookupType  values(3,'Alternate Relative','Active',3,1,getdate()) -- 20-24
insert into Gen_LookupType  values (4, 'Specification Group','Active',3,1,GETDATE()) -- 10001 - 10499
insert into Gen_lookupType  values (5,'Foreign Currency','Active',3,1,getdate()) -- 25-34
insert into Gen_lookupType  values (6,'Notes type','Active',3,1,getdate()) -- 35-44
insert into Gen_lookupType  values (7,'Notes Priority','Active',3,1,getdate()) -- 35-44


select * from Gen_LookupItem
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (1,1, 'Active',1,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (2,1, 'Passive',2,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (3,1, 'Temporary',3,3,1,getdate())

insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (10,2, 'Group of Lights',1,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (11,2, 'Type of Lights',2,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (12,2, 'Category',3,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (13,2, 'Sub Category',4,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) values (14,2, 'Make',5,3,1,getdate())

insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (20,3,'Alternate',1,3,1,getdate())
insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (21,3,'Relative',2,3,1,getdate())

insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (25,5,'GBP',1,3,1,getdate())
insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (26,5,'EURO',2,3,1,getdate())


insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (35,6,'Internal',1,3,1,getdate())
insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (36,6,'External',2,3,1,getdate())
insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (37,6,'Secretive',3,3,1,getdate())


insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (45,7,'Critical',1,3,1,getdate())
insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (46,7,'Information',2,3,1,getdate())
insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (47,7,'General',3,3,1,getdate())


insert into Gen_LookupGroup(Id, LookupType_Id, Description,Company_Id, User_Id,Last_Updated) values(1,4,'General',3,1,getdate())
insert into Gen_LookupGroup(Id, LookupType_Id, Description,Company_Id, User_Id,Last_Updated) values(2,4,'Packaging',3,1,getdate())


insert into Gen_lookupItem (Id,LookupType_Id,LookupGroup_Id, Description, ordinal, Company_Id, User_Id, last_update) values (10001,4,1, 'Specification 1',1,3,1,getdate())
insert into Gen_lookupItem (Id,LookupType_Id,LookupGroup_Id, Description, ordinal, Company_Id, User_Id, last_update) values (10002,4,2, 'Height',2,3,1,getdate())



insert into Inv_CategoryMaster (Type, Code, Description, Status, Company_Id, User_Id, Last_Updated) values (1,'Group1','My Test Group of lights','A',3,1,GETDATE())



--insert into Gen_lookupType values (7,'Account Type','Active',3,1,getdate())
--insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (40,7,'Cash',1,3,1,getdate())
--insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (41,7,'Bank',2,3,1,getdate())
--insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (42,7,'Creditors',3,3,1,getdate())
--insert into Gen_LookupItem (Id,LookupType_Id,Description, ordinal, Company_Id, User_Id, last_update) Values (43,7,'Debtors',4,3,1,getdate())

