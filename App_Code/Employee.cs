using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee
{
    public Employee(int empId)
    {
        EmpId = empId;
    }

    public int EmpId { get; set; }
    public string Name { get; set; }
    public int Salary { get; set; }
}

public class EmployeeViewModel : Employee
{
    private string editLink;

    public EmployeeViewModel(int empId) : base(empId)
    {
        editLink = "www.google.com?empId=" + EmpId;
    }

    //backend link
    public string EditLink
    {
        get { return editLink; }
    }

}
