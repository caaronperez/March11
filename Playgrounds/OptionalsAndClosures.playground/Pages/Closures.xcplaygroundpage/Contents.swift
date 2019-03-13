import UIKit

/* What is a closure?
 A closure is a block of code. This is basically the same thing as a function. You can pass it around. Closures are usually unnamed, functions are always named. You should think of a closre as a function. It is something that needs to be called, just like a function, or else it will not get executed.
 */

let myInts = [1, 2, 4, 3, 6, 5]
/*
 1, 2
 1, 4
 1, 3
 1, 6
 1, 5
 2, 4
 2, 3
 2, 6
 2, 5
 4, 3
 4, 6
 4, 5
 3, 6
 3, 5
 6, 5
 
 */
func someFunc(x: Int, y: Int) -> Bool {
    return x < y
}

let myOrderedInts = myInts.sorted { (firstElement, nextElement) -> Bool in
    return firstElement < nextElement
}

let bigToSmall = myInts.sorted { (x, y) -> Bool in
    return x > y
}
print(bigToSmall)

//func mySortedForInts(array: [Int], sortClosure: (Int, Int) -> Bool) -> [Int] {
//    var tempOriginalArray = array
//    var tempArray: [Int] = []
//    for (index1, x) in tempOriginalArray.enumerated() {
//        var closureEvaluatesToTrue = true
//        for (index2, y) in tempOriginalArray.enumerated() {
//            if index1 == index2 {
//
//            }
//        }
//    }
//    return tempArray
//}
print(myOrderedInts)


class NetworkController {
    
    static let shared = NetworkController()
    func performRequest(urlString: String, closure: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            closure(nil, nil, nil)
            print(urlString)
            return
        }
        URLSession.shared.dataTask(with: url) { (optionalData, optionalResponse, optionalError) in
            closure(optionalData, optionalResponse, optionalError)
        }.resume() // resuming the data task, which is created in a paused state by default
    }
}

let imageURLString = "https://pics.me.me/lol-itm-batman-im-batman-funny-kid-lol-gag-2580177.png"
let bogusURLString = "I'm not a URL"

NetworkController.shared.performRequest(urlString: bogusURLString) { (optionalData, optionalResponse, optionalError) in
    if let error = optionalError {
        print(error)
    }
    if let data = optionalData {
        if let image = UIImage(data: data) {
            print(image)
            print("Hooray! I found an image!")
        }
    }
    if let response = optionalResponse {
        print(response)
    }
}

class FakeURLSession {
    
    static let shared = FakeURLSession()
    func someFunc() {
        
    }
    
}
FakeURLSession.shared.someFunc()
