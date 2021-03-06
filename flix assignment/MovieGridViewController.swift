//
//  MovieGridViewController.swift
//  flix assignment
//
//  Created by Grace Brill on 9/5/21.
//

import UIKit

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    //array of dictionaries to store the data from the API
    var movies = [[String:Any]]()

    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
            collectionView.delegate = self
            collectionView.dataSource = self
        
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
            //controls the space in between the rows
            layout.minimumLineSpacing = 4
        
            //interitem spacing
            layout.minimumInteritemSpacing = 4
        
            //item size
            //expects a width and a height
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2)/3   //changes based on user phone
        
            //layout itemsize, want height to be taller than the width
            layout.itemSize = CGSize(width: width, height : width * 3/2)
            
        
        
           
           // Do any additional setup after loading the view.
           let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
           let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
           let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
           let task = session.dataTask(with: request) { (data, response, error) in
               // This will run when the network request returns
               if let error = error {
                   print(error.localizedDescription)
               } else if let data = data {
                   let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                   
                   // TODO: Get the array of movies
                   // TODO: Store the movies in a property to use elsewhere
                   // TODO: Reload your table view data
                   self.movies = dataDictionary["results"] as! [[String:Any]]
                
                   self.collectionView.reloadData()
                   
               }
           }
           task.resume()

       }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        let movie = movies[indexPath.item]
                
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.posterView.af_setImage(withURL: posterUrl!)
        
        return cell
    }
    
}

