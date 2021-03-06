//
//  Movies+CoreDataProperties.swift
//  FavoriteMovies
//
//  Created by Sun Chung on 1/18/16.
//  Copyright © 2016 anseha. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movies {

    @NSManaged var title: String?
    @NSManaged var movieUrl: String?
    @NSManaged var images: NSData?
    @NSManaged var plot: String?
    @NSManaged var myDescription: String?

}
