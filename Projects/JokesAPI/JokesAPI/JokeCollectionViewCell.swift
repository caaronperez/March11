//
//  JokeCollectionViewCell.swift
//  JokesAPI
//
//  Created by MAC on 3/28/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import UIKit

class JokeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var jokeTextView: UITextView!
    
    func configure(with joke: Joke) {
        var superJokeString = ""
        superJokeString += String(joke.id) + "\n"
        superJokeString += joke.category.rawValue + "\n"
        superJokeString += joke.type + "\n"
        if let unwrappedJoke = joke.joke {
            superJokeString += unwrappedJoke + "\n"
        }
        if let unwrappedSetup = joke.setup {
            superJokeString += unwrappedSetup + "\n"
        }
        if let unwrappedDelivery = joke.delivery {
            superJokeString += unwrappedDelivery + "\n"
        }
        
        jokeTextView.text = superJokeString
    }
}
