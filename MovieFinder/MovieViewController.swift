//
//  MovieViewController.swift
//  MovieFinder
//
//  Created by Gulesh Shukla on 4/15/20.
//  Copyright © 2020 Gulesh Shukla. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var movieTable: UITableView!
    var movies = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTable.dataSource = self
        movieTable.delegate = self
        
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            self.movies = dataDictionary["results"] as! [[String: Any]]
            
            self.movieTable.reloadData()
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTable.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies [indexPath.row]
        let title = movie ["title"] as! String
        let overView = movie ["overview"] as! String
        
        cell.synopsisLabel.text = overView
        cell.titleLabel.text = title
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie ["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        
        cell.PosterView.af_setImage(withURL: posterURL!)
        
        return cell
       }
       


}
