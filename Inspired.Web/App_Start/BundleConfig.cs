using System.Web;
using System.Web.Optimization;

namespace Inspired.Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            #region JQuery
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Scripts/jquery-migrate-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*",
                        "~/Scripts/jquery.unobtrusive*"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                      "~/Scripts/jquery-ui-{version}.js"
                      ));

            #endregion

            #region Modernizr,bootstrap, antiforgerytoken and jtable
            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));
            bundles.Add(new ScriptBundle("~/bundles/antiforgerytoken").Include("~/Scripts/app/antiforgerytoken.js"));
            bundles.Add(new ScriptBundle("~/bundles/jtable").Include("~/Scripts/jtable/jquery.jtable.js"));
            #endregion

            #region Category Master

            bundles.Add(new ScriptBundle("~/bundles/categorylist").Include("~/Scripts/app/categorylist.js"));
            bundles.Add(new ScriptBundle("~/bundles/lookuplist").Include("~/Scripts/app/lookuplist.js"));

            #endregion

            #region Material Master

            bundles.Add(new ScriptBundle("~/bundles/materialmaster").Include(
                "~/Scripts/app/inventory/materialmaster.js",
                "~/Scripts/app/inventory/materialcategory.js",
                "~/Scripts/app/inventory/materialspecification.js",
                "~/Scripts/app/inventory/materialpackaging.js",
                "~/Scripts/app/inventory/materialspares.js",
                "~/Scripts/app/inventory/materialalternate.js",
                "~/Scripts/app/inventory/materialsupplier.js",
                "~/Scripts/app/inventory/materialnotes.js"));

            bundles.Add(new ScriptBundle("~/bundles/warehousemaster").Include(
                "~/Scripts/app/inventory/warehousemaster.js"));

            #endregion

            #region Misc

            bundles.Add(new ScriptBundle("~/bundles/miscreceipt").Include(
                "~/Scripts/app/inventory/miscreceipt.js"));

            #endregion

            #region Stock

            bundles.Add(new ScriptBundle("~/bundles/stock").Include(
                "~/Scripts/app/inventory/MiscReceipt.js"));

            #endregion

            #region Bootstrap, JTable Stylesheets

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            bundles.Add(new StyleBundle("~/Content/receipt").Include(
                        "~/Content/receipt.css"));

            bundles.Add(new StyleBundle("~/Content/jtable").Include("~/Scripts/jtable/themes/metro/blue/jtable.css"));

            #endregion

        }
    }
}
