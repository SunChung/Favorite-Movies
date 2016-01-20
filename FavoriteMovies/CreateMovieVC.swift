//
//  CreateMovieVC.swift
//  FavoriteMovies
//
//  Created by Sun Chung on 1/18/16.
//  Copyright © 2016 anseha. All rights reserved.
//

import UIKit
import CoreData

class CreateMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagePicker : UIImagePickerController!
    
    @IBOutlet weak var movieTitle : UITextField!
    @IBOutlet weak var movieDescription : UITextField!
    @IBOutlet weak var movieUrl : UITextField!
    @IBOutlet weak var moviePlot: UITextField!
    @IBOutlet weak var movieImage : UIImageView!
    
    @IBAction func movieCancel(sender: AnyObject) {
    
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    
    @IBAction func addImage(sender : AnyObject!) {
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func addMovie(sender : AnyObject!) {
        
        if movieTitle.text != "" && movieDescription.text != "" && movieUrl != "" {
            
            let movieApp = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = movieApp.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movies", inManagedObjectContext: context)!
            let movie = Movies(entity: entity, insertIntoManagedObjectContext: context)
            
            movie.title = movieTitle.text
            movie.myDescription = movieDescription.text
            movie.movieUrl = movieUrl.text
            movie.plot = moviePlot.text
            movie.setMoviesImage(movieImage.image!)
            
            context.insertObject(movie)
            
            do {
                
                try context.save()
                
            } catch {
                
                print("Could not save Recipe")
                
            }
            
            // Close current VC and return to the original VC
            self.navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImage.layer.cornerRadius = 5.0
        movieImage.clipsToBounds = true
        
        self.navigationItem.title = "Load Some Movies"
        
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImage.image = image
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }

}
