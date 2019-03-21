//
//  ViewController.swift
//  CocoaPodsAndNetworking
//
//  Created by Jeremiah Hawks on 3/21/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = FBSDKLoginButton()
        view.addSubview(button)
        let centerX = NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([centerX, centerY])
        
    }


}

