//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Vishaal Kumar on 9/27/20.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterImageview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie : [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        
        let baseUrl : String = "https://image.tmdb.org/t/p/w185"
        let posterPath : String = movie["poster_path"] as! String
        let imageUrl = URL(string: baseUrl + posterPath)
        
        let backdropBaseUrl : String = "https://image.tmdb.org/t/p/w780"
        let backdropPath : String = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: backdropBaseUrl + backdropPath)
        
        titleLabel.text = title
        titleLabel.sizeToFit()
        overviewLabel.text = overview
        overviewLabel.sizeToFit()
        
        posterImageview.af.setImage(withURL: imageUrl!)
        backdropView.af.setImage(withURL: backdropUrl!)
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
