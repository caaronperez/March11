//
//  UIView+TVMazeGOT.swift
//  TVMazeGOT
//
//  Created by Jeremiah Hawks on 3/25/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            DispatchQueue.main.async {
                self?.image = data.flatMap(UIImage.init(data:))
            }
        }.resume()
    }
}
