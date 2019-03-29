//
//  ViewController.swift
//  JokesAPI
//
//  Created by Jeremiah Hawks on 3/27/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    static var midnightModeOn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "frankenflag")
        } set {
            UserDefaults.standard.set(newValue, forKey: "frankenflag")
        }
    }
    // MARK: - IBOutlets
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var categorySelector: UISegmentedControl!
    
    // MARK: - Properties
    
    var jokes: [Joke] = []
    var jokesToShow = [Joke]()
    var category = Joke.JokeCategory.anything
    
    // MARK: - IBActions
    
    @IBAction func getAnotherButtonClicked(_ sender: Any) {
        JokeControler().getAJoke(category: category) { [unowned self] (joke) in
            if let joke = joke {
                self.jokes.append(joke)
                self.jokesToShow.append(joke)
                JokeControler().saveToDefaults(jokes: self.jokes)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        guard let segment = Segment(rawValue: sender.selectedSegmentIndex) else { return }
        switch segment {
        case .misc:
            category = .misc
            jokesToShow = jokes.filter({ $0.category == .misc })
        case .programming:
            category = .programming
            jokesToShow = jokes.filter({ $0.category == .programming })
        case .dark:
            category = .dark
            jokesToShow = jokes.filter({ $0.category == .dark })
        case .anything:
            category = .anything
            jokesToShow = jokes
        }
        tableView.reloadData()
    }
    
    // MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        ViewController.midnightModeOn = !ViewController.midnightModeOn
        self.tableView.reloadData()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let collectionViewController = storyboard.instantiateViewController(withIdentifier: "JokesCollectionViewController") as! JokesCollectionViewController
//        collectionViewController.jokes = jokes
//        present(collectionViewController, animated: true, completion: nil)
    }

    // MARK: - Setup Functions
    
    func setupViewController() {
        searchBar.delegate = self
        let jokesFromDefaults = JokeControler().getJokesFromDefaults()
        jokes = jokesFromDefaults
        jokesToShow = jokesFromDefaults
        tableView.reloadData()
        tableView.register(UINib(nibName: "JokeTableViewCell", bundle: nil), forCellReuseIdentifier: "qwerty")
        //Setting initial selected segment to Any segment
        categorySelector.selectedSegmentIndex = 3
    }
    
    // MARK: - Helper Functions
    
    
    
    
    
    enum Segment: Int {
        case misc
        case programming
        case dark
        case anything
    }
}

// MARK: - UITableViewDataSource Methods

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokesToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "qwerty", for: indexPath) as! JokeTableViewCell
        let joke = jokesToShow[indexPath.row]
        if let singleJoke = joke.joke {
            cell.jokeLabel.text = singleJoke
            cell.deliveryLabel.text = nil
        } else if let setup = joke.setup, let delivery = joke.delivery {
            cell.jokeLabel.text = setup
            cell.deliveryLabel.text = delivery
        } else {
            cell.jokeLabel.text = "404: No joke found"
            cell.deliveryLabel.text = nil
        }
        return cell
    }
}

// MARK: - UITableViewDelegate Methods

extension ViewController: UITableViewDelegate {
    
}

// MARK: - UISearchBarDelegate Methods

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        guard !searchText.isEmpty else {
            jokesToShow = jokes.filter({ $0.category == category })
            tableView.reloadData()
            return
        }
        let filteredJokes = jokes.filter { (joke) -> Bool in
            return (joke.joke?.localizedCaseInsensitiveContains(searchText) == true
                || joke.setup?.localizedCaseInsensitiveContains(searchText) == true
                || joke.delivery?.localizedCaseInsensitiveContains(searchText) == true)
                && joke.category == category
        }
        jokesToShow = filteredJokes
        tableView.reloadData()
    }
}
