//
//  Joke+CoreDataProperties.swift
//  JokesAPI
//
//  Created by MAC on 4/3/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var category: String?
    @NSManaged public var delivery: String?
    @NSManaged public var id: Int64
    @NSManaged public var joke: String?
    @NSManaged public var setup: String?
    @NSManaged public var type: String?

}
