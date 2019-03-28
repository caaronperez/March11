//
//  ViewController.swift
//  JokesAPI
//
//  Created by Jeremiah Hawks on 3/27/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var categorySelector: UISegmentedControl!
    
    // MARK: - Properties
    
    var jokes: [Joke] = []
    
    // MARK: - IBActions
    
    @IBAction func getAnotherButtonClicked(_ sender: Any) {
        getAJoke(category: .anything)
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: Any) {
    }
    
    // MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
    }

    // MARK: - Setup Functions
    
    func setupViewController() {
        searchBar.delegate = self
        getAJoke(category: .anything)
    }
    
    // MARK: - Helper Functions
    
    func getAJoke(category: Category) {
        let urlString = "https://sv443.net/jokeapi/category/\(category.rawValue)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [unowned self] (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data, let joke = try? JSONDecoder().decode(Joke.self, from: data) {
                print(joke)
                self.jokes.append(joke)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            }.resume()
    }
    
    enum Category: String, RawRepresentable  {
        case anything = "Any"
        case programming = "Programming"
        case dark = "Dark"
        case misc = "Miscellaneous"
        
    }
    
    func loadJSONFromFile() -> [String: Any] {
        let fileURL = Bundle.main.url(forResource: "Week2", withExtension: "json")
        let data = try! Data(contentsOf: fileURL!)
        return ((try! JSONDecoder().decode(TVMReturn.self, from: data))._embeded.episodes
    }
}

// MARK: - UITableViewDataSource Methods

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate Methods

extension ViewController: UITableViewDelegate {
    
}

// MARK: - UISearchBarDelegate Methods

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
/* Steps:
 1. Access what is in the search bar
 2. filter the data you are displaying in the tableview based on that search text
 */
    }
}
