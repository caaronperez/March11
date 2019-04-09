//
//  ViewModel.swift
//  MVVM
//
//  Created by Jeremiah Hawks on 4/5/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import Foundation

struct Episode {
    let name: String
    let number: Int
    let season: Int
    let description: String
}

class ViewModel {
    
    var dataSource = [Episode(name: "A good day to die", number: 3, season: 1, description: "This is the episode where that guy with the red shirt dies"),
                      Episode(name: "A good day to die part 2", number: 4, season: 1, description: "the next red shirt guy dies"),
                      Episode(name: "season finale", number: 10, season: 1, description: "all the rest of the red shirts die in terrible ways")] {
        didSet {
            NotificationCenter.default.post(name: Notification.Name("updateTableView"), object: nil)
        }
    }
    
    // DataSource properties
    
    func numberOfRows() -> Int {
        return dataSource.count
    }
    
    func fetchDisplay(for indexPath: IndexPath) -> String {
        let episode = dataSource[indexPath.row]
        return "This is episode number \(episode.number). It is from season \(episode.season). Its name is \"\(episode.name), and heres a brief description: \(episode.description)"
    }
    
    func fetchFromURL() {
        URLSession.shared.dataTask(with: URL(string: "url.com")!) { (data, response, error) in
            // update my data source
            self.dataSource += [Episode(name: "sldkfj", number: 3, season: 4, description: "okj")]
            // send the notification
            
        }.resume()
    }
    // CRUD
    // Functions to tell the ViewController what to do
    // Any additional logic to to make the above work
}
