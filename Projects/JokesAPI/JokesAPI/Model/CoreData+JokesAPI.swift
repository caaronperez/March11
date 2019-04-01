//
//  CoreData+JokesAPI.swift
//  JokesAPI
//
//  Created by Jeremiah Hawks on 4/1/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import CoreData

class CoreDataStack {
    
    private static var _shared: CoreDataStack?
    
    static var shared: CoreDataStack {
        if let instance = _shared {
            return instance
        } else {
            let instance = CoreDataStack()
            _shared = instance
            return instance
        }
    }
    
    private init() {}
    
    let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "JokesAPI")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext { return container.viewContext }
}
