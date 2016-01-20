//
//  MovieCell.swift
//  FavoriteMovies
//
//  Created by Sun Chung on 1/18/16.
//  Copyright © 2016 anseha. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieTitle : UILabel!
    @IBOutlet weak var movieDescription : UILabel!
    @IBOutlet weak var movieImage : UIImageView!
    @IBOutlet weak var movieUrl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        movieImage.layer.cornerRadius = 5.0
        movieImage.clipsToBounds = true
    }

    func configureCell(movies: Movies) {
        
        movieTitle.text = movies.title
        movieDescription.text = movies.myDescription
        movieImage.image = movies.getMoviesImage()
        movieUrl.text = movies.movieUrl
        
    }

}
