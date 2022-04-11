using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfApp1
{
    class Instances
    {
        private static prodEntities _Db = null;
        public static prodEntities db
        {
            get
            {
                if (_Db == null)
                    _Db = new prodEntities();
                return _Db;
            }
        }
    }
}
