using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Services;
using System.Web.Script.Services;
using Newtonsoft.Json;

public partial class _Default : System.Web.UI.Page
{
    static List<EmployeeViewModel> employees;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
  
 
    public static void fetchDataFromDB()
    {
        employees = new List<EmployeeViewModel>();
        for (int i = 0; i < 100; i++)
        {
            EmployeeViewModel emp = new EmployeeViewModel(i + 1);
            emp.Name = "Abc_" + (i + 1);
            emp.Salary = 1000 + 10;
            employees.Add(emp);
        }

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetEmployeesWithViewLinks()
    {
        fetchDataFromDB();
        return JsonConvert.SerializeObject(employees);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmployeeViewModel> GetEmployeesWithViewLinksWithJson()
    {
        fetchDataFromDB();
        return employees;
    }
    [System.Web.Services.WebMethod]
    public static string GetCurrentTime(string name)
    {
        return "Hello " + name + Environment.NewLine + "The Current Time is: "
            + DateTime.Now.ToString();
    }
}
