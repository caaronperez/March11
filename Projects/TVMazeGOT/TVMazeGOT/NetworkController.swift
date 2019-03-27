//
//  NetworkController.swift
//  TVMazeGOT
//
//  Created by Jeremiah Hawks on 3/25/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

struct someStruct {
    let name: String
    let birthday: String
}


class House {
    
    let walls: Int
    let windows: Int
    let occupants: Int
    var occupantNames: [String]
    
    init(walls: Int, windows: Int, occupants: Int, occupantNames: [String]) {
        self.walls = walls
        self.windows = windows
        self.occupants = occupants
        self.occupantNames = occupantNames
    }
    
    func runBath() {
        print("I turned the faucet on and the bathtub is filling up!")
        NetworkController.shared
    }
}

import Foundation

class NetworkController {
    
    // MARK: Properties
    
    private static var _shared: NetworkController?
    
    static var shared: NetworkController {
        if let nc = _shared {
            return nc
        } else {
            let nc = NetworkController()
            _shared = nc
            return nc
        }
    }
    
    private init() {}
    
    enum HTTPMethod: String {
        case Get = "GET"
        case Put = "PUT"
        case Post = "POST"
        case Patch = "PATCH"
        case Delete = "DELETE"
    }
    
    /**
     This function makes a network call and returns optional data, and error.
     - Parameter url: This accepts a URL object. This is where you want to fetch data from
     - Parameter httpMethod: The method to use to make the network call
     - Parameter urlParameters: The paramaters to use to build the URL
     - Parameter body: Data to be passed in the body of the network call
     - Parameter completion: Accpets a closure as a completion to the call. Completes with Data? and Error?
     */
    func performRequest(for url: URL,
                               httpMethod: HTTPMethod,
                               urlParameters: [String : String]? = nil,
                               body: Data? = nil,
                               completion: ((Data?, Error?) -> Void)? = nil) {
        
        // Build our entire URL
        
        let requestURL = self.url(byAdding: urlParameters, to: url)
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        
        // Create and "resume" (a.k.a. run) the task
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            completion?(data, error)
        }
        
        dataTask.resume()
    }
    
    func url(byAdding parameters: [String : String]?,
                    to url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters?.compactMap({ URLQueryItem(name: $0.0, value: $0.1) })
        guard let url = components?.url else {
            fatalError("URL optional is nil")
        }
        return url
    }
}
