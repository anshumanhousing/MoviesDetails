//
//  MoviesOverviewViewController.swift
//  moviesDeatails
//
//  Created by Anshuman Bhargava on 22/08/23.
//

import UIKit

class MoviesOverviewViewController: UIViewController{
    
    
    @IBOutlet weak var overViewTextField: UITextView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    //@IBOutlet weak var movieOverview: UILabel!
    
    var movieDetail: MovieData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton()
        setAllDetails()
    }
    
    func setAllDetails(){
        movieTitle.text = movieDetail?.title
        moviePopularity.text = "\(movieDetail!.popularity)"
        movieRating.text = "\(movieDetail!.vote_average)"
        movieReleaseDate.text = movieDetail?.release_date
        overViewTextField.text = movieDetail?.overview
        let urlString = String( JsonConstants.POSTER_HEADER + movieDetail!.poster_path)
        moviePoster.image = UIImage(named: Image.SYSTEM_IMAGE_NAME)
        Downloader.shared.getImage(fromUrl: urlString) { image in
            if let imageObj = image{
                DispatchQueue.main.async {
                    self.moviePoster.image = imageObj
                }
            }
        }
        moviePoster.layer.cornerRadius = CGFloat(Image.CORNER_RADIUS)
    }
    
    
    func backButton(){
        let backButton = UIBarButtonItem()
        backButton.title = Button.TITLE
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

}
