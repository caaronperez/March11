//
//  CoreDataController.swift
//  JokesAPI
//
//  Created by MAC on 4/1/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataController {
    lazy var container: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "RenfrewJokesAPI")
        container.loadPersistentStores(completionHandler: { (_, error) in
            guard let error = error else { return }
            print(error.localizedDescription)
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return self.container.viewContext
    }
    
    func save() {
        try? self.container.viewContext.save()
    }
}
