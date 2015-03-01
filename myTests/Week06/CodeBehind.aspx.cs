using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myTests_Week06_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCalculate_Command(object sender, CommandEventArgs e)
    {
        decimal Input1Number = 0;
        decimal Input2Number = 0;

        try
        {
            Input1Number = Decimal.Parse(Input1.Value);
            Input2Number = Decimal.Parse(Input2.Value);

            decimal ResultNumber = Input1Number + Input2Number;
            Result.Text = ResultNumber.ToString();
        }
        catch //(Exception error)
        {
            Result.Text = "Invalid Data Entry";  //   Exception=" + error;
        }

    }
}