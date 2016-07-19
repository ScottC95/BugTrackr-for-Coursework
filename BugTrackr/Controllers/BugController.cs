using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BugTrackr.Models;
using BugTrackr.DAL;
using BugTrackr.ViewModels;

namespace BugTrackr.Controllers
{
    public class BugController : Controller
    {
        private BugContext db = new BugContext();

        public BugViewModel bugViewModel = new BugViewModel();
        

        //
        // GET: /Bug/

        public ActionResult Index()
        {
            return RedirectToAction("SiteList");
        }

        public ActionResult SiteList()
        {

            List<Site> sites = db.Sites.ToList();

            if (sites == null)
            {
                return HttpNotFound();
            }
            return View(sites);
        }

        //
        // GET: /Bug/Details/5

        public ActionResult Details(int id = 0)
        {
            Bug bug = db.Bugs.Find(id);
            if (bug == null)
            {
                return HttpNotFound();
            }
            return View(bug);
        }

        //
        // GET: /Bug/Create

        public ActionResult Create(int siteID)
        {
            return View();
        }

        //
        // POST: /Bug/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Bug bug)
        {
            if (ModelState.IsValid)
            {
                db.Bugs.Add(bug);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(bug);
        }

        //
        // GET: /Bug/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Bug bug = db.Bugs.Find(id);
            if (bug == null)
            {
                return HttpNotFound();
            }
            return View(bug);
        }

        //
        // POST: /Bug/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Bug bug)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bug).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(bug);
        }

        //
        // GET: /Bug/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Bug bug = db.Bugs.Find(id);
            if (bug == null)
            {
                return HttpNotFound();
            }
            return View(bug);
        }

        //
        // POST: /Bug/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Bug bug = db.Bugs.Find(id);
            db.Bugs.Remove(bug);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // GET: /Bug/BugList
        public ActionResult BugList(int siteID = 0)
        {
            BugViewModel bugsViewModel = new BugViewModel();

            bugsViewModel.Sites = db.Sites.ToList();
            bugsViewModel.Bugs = db.Bugs.Where(b => b.SiteID == siteID).ToList();

            if (bugsViewModel.Bugs == null)
            {
                return HttpNotFound();
            }

            return View(bugsViewModel);

        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}