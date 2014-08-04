using System.Web.Mvc;
using Microsoft.Practices.Unity;
using Unity.Mvc4;
using Inspired.Repository;
using Microsoft.AspNet.Identity;
using Inspired.Web.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using Utilities.MVC;

namespace Inspired.Web
{
  public static class Bootstrapper
  {
    public static IUnityContainer Initialise()
    {
      var container = BuildUnityContainer();

      DependencyResolver.SetResolver(new UnityDependencyResolver(container));

      return container;
    }

    private static IUnityContainer BuildUnityContainer()
    {
      var container = new UnityContainer();

      // register all your components with the container here
      // it is NOT necessary to register your controllers

      // e.g. container.RegisterType<ITestService, TestService>();    
      RegisterTypes(container);

      return container;
    }

    public static void RegisterTypes(IUnityContainer container)
    {
        //container.RegisterTypes(
        //            AllClasses.FromLoadedAssemblies(),
        //            WithMappings.FromMatchingInterface,
        //            WithName.Default);

        container.RegisterType<IUnitOfWork, UnitOfWork>();
        container.RegisterType<IUserIdentity, UserIdentity>();

        //pass a string to the class constructor.
        //container.RegisterType<IUser,User>(new InjectionConstructor("UserID")); 

        // for account controller
        container.RegisterType<Inspired.Web.Controllers.AccountController>(new InjectionConstructor());
    }
  }
}