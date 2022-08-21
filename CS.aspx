<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
    <link href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet" />
    <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        function ShowCurrentTime() {
            $.ajax({
                type: "POST",
                url: "CS.aspx/GetEmployeesWithViewLinksWithJson",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    console.log(response.d);
                }
            });
        }
        function OnSuccess(response) {
            console.log(response.d);
            var data= response.d.map(function (x) {
                x.viewLink = 'www.google.com?empId=' + x.EmpId;
                return x;
            });
             $('#example').DataTable({
                 data: data,
                'columns': [
                    {
                        'data': 'EmpId',
                        render: function (data, type, row, meta) {
                            debugger;
                            return '<a href="'+row.editLink+'" target="blank">' + data + '</a>';
                        },
                        title : 'Employee Id'
                    },
                    { 'data': 'Name' },
                    { 'data': 'Salary' },
                ]
          });
        }
        
    </script>
</head>
<body style="font-family: Arial; font-size: 10pt">
    <form id="form1" runat="server">
     
        <div class="container">
            <div class="panel">
                <div class="row">
                    <table id="example" class="display" style="width: 100%">
                     
                    </table>
                </div>
            </div>
        </div>
        <script type="text/javascript">
   


        </script>
    </form>
</body>
</html>
