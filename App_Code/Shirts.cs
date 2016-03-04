using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;
using System.Data.SqlTypes;

[Table (Name="Shirts")]
/// <summary>
/// Summary description for Shirts
/// </summary>
public class Shirts
{
    [Column(IsPrimaryKey = true, IsDbGenerated=true, Name="Seq", DbType="INT NOT NULL", CanBeNull= false)]
    public int Seq;
    [Column(Name="CustID", DbType="INT NOT NULL",CanBeNull=false)]
    public int CustID;
    [Column(Name="Qty",DbType="INT NOT NULL", CanBeNull=false)]
    public int Qty;
    [Column(Name = "Style", DbType = "VARCHAR(50) NOT NULL", CanBeNull = false)]
    public string Style;
    [Column(Name = "Size", DbType = "CHAR(10) NOT NULL", CanBeNull = false)]
    public string Size;
    [Column(Name = "Color", DbType = "VARCHAR(50) NOT NULL", CanBeNull = false)]
    public string Color;
    [Column(Name = "Timestamp", DbType = "DATETIME NOT NULL", CanBeNull = false)]
    public DateTime TimeStamp;
    [Column(Name = "cancel", DbType = "INT NOT NULL", CanBeNull = false)]
    public int Cancel;
    [Column(Name = "Filled", DbType = "INT NOT NULL", CanBeNull = false)]
    public int Filled;
    
}