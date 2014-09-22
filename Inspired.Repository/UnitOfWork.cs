using System;
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

        private IGenericRepository<Inv_CategoryMaster> _categoryMasterRepository;
        private IGenericRepository<Gen_UserMaster> _userMasterRepository;
        private IGenericRepository<Gen_LookupItem> _lookupItemRepository;
        private IGenericRepository<Inv_MaterialMaster> _materialMasterRepository;
        private IGenericRepository<Inv_MaterialCategory> _materialCategoryRepository;
        private IGenericRepository<Inv_MaterialSpecification> _materialSpecificationRepository;
        private IGenericRepository<Inv_MaterialPackaging> _materialPackagingRepository;
        private IGenericRepository<Inv_MaterialSpares> _materialSparesRepository;
        private IGenericRepository<Inv_MaterialAlternateRelative> _materialAltRelativeRepository;
        private IGenericRepository<Inv_MaterialSupplier> _materialSupplierRepository;


        private IGenericRepository<FAS_AccountMaster> _accountMasterRepository;
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

        public IGenericRepository<Data.FAS_AccountMaster> AccountMasterRepository
        {
            get { return _accountMasterRepository ?? (_accountMasterRepository = new GenericRepository<FAS_AccountMaster>(DbContext)); }
        }
    }
}
