using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Rhino.Mocks;
using Inspired.Repository;
using Utilities.Data;
using Inspired.Data;
using MvcContrib.TestHelper.Fakes;
using System.Web.Routing;
using Utilities.MVC;


namespace Inspired.Web.Test.Controllers
{
    class BaseControllerTest
    {
        #region Declaration
        public HttpContextBase HttpContext { get; set; }
        public RouteData RouteData { get; set; }

        protected FakePrincipal userPrincipal;
        public IUnitOfWork UnitOfWork { get; set; }
        public IUserIdentity UserIdentity { get; set; }

        public IGenericRepository<Gen_UserMaster> UserRepository { get; set; }
        public IGenericRepository<Gen_LookupType> LookupTypeRepository { get; set; }
        public IGenericRepository<Gen_LookupGroup> LookupGroupRepository { get; set; }
        public IGenericRepository<Gen_LookupItem> LookupItemRepository { get; set; }

        public IGenericRepository<Inv_CategoryMaster> InvCategoryRepository { get; set; }        
        public IGenericRepository<Inv_MaterialMaster> MaterialMasterRepository { get; set; }
        public IGenericRepository<Inv_MaterialCategory> MaterialCategoryRepository { get; set; }
        public IGenericRepository<Inv_MaterialSpecification> MaterialSpecficationRepository { get; set; }
        public IGenericRepository<Inv_MaterialPackaging> MaterialPackagingRepository { get; set; }
        public IGenericRepository<Inv_MaterialSpares> MaterialSparesRepository { get; set; }
        public IGenericRepository<Inv_MaterialAlternateRelative> MaterialAltRepository { get; set; }
        public IGenericRepository<Inv_MaterialSupplier> MaterialSupplierRepository { get; set; }
        public IGenericRepository<Inv_MaterialNotes> MaterialNotesRepository { get;set;}
        public IGenericRepository<Inv_DocumentMaster> DocumentMastersRepository { get; set; }
        public IGenericRepository<Inv_StockTran> StockTransRepository { get; set; }

        public IGenericRepository<FAS_AccountMaster> AccountMasterRepository { get; set; }
        #endregion

        #region InitializeBase

        public void InitializeBase()
        {
            InvCategoryRepository = MockRepository.GenerateMock<IGenericRepository<Inv_CategoryMaster>>();
            
            UserRepository = MockRepository.GenerateMock<IGenericRepository<Gen_UserMaster>>();
            LookupTypeRepository = MockRepository.GenerateMock<IGenericRepository<Gen_LookupType>>();
            LookupGroupRepository = MockRepository.GenerateMock<IGenericRepository<Gen_LookupGroup>>();
            LookupItemRepository = MockRepository.GenerateMock<IGenericRepository<Gen_LookupItem>>();

            MaterialMasterRepository = MockRepository.GenerateMock<IGenericRepository<Inv_MaterialMaster>>();
            MaterialCategoryRepository = MockRepository.GenerateMock<IGenericRepository<Inv_MaterialCategory>>();
            MaterialSpecficationRepository = MockRepository.GenerateMock<IGenericRepository<Inv_MaterialSpecification>>();
            MaterialPackagingRepository = MockRepository.GenerateMock<IGenericRepository<Inv_MaterialPackaging>>();
            MaterialSparesRepository= MockRepository.GenerateMock<IGenericRepository<Inv_MaterialSpares>>();
            MaterialAltRepository = MockRepository.GenerateMock<IGenericRepository<Inv_MaterialAlternateRelative>>();
            MaterialSupplierRepository = MockRepository.GenerateMock<IGenericRepository<Inv_MaterialSupplier>>();
            MaterialNotesRepository = MockRepository.GenerateMock<IGenericRepository<Inv_MaterialNotes>>();

            AccountMasterRepository = MockRepository.GenerateMock<IGenericRepository<FAS_AccountMaster>>();
            DocumentMastersRepository = MockRepository.GenerateMock<IGenericRepository<Inv_DocumentMaster>>();
            StockTransRepository = MockRepository.GenerateMock<IGenericRepository<Inv_StockTran>>();

            userPrincipal = new FakePrincipal(new FakeIdentity("InventoryUser"), null);

            // Create unit of work
            UnitOfWork = MockRepository.GenerateMock<IUnitOfWork>();
            UserIdentity = MockRepository.GenerateMock<IUserIdentity>();

            UnitOfWork.Stub(u => u.UserMasterRepository).Return(UserRepository);
            UnitOfWork.Stub(u => u.LookupTypeRepository).Return(LookupTypeRepository);
            UnitOfWork.Stub(u => u.LookupGroupRepository).Return(LookupGroupRepository);
            UnitOfWork.Stub(u => u.LookupItemRepository).Return(LookupItemRepository);

            UnitOfWork.Stub(u => u.CategoryMasterRepository).Return(InvCategoryRepository);            
            UnitOfWork.Stub(u => u.MaterialMasterRepository).Return(MaterialMasterRepository);
            UnitOfWork.Stub(u => u.MaterialCategoryRepository).Return(MaterialCategoryRepository);
            UnitOfWork.Stub(u => u.MaterialSpecificationRepository).Return(MaterialSpecficationRepository);
            UnitOfWork.Stub(u => u.MaterialPackagingRepository).Return(MaterialPackagingRepository);
            UnitOfWork.Stub(u => u.MaterialSparesRepository).Return(MaterialSparesRepository);
            UnitOfWork.Stub(u => u.MaterialAltRelativeRepository).Return(MaterialAltRepository);
            UnitOfWork.Stub(u => u.MaterialSupplierRepository).Return(MaterialSupplierRepository);
            UnitOfWork.Stub(u => u.MaterialNotesRepository).Return(MaterialNotesRepository);

            UnitOfWork.Stub(u => u.AccountMasterRepository).Return(AccountMasterRepository);
            UnitOfWork.Stub(u => u.DocumentMasterRepository).Return(DocumentMastersRepository);
            UnitOfWork.Stub(u => u.StockTransRepository).Return(StockTransRepository);
            //// Create controller
            //HttpContext = MockRepository.GenerateStub<HttpContextBase>();
            //HttpContext.Stub(c => c.Request).Return(MockRepository.GenerateMock<HttpRequestBase>());            
            //HttpContext.User = userPrincipal;            
            //RouteData = new RouteData();

           
        }

        #endregion
    }
}
