//
//  Joke.swift
//  JokesAPI
//
//  Created by Jeremiah Hawks on 3/27/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import Foundation

struct Joke: Codable {
    let id: Int
    let category: Joke.JokeCategory
    let type: String
    let joke: String?
    let setup: String?
    let delivery: String?
    
    
    enum JokeCategory: String, RawRepresentable, Codable {
        case anything = "Any"
        case programming = "Programming"
        case dark = "Dark"
        case misc = "Miscellaneous"
    }
}

extension Joke {
    
    var dictionaryRepresentation: [String: Any] {
        var dictionary: [String: Any] = [:]
        dictionary["id"] = id
        dictionary["category"] = category.rawValue
        dictionary["type"] = type
        if let joke = joke {
            dictionary["joke"] = joke
        }
        if let setup = setup {
            dictionary["setup"] = setup
        }
        if let delivery = delivery {
            dictionary["delivery"] = delivery
        }
        return dictionary
    }
    
    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? Int,
            let categoryString = dictionary["category"] as? String,
            let category = JokeCategory.init(rawValue: categoryString),
            let type = dictionary["type"] as? String else { return nil }
        self.id = id
        self.category = category
        self.type = type
        self.joke = dictionary["joke"] as? String
        self.setup = dictionary["setup"] as? String
        self.delivery = dictionary["delivery"] as? String
    }
}
