//
//  JokeController.swift
//  JokesAPI
//
//  Created by Jeremiah Hawks on 3/29/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import Foundation


class JokeControler {
    
    let baseURL = "https://sv443.net/jokeapi/category/"
    
    // CRUD functions go here
    
    func getAJoke(category: Joke.JokeCategory, completion: @escaping (Joke?) -> Void) {
        let urlString = "\(baseURL)\(category.rawValue)"
        guard let url = URL(string: urlString) else { completion(nil); return }
        
        NetworkController.performRequest(for: url, httpMethod: .Get) { (data, error) in
            if let error = error {
                print("/n/n/n/n/nThere was an error getting the Joke: \(error.localizedDescription)/n/n/n/n/n")
            }
            if let data = data {
                completion(try? JSONDecoder().decode(Joke.self, from: data))
                return
            }
            completion(nil)
        }
    }
    
    func getJokesFromDefaults() -> [Joke] {
        guard let jokes = UserDefaults.standard.value(forKey: "AllDemJokes") as? [[String: Any]] else { return [] }
        return jokes.compactMap( { Joke(dictionary: $0) } )
    }
    
    // Update what is in UserDefaults with all the jokes
    
    func saveToDefaults(jokes: [Joke]) {
        let dictionaryArray = jokes.compactMap( { $0.dictionaryRepresentation } )
        UserDefaults.standard.set(dictionaryArray, forKey: "AllDemJokes")
    }
    
    // Delete function?
    
    
}
