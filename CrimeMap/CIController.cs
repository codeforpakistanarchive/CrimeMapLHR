using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace CrimeMap
{
    public class CIController : ApiController
    {
        private CrimeDBEntities db = new CrimeDBEntities();

        // GET api/CI
        public IQueryable<CrimeInstance> GetCrimeInstances()
        {
            return db.CrimeInstances;
        }

        // GET api/CI/5
        [ResponseType(typeof(CrimeInstance))]
        public IHttpActionResult GetCrimeInstance(int id)
        {
            CrimeInstance crimeinstance = db.CrimeInstances.Find(id);
            if (crimeinstance == null)
            {
                return NotFound();
            }

            return Ok(crimeinstance);
        }

        // PUT api/CI/5
        public IHttpActionResult PutCrimeInstance(int id, CrimeInstance crimeinstance)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != crimeinstance.Id)
            {
                return BadRequest();
            }

            db.Entry(crimeinstance).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CrimeInstanceExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST api/CI
        [ResponseType(typeof(CrimeInstance))]
        public IHttpActionResult PostCrimeInstance(CrimeInstance crimeinstance)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.CrimeInstances.Add(crimeinstance);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = crimeinstance.Id }, crimeinstance);
        }

        // DELETE api/CI/5
        [ResponseType(typeof(CrimeInstance))]
        public IHttpActionResult DeleteCrimeInstance(int id)
        {
            CrimeInstance crimeinstance = db.CrimeInstances.Find(id);
            if (crimeinstance == null)
            {
                return NotFound();
            }

            db.CrimeInstances.Remove(crimeinstance);
            db.SaveChanges();

            return Ok(crimeinstance);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CrimeInstanceExists(int id)
        {
            return db.CrimeInstances.Count(e => e.Id == id) > 0;
        }
    }
}