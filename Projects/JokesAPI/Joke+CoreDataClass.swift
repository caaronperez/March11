//
//  Joke+CoreDataClass.swift
//  JokesAPI
//
//  Created by MAC on 4/3/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Joke)
public class Joke: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case category
        case delivery
        case id
        case joke
        case setup
        case type
    }
    
    enum JokeCategory: String {
        case anything = "Any"
        case dark = "Dark"
        case programming = "Programming"
        case misc = "Miscellaneous"
    }
    
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    public required init(from decoder: Decoder) throws {
        guard let entity = NSEntityDescription.entity(forEntityName: "Joke", in: CoreDataStack.shared.context) else {
            throw CoreDataError.noSuchEntity
        }
        super.init(entity: entity, insertInto: CoreDataStack.shared.context)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int64.self, forKey: .id)
        self.category = try container.decode(String.self, forKey: .category)
        self.type = try container.decode(String.self, forKey: .type)
        self.joke = try container.decodeIfPresent(String.self, forKey: .joke)
        self.setup = try container.decodeIfPresent(String.self, forKey: .setup)
        self.delivery = try container.decodeIfPresent(String.self, forKey: .delivery)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.joke, forKey: .joke)
        try container.encode(self.delivery, forKey: .delivery)
        try container.encode(self.setup, forKey: .setup)
    }
}

enum CoreDataError: Error {
    case noSuchEntity
}
