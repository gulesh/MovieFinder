//
//  MovieDetailsViewController.swift
//  MovieFinder
//
//  Created by Gulesh Shukla on 4/22/20.
//  Copyright © 2020 Gulesh Shukla. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String: Any]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie ["overview"] as? String
        synopsisLabel.sizeToFit()

        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie ["poster_path"] as! String
        let posterURL = URL(string: "https://image.tmdb.org/t/p/w780" + posterPath)
        
        posterView.af_setImage(withURL: posterURL!)
        
        
       
        let backdropPath = movie ["poster_path"] as! String
        let backdropURL = URL(string: baseURL + backdropPath)
        
        backdropView.af_setImage(withURL: backdropURL!)
        // Do any additional setup after loading the view.
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
