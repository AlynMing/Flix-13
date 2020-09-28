//
//  GridDetailsViewController.swift
//  Flix
//
//  Created by Vishaal Kumar on 9/28/20.
//

import UIKit
import AlamofireImage

class GridDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UITextView!
    
    
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
        
        self.title = title
        
        titleLabel.text = title
        titleLabel.sizeToFit()
        overviewLabel.text = overview
        overviewLabel.sizeToFit()
        
        posterView.af.setImage(withURL: imageUrl!)
        backdropView.af.setImage(withURL: backdropUrl!)
        
        //Making imageView tappable
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(gesture:)))
        backdropView.addGestureRecognizer(tapGesture)
        backdropView.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            performSegue(withIdentifier: "GridToTrailer", sender: self)

        }
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let trailerViewController = segue.destination as! TrailerViewController
        trailerViewController.movieId = String(movie["id"] as! Int)
    }

}
