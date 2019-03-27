//
//  ViewController.swift
//  TVMazeGOT
//
//  Created by Jeremiah Hawks on 3/25/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Properties
    
    var episodes = [Episode]()
    
    // MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        URLSession.shared.dataTask(with: URL(string: "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes")!) { (data, response, error) in
            if let data = data {
                do {
                    let tvmReturn = try JSONDecoder().decode(TVMGOTReturn.self, from: data)
                    self.episodes = tvmReturn._embedded.episodes
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    // MARK: - Helper functions
    
    func getData(for url: String, with completion: @escaping ([Episode]) -> Void) {
        NetworkController.shared.performRequest(for: URL(string: url)!, httpMethod: .Get) { (data, error) in
            if let data = data {
                do {
                    let tvmReturn = try JSONDecoder().decode(TVMGOTReturn.self, from: data)
                    completion(tvmReturn._embedded.episodes)
                } catch {
                    print(error.localizedDescription)
                    completion([])
                }
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(episodes[indexPath.row].name)
        if let i = episodes[indexPath.row].image {
            cell.loadImage(from: URL(string: i.medium)!)        }
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}

