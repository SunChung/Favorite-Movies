//
//  Movies.swift
//  FavoriteMovies
//
//  Created by Sun Chung on 1/18/16.
//  Copyright © 2016 anseha. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movies: NSManagedObject {

    func setMoviesImage(img: UIImage) {
        
        let data = UIImagePNGRepresentation(img)
        self.images = data
        
    }
    
    func getMoviesImage() -> UIImage {
        
        let img = UIImage(data: self.images!)!
        return img
        
    }

}
