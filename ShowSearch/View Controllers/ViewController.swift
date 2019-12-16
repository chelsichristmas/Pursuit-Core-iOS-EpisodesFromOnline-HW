//
//  ViewController.swift
//  ShowSearch
//
//  Created by Chelsi Christmas on 12/13/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var shows = [ShowInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //tableView.delegate = self
        searchShows(searchQuery: "girls")
        
    }
    
    func searchShows(searchQuery: String) { ShowSearchAPI.fetchShows(for: searchQuery, completion: { (result) in
        switch result{
        case .failure( let appError):
            print("error: \(appError)")
        case .success( let shows):
            self.shows = shows
        }
    })
        
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath)
        let show = shows[indexPath.row]
        cell.textLabel?.text = show.name
        return cell
    }
}


