//
//  TrailerViewController.swift
//  Flix
//
//  Created by Vishaal Kumar on 9/28/20.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var movieId : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId!)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            let results = dataDictionary["results"] as! [[String : Any]]
            let movie = results[0]
            let key = movie["key"] as! String
            
            let myURL = URL(string:"https://www.youtube.com/watch?v=\(key)")
            let myRequest = URLRequest(url: myURL!)
            self.webView.load(myRequest)
           }
        }
        task.resume()
        
        
    }
    
}
