//
//  JokeController.swift
//  JokesAPI
//
//  Created by Jeremiah Hawks on 3/29/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import Foundation
import CoreData

class JokeControler {
    
    let baseURL = "https://sv443.net/jokeapi/category/"
    
    // CRUD functions go here
    
    // MARK: - Create
    
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
    
    // MARK: - Read
    
    func fetchJokesFromCoreData() -> [Joke] {
        let context = CoreDataStack.shared.context
        
        //2
        let fetchRequest: NSFetchRequest<Joke> = Joke.fetchRequest()
        
        //3
        do {
            let jokes = try context.fetch(fetchRequest)
            for joke in jokes {
                print(joke.id)
                print(joke.category)
                print(joke.type)
                print(joke.joke)
                print(joke.setup)
                print(joke.delivery)
            }
            return jokes
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    
    
    // MARK: - Update
    
    func saveToCoreData() {
        let context = CoreDataStack.shared.context
        try? context.save()
    }
}
