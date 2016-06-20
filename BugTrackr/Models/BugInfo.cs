using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BugTrackr.Models
{
    public class BugInfo
    {
        public int BugInfoID { get; set; }
        public int BugID { get; set; }
        public int UserID { get; set; }
        public string Content { get; set; }

    }
}