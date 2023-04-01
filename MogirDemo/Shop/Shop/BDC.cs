using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop
{
    internal class BDC
    {
        private static EBD _db;
        public static EBD db
        {
            get
            {
                if (_db == null)
                    _db = new EBD();
                return _db;
            }
        }
    }
}
