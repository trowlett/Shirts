using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;

/// <summary>
/// Summary description for MRMISGADB
/// </summary>
public class MRMISGADB : DataContext
{
    public Table<Shirts> Shirts;
    public Table<Customers> Customers;
    public MRMISGADB(string connection) : base(connection) { }
}