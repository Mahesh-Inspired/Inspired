﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Inspired.Data;
using System.Data.Entity.Validation;
using Utilities.Data;
using Inspired.Data;

namespace Inspired.Repository
{
    public class UnitOfWork:IUnitOfWork
    {
        private InspiredEntities DbContext { get; set; }
        private bool _disposed;

        
        private IGenericRepository<Gen_UserMaster> _userMasterRepository;
        private IGenericRepository<Gen_LookupItem> _lookupItemRepository;
        private IGenericRepository<Gen_LookupType> _LookupTypeRepository;
        private IGenericRepository<Gen_LookupGroup> _LookupGroupRepository;
        private IGenericRepository<Gen_BranchMaster> _branchRepository;

        private IGenericRepository<Inv_CategoryMaster> _categoryMasterRepository;
        private IGenericRepository<Inv_MaterialMaster> _materialMasterRepository;
        private IGenericRepository<Inv_MaterialCategory> _materialCategoryRepository;
        private IGenericRepository<Inv_MaterialSpecification> _materialSpecificationRepository;
        private IGenericRepository<Inv_MaterialPackaging> _materialPackagingRepository;
        private IGenericRepository<Inv_MaterialSpares> _materialSparesRepository;
        private IGenericRepository<Inv_MaterialAlternateRelative> _materialAltRelativeRepository;
        private IGenericRepository<Inv_MaterialSupplier> _materialSupplierRepository;
        private IGenericRepository<Inv_MaterialNotes> _materialNotesRepository;
        private IGenericRepository<Inv_WarehouseMaster> _warehouseRepository;

        private IGenericRepository<FAS_AccountMaster> _accountMasterRepository;
        private IGenericRepository<Inv_MaterialDocument> _MaterialDocumentRepository;
        private IGenericRepository<Inv_DocumentMaster> _DocumentMasterRepository;
        private IGenericRepository<Inv_StockTran> _StockTransRepository;
        private IGenericRepository<Inv_StockTranSlNo> _StockTranslnoRepository;
        private IGenericRepository<Inv_StockMaster> _StockMasterRepository;
        private IGenericRepository<Inv_StockMasterSlNo> _StockMasterSlNoRepository;

        #region Constructor
        public UnitOfWork()
            {
                DbContext = new InspiredEntities();
               // this.DbContext.Configuration.LazyLoadingEnabled = false;
            }
        #endregion

        #region Save
            public void Save()
            {
                try
                {
                    DbContext.SaveChanges();
                }
                catch (DbEntityValidationException ex)
                {
                    var sb = new StringBuilder();
                    foreach (var failure in ex.EntityValidationErrors)
                    {
                        sb.AppendFormat("{0} failed validation\n", failure.Entry.Entity.GetType());
                        foreach (var error in failure.ValidationErrors)
                        {
                            sb.AppendFormat("- {0} : {1}", error.PropertyName, error.ErrorMessage);
                            sb.AppendLine();
                        }
                    }

                    throw new DbEntityValidationException("Entity Validation Failed - errors follow:\n" + sb, ex);
                    // Add the original exception as the innerException
                }
                catch(Exception e)
                {


                }
            }
        #endregion

