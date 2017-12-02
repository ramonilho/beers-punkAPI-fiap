//
//  BeersTableViewController.swift
//  PunkBeer
//
//  Created by Ramon Honorio on 30/11/17.
//  Copyright © 2017 Ramonilho. All rights reserved.
//

import UIKit

class BeersTableViewController: UITableViewController {
    
    var beerList = [Beer]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadInfo()
        
    }
    
    func loadInfo() {
        PunkAPI.getBeers(onSuccess: { (result) in
            
            self.beerList = result
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }) { (error) in
            print("Error while getting beers: \(error.localizedDescription)")
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as! BeerTableViewCell
        
        let beer = beerList[indexPath.row]
        
        cell.setupCell(name: beer.name,
                       alcoholContent: beer.abv,
                       photoURL: beer.imageURL)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetail", sender: beerList[indexPath.row])
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let beer = sender as? Beer {
                let detailVC = segue.destination as! BeerDetailViewController
                detailVC.beer = beer
            }
        }
    }
    
}
