//
//  JokeTableViewCell.swift
//  JokesAPI
//
//  Created by MAC on 3/28/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import UIKit

class JokeTableViewCell: UITableViewCell {
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if ViewController.midnightModeOn {
            self.backgroundColor = .black
            self.jokeLabel.textColor = .white
            self.deliveryLabel.textColor = .white
        } else {
            self.backgroundColor = .white
            self.jokeLabel.textColor = .black
            self.deliveryLabel.textColor = .black
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if ViewController.midnightModeOn {
            self.backgroundColor = .black
            self.jokeLabel.textColor = .white
            self.deliveryLabel.textColor = .white
        } else {
            self.backgroundColor = .white
            self.jokeLabel.textColor = .black
            self.deliveryLabel.textColor = .black
        }
    }
}
