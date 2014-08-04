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
        public IGenericRepository<Inv_CategoryMaster> InvCategoryRepository { get; set; }
        public IGenericRepository<Gen_UserMaster> UserRepository { get; set; }
        #endregion

        #region InitializeBase

        public void InitializeBase()
        {
            InvCategoryRepository = MockRepository.GenerateMock<IGenericRepository<Inv_CategoryMaster>>();
            UserRepository = MockRepository.GenerateMock<IGenericRepository<Gen_UserMaster>>();

            userPrincipal = new FakePrincipal(new FakeIdentity("InventoryUser"), null);

            // Create unit of work
            UnitOfWork = MockRepository.GenerateMock<IUnitOfWork>();
            UserIdentity = MockRepository.GenerateMock<IUserIdentity>();

            UnitOfWork.Stub(u => u.CategoryMasterRepository).Return(InvCategoryRepository);
            UnitOfWork.Stub(u => u.UserMasterRepository).Return(UserRepository);

            //// Create controller
            //HttpContext = MockRepository.GenerateStub<HttpContextBase>();
            //HttpContext.Stub(c => c.Request).Return(MockRepository.GenerateMock<HttpRequestBase>());            
            //HttpContext.User = userPrincipal;            
            //RouteData = new RouteData();

        }

        #endregion
    }
}
