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
        let urlString = "https://sv443.net/jokeapi/category/\(category.rawValue)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data, let joke = try? JSONDecoder().decode(Joke.self, from: data) {
                print(joke)
                completion(joke)
            } else {
                completion(nil)
            }
        }.resume()
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
