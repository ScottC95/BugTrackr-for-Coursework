using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BugTrackr.Models;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace BugTrackr.DAL
{
    public class BugContext : DbContext
    {
        public BugContext() : base("BugContext")
        {

        }

        public DbSet<User> Users { get; set; }
        public DbSet<Bug> Bugs { get; set; }
        public DbSet<BugInfo> BugInfos { get; set; }

        public DbSet<Site> Sites { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

    }
}