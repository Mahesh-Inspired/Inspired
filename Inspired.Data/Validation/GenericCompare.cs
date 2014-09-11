﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using System.Resources;
using System.Globalization;
using System.Web.Mvc;


namespace Inspired.Data.Validation
{
    public enum GenericCompareOperator
    {
        GreaterThan,
        GreaterThanOrEqual,
        LessThan,
        LessThanOrEqual
    }
    public sealed class GenericCompareAttribute : ValidationAttribute, IClientValidatable
    {
        private GenericCompareOperator operatorname = GenericCompareOperator.GreaterThanOrEqual;

        public string CompareToPropertyName { get; set; }
        public GenericCompareOperator OperatorName { get { return operatorname; } set { operatorname = value; } }

        public GenericCompareAttribute() : base() { }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            string operstring = (OperatorName == GenericCompareOperator.GreaterThan ? "greater than " : (OperatorName == GenericCompareOperator.GreaterThanOrEqual ? "greater than or equal to " : (OperatorName == GenericCompareOperator.LessThan ? "less than " : (OperatorName == GenericCompareOperator.LessThanOrEqual ? "less than or equal to " : ""))));
            var basePropertyInfo = validationContext.ObjectType.GetProperty(CompareToPropertyName);

            var valOther = (IComparable)basePropertyInfo.GetValue(validationContext.ObjectInstance, null);

            var valThis = (IComparable)value;

            if ((valThis != null && valOther != null) &&
                ((operatorname == GenericCompareOperator.GreaterThan && valThis.CompareTo(valOther) <= 0) ||
                (operatorname == GenericCompareOperator.GreaterThanOrEqual && valThis.CompareTo(valOther) < 0) ||
                (operatorname == GenericCompareOperator.LessThan && valThis.CompareTo(valOther) >= 0) ||
                (operatorname == GenericCompareOperator.LessThanOrEqual && valThis.CompareTo(valOther) > 0)))
                return new ValidationResult(base.ErrorMessage);
            return null;
        }
        #region IClientValidatable Members

        public IEnumerable<ModelClientValidationRule> GetClientValidationRules(ModelMetadata metadata, ControllerContext context)
        {
            string errorMessage = this.FormatErrorMessage(metadata.DisplayName);
            ModelClientValidationRule compareRule = new ModelClientValidationRule();
            compareRule.ErrorMessage = errorMessage;
            compareRule.ValidationType = "genericcompare";
            compareRule.ValidationParameters.Add("comparetopropertyname", CompareToPropertyName);
            compareRule.ValidationParameters.Add("operatorname", OperatorName.ToString());
            yield return compareRule;
        }

        #endregion

    }
}
