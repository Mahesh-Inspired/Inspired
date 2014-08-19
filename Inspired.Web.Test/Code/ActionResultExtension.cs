using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Rhino.Mocks;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace Inspired.Web.Test.Code
{
    internal static class ActionResultExtension
    {

        /// <summary>
        /// Returns whether the viewResult contains the specified error message or not
        /// </summary>
        /// <param name="viewResult"></param>
        /// <param name="errorMessage"></param>
        /// <returns></returns>
        public static bool ContainsErrorMessage(this System.Web.Mvc.ViewResult viewResult, string errorMessage)
        {
            IEnumerable<String> errors = viewResult.ViewData.ModelState.Values
                .Where(v => v.Errors != null && v.Errors.Count > 0)
                .SelectMany(x => x.Errors)
                .Select(x => x.ErrorMessage);
            return errors.Any(e => e.Contains(errorMessage));

        }

        /// <summary>
        /// Helper method to turn a JsonResult into a dictiony of objects
        /// </summary>
        /// <param name="jsonResult"></param>
        /// <returns></returns>
        public static IDictionary<string, object> ConvertToObjectDictionary(this System.Web.Mvc.JsonResult jsonResult)
        {
            var serializer = new JavaScriptSerializer();
            object jsonObject = serializer.DeserializeObject(serializer.Serialize(((JsonResult)jsonResult).Data));
            return jsonObject as IDictionary<string, object>;

        }

    }
}
