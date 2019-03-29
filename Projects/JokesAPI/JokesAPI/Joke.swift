//
//  Joke.swift
//  JokesAPI
//
//  Created by Jeremiah Hawks on 3/27/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import Foundation

class Joke: Codable {
    let id: Int
    let category: ViewController.Category
    let type: String
    let joke: String?
    let setup: String?
    let delivery: String?
}
