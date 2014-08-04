using System;
using System.Linq;
using System.Web.Mvc;

namespace Utilities.MVC
{
    public abstract class AntiForgeryControllerBase : Controller
    {

        #region AntiForgeryControllerBase

        private readonly ValidateAntiForgeryTokenAttribute _validator;
        private readonly AcceptVerbsAttribute _verbs;

        #endregion

        #region Constructor

        protected AntiForgeryControllerBase()
            : this(HttpVerbs.Post)
        {
        }

        protected AntiForgeryControllerBase(HttpVerbs verbs)
        {
            _verbs = new AcceptVerbsAttribute(verbs);
            _validator = new ValidateAntiForgeryTokenAttribute();
        }

        #endregion

        #region OnAuthorization

        protected override void OnAuthorization(AuthorizationContext filterContext)
        {
            base.OnAuthorization(filterContext);

            string httpMethodOverride = filterContext.HttpContext.Request.GetHttpMethodOverride();
            if (_verbs.Verbs.Contains(httpMethodOverride, StringComparer.OrdinalIgnoreCase))
            {
                _validator.OnAuthorization(filterContext);
            }
        }

        #endregion

    }
}