        #region dispose
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    DbContext.Dispose();
                }
            }
            _disposed = true;
        }

        #endregion

        #region Change Tracking
        public void DisableChangeTracking()
        {
            DbContext.Configuration.AutoDetectChangesEnabled = false;
        }

        public void EnableChangeTracking()
        {
            DbContext.Configuration.AutoDetectChangesEnabled = true;
            DbContext.ChangeTracker.DetectChanges();
        }
        #endregion

        public IGenericRepository<Inv_CategoryMaster> CategoryMasterRepository
        {
            get { return _categoryMasterRepository ?? (_categoryMasterRepository = new GenericRepository<Inv_CategoryMaster>(DbContext)); }
        }

        public IGenericRepository<Gen_UserMaster> UserMasterRepository
        {
            get { return _userMasterRepository ?? (_userMasterRepository = new GenericRepository<Gen_UserMaster>(DbContext)); }
        }

        public IGenericRepository<Gen_BranchMaster> BranchRepository
        {
            get { return _branchRepository ?? (_branchRepository= new GenericRepository<Gen_BranchMaster>(DbContext)); }
        }

        public IGenericRepository<Gen_LookupItem> LookupItemRepository
        {
            get { return _lookupItemRepository ?? (_lookupItemRepository = new GenericRepository<Gen_LookupItem>(DbContext)); }
        }


        public IGenericRepository<Data.Inv_MaterialMaster> MaterialMasterRepository
        {
            get { return _materialMasterRepository ?? (_materialMasterRepository = new GenericRepository<Inv_MaterialMaster>(DbContext)); }
        }


        public IGenericRepository<Data.Inv_MaterialCategory> MaterialCategoryRepository
        {
            get { return _materialCategoryRepository ?? (_materialCategoryRepository = new GenericRepository<Inv_MaterialCategory>(DbContext)); }
        }

        public IGenericRepository<Data.Inv_MaterialSpecification> MaterialSpecificationRepository
        {
            get { return _materialSpecificationRepository ?? (_materialSpecificationRepository = new GenericRepository<Inv_MaterialSpecification>(DbContext)); }
        }
        public IGenericRepository<Data.Inv_MaterialPackaging> MaterialPackagingRepository
        {
            get { return _materialPackagingRepository ?? (_materialPackagingRepository = new GenericRepository<Inv_MaterialPackaging>(DbContext)); }
        }
        public IGenericRepository<Data.Inv_MaterialSpares> MaterialSparesRepository
        {
            get { return _materialSparesRepository ?? (_materialSparesRepository = new GenericRepository<Inv_MaterialSpares>(DbContext)); }
        }
        public IGenericRepository<Data.Inv_MaterialAlternateRelative> MaterialAltRelativeRepository
        {
            get { return _materialAltRelativeRepository ?? (_materialAltRelativeRepository = new GenericRepository<Inv_MaterialAlternateRelative>(DbContext)); }
        }
        public IGenericRepository<Data.Inv_MaterialSupplier> MaterialSupplierRepository
        {
            get { return _materialSupplierRepository ?? (_materialSupplierRepository = new GenericRepository<Inv_MaterialSupplier>(DbContext)); }
        }

        public IGenericRepository<Data.Inv_MaterialNotes> MaterialNotesRepository
        {
            get { return _materialNotesRepository ?? (_materialNotesRepository = new GenericRepository<Inv_MaterialNotes>(DbContext)); }
        }

        public IGenericRepository<Data.FAS_AccountMaster> AccountMasterRepository
        {
            get { return _accountMasterRepository ?? (_accountMasterRepository = new GenericRepository<FAS_AccountMaster>(DbContext)); }
        }

        public IGenericRepository<Inv_WarehouseMaster> WarehouseRepository
        {
            get { return _warehouseRepository ?? (_warehouseRepository= new GenericRepository<Inv_WarehouseMaster>(DbContext)); }
        }
        public IGenericRepository<Gen_LookupType> LookupTypeRepository
        {
            get { return _LookupTypeRepository ?? (_LookupTypeRepository = new GenericRepository<Gen_LookupType>(DbContext)); }
        }
        public IGenericRepository<Gen_LookupGroup> LookupGroupRepository
        {
            get { return _LookupGroupRepository ?? (_LookupGroupRepository = new GenericRepository<Gen_LookupGroup>(DbContext)); }
        }
        public IGenericRepository<Inv_MaterialDocument> MaterialDocumentRepository
        {
            get { return _MaterialDocumentRepository ?? (_MaterialDocumentRepository = new GenericRepository<Inv_MaterialDocument>(DbContext)); }
        }
        public IGenericRepository<Inv_DocumentMaster> DocumentMasterRepository
        {
            get { return _DocumentMasterRepository ?? (_DocumentMasterRepository = new GenericRepository<Inv_DocumentMaster>(DbContext)); }
        }

        public IGenericRepository<Inv_StockTran> StockTransRepository
        {
            get { return _StockTransRepository ?? (_StockTransRepository = new GenericRepository<Inv_StockTran>(DbContext)); }
        }

        public IGenericRepository<Inv_StockTranSlNo> StockTranslnoRepository
        {
            get { return _StockTranslnoRepository ?? (_StockTranslnoRepository = new GenericRepository<Inv_StockTranSlNo>(DbContext)); }
        }

        public IGenericRepository<Inv_StockMaster> StockMasterRepository
        {
            get { return _StockMasterRepository ?? (_StockMasterRepository = new GenericRepository<Inv_StockMaster>(DbContext)); }
        }

        public IGenericRepository<Inv_StockMasterSlNo> StockMasterSlNoRepository
        {
            get { return _StockMasterSlNoRepository ?? (_StockMasterSlNoRepository = new GenericRepository<Inv_StockMasterSlNo>(DbContext)); }
        }
    }
}
