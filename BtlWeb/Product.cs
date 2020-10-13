using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BtlWeb
{
    public class Product
    {
        public int id { get; set; }
        public string name { get; set; }
        public string images { get; set; }
        public string description { get; set; }
        public int price { get; set; }
        public int quantity { get; set; }
        public string guarantee { get; set; }
    }
}