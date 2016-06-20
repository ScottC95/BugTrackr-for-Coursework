using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BugTrackr.Models
{
    public class Bug
    {

        public int BugID { get; set; }
        public string Title { get; set; }
        public string Priority { get; set; }
        public string Status { get; set; }
        public DateTime OpenDate { get; set; }
        public int AssignedUserID { get; set; }
        public int SiteID { get; set; }

    }
}