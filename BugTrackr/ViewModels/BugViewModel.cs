using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BugTrackr.Models;
using System.Data.Entity;

namespace BugTrackr.ViewModels
{
    public class BugViewModel
    {
        public virtual List<Site> Sites { get; set; }
        public virtual List<Bug> Bugs { get; set; }

        public BugViewModel(List<Site> sites, List<Bug> bugs)
        {
            Sites = sites;
            Bugs = bugs;
        }

        public BugViewModel()
        {

        }


    }
}