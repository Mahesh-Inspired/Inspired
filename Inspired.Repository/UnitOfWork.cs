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
             
        
        #region Constructor
            public UnitOfWork()
            {
                DbContext = new InspiredEntities();
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

        public IGenericRepository<Data.Gen_UserMaster> UserMasterRepository
        {
            get { return _userMasterRepository ?? (_userMasterRepository = new GenericRepository<Gen_UserMaster>(DbContext)); }
        }
    }
}
