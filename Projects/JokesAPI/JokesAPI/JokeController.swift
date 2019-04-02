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
    
    func getJokesFromDefaults() -> [Joke] {
        guard let jokes = UserDefaults.standard.value(forKey: "AllDemJokes") as? [[String: Any]] else { return [] }
        fetchJokesFromCoreData()
        return jokes.compactMap( { Joke(dictionary: $0) } )
    }
    
    func fetchJokesFromCoreData() {
        let context = CoreDataStack.shared.context
        
        //2
        let fetchRequest = NSFetchRequest<CDJoke>(entityName: "CDJoke")
        
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
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    
    // MARK: - Update
    
    func saveToDefaults(jokes: [Joke]) {
        let dictionaryArray = jokes.compactMap( { $0.dictionaryRepresentation } )
        UserDefaults.standard.set(dictionaryArray, forKey: "AllDemJokes")
        _ = jokes.compactMap( { saveToCoreData(joke: $0) } )
    }
    
    func saveToCoreData(joke: Joke) {
        let context = CoreDataStack.shared.context
        guard let entity = NSEntityDescription.entity(forEntityName: "CDJoke", in: context) else { return }
        let cdJoke = NSManagedObject(entity: entity, insertInto: context)
        cdJoke.setValue(joke.id, forKey: "id")
        cdJoke.setValue(joke.category.rawValue, forKey: "category")
        cdJoke.setValue(joke.joke, forKey: "joke")
        cdJoke.setValue(joke.setup, forKey: "setup")
        cdJoke.setValue(joke.delivery, forKey: "delivery")
        cdJoke.setValue(joke.type, forKey: "type")
        try? context.save()
    }
}
