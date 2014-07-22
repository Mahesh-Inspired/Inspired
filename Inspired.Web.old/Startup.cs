using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Inspired.Web.Startup))]
namespace Inspired.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
