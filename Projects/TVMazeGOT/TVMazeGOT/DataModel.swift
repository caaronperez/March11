//
//  Episode.swift
//  TVMazeGOT
//
//  Created by Jeremiah Hawks on 3/25/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import Foundation

struct TVMGOTReturn: Decodable {
    let _embedded: EpisodeContainer
}

struct EpisodeContainer: Decodable {
    let episodes: [Episode]
}


struct Episode: Decodable {
//    let season: Int
//    let number: Int
    let name: String
    let image: ImageStruct?
}

struct ImageStruct: Decodable {
    let medium: String
    let original: String
}
