//
//  ViewController.swift
//  FavoriteMovies
//
//  Created by Sun Chung on 1/18/16.
//  Copyright © 2016 anseha. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var movies = [Movies]()
    
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        fetchAndSetResults()
        tableView.reloadData()
        
    }
    
    func fetchAndSetResults() {
        
        // Need to set Delegate in order to use it
        let movieApp = UIApplication.sharedApplication().delegate as! AppDelegate
        // ManagedObjectContext comes from AppDelegate.swift
        let context = movieApp.managedObjectContext
        // The entityName is the CoreData entity name
        let fetchRequest = NSFetchRequest(entityName: "Movies")
        
        do {
            
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movies]
            
        } catch let err as NSError {
            
            print(err.debugDescription)
            
        }
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
            
        } else {
            
            return MovieCell()
            
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return movies.count
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "MovieDetail" {
            
            if let cell = sender as? MovieCell, row = tableView.indexPathForCell(cell)?.row, mdvc = segue.destinationViewController as? DetailMovieVC {
                
            mdvc.movies = movies[row]
            
            }
    
        }
    
    }
    
    // swipe to delete from the table view and permanent storage
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let movieDel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = movieDel.managedObjectContext
        context.deleteObject(movies[indexPath.row] as NSManagedObject)
        movies.removeAtIndex(indexPath.row)
        
        do {
        
            try context.save()
        
        } catch let err as NSError {
            
            print(err.debugDescription)
            
        }
        
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

        }
    
}

