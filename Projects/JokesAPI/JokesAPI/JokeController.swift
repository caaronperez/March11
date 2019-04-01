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
    let controller = CoreDataController()
    
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
        self.getJokesFromCoreData()
        return jokes.compactMap( { Joke(dictionary: $0) } )
    }
    
    func getJokesFromCoreData() {
        let context = self.controller.context
        let fetchRequest = NSFetchRequest<RenfrewJoke>(entityName: "RenfrewJoke")
        fetchRequest.predicate
        do {
            
            let potentialJokes = try context.fetch(fetchRequest)
            for joke in potentialJokes {
                print(joke.id)
                print(joke.category)
                print(joke.type)
                print(joke.joke)
                print(joke.setup)
                print(joke.delivery)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    // Update what is in UserDefaults with all the jokes
    
    func saveToDefaults(jokes: [Joke]) {
        let dictionaryArray = jokes.compactMap( { $0.dictionaryRepresentation } )
        UserDefaults.standard.set(dictionaryArray, forKey: "AllDemJokes")
        jokes.forEach(self.saveToCoreData(joke:))
    }
    
    func saveToCoreData(joke: Joke) {
        let context = self.controller.context
        guard let entity = NSEntityDescription.entity(forEntityName: "RenfrewJoke", in: context) else { return }
        
        let renfrewJoke = NSManagedObject(entity: entity, insertInto: context)
        renfrewJoke.setValue(joke.id, forKey: "id")
        renfrewJoke.setValue(joke.category.rawValue, forKey: "category")
        renfrewJoke.setValue(joke.joke, forKey: "joke")
        renfrewJoke.setValue(joke.setup, forKey: "setup")
        renfrewJoke.setValue(joke.delivery, forKey: "delivery")
        renfrewJoke.setValue(joke.type, forKey: "type")
        
        self.controller.save()
    }
}
