using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;
using System.Data.SqlTypes;

[Table(Name = "Customers")]
public class Customers
{
    [Column(IsPrimaryKey = true, Name = "CustID", DbType = "INT NOT NULL", CanBeNull = false)]
    public int CustID;
    [Column(Name = "Name", DbType = "VARCHAR(50) NOT NULL", CanBeNull = false)]
    public string Name;
    [Column(Name = "LName", DbType = "VARCHAR(50) NOT NULL", CanBeNull = false)]
    public string Lname;
    [Column(Name = "FName", DbType = "VARCHAR(50) NOT NULL", CanBeNull = false)]
    public string Fname;
 
    
}