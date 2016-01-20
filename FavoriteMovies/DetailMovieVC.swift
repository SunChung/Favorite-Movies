//
//  DetalMovieVC.swift
//  FavoriteMovies
//
//  Created by Sun Chung on 1/18/16.
//  Copyright © 2016 anseha. All rights reserved.
//

import UIKit
import CoreData

class DetailMovieVC: UIViewController {

    var movies : Movies?
    
    @IBOutlet weak var movieTitle : UILabel!
    @IBOutlet weak var movieDescription : UILabel!
    @IBOutlet weak var movieUrl : UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    @IBOutlet weak var movieImage : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieTitle.text = movies?.title
        movieDescription.text = movies?.myDescription
        movieUrl.text = movies?.movieUrl
        moviePlot.text = movies?.plot
        movieImage.image = movies?.getMoviesImage()
        
        self.navigationItem.title = "Movie Details"
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "WebLinkVC" {
        
            if let WebLinkVC = segue.destinationViewController as? WebLinkVC {
            
                WebLinkVC.urlLink = movies?.movieUrl
            
            }
        
        }
    
    }
    
}
