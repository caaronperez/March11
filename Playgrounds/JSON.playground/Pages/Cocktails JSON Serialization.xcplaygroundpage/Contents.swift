//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// What does compactmap do?

let array = [1, nil, 3, 4, 5, nil, 7, 8]

let stringOptionalArray = ["one", nil, "two", nil, "three"]

let compactMappedArray = array.compactMap({ $0 })
let filtered = array.filter({ $0 != nil})
let arrayMapped = array.map({ $0 })


print(compactMappedArray)
print(arrayMapped)
print(filtered)


func myCompactMapFunction(optionalArray: [Int?]) -> [Int] {
    var tempArray: [Int] = []
    for item in optionalArray {
        if let item = item {
            tempArray.append(item)
        }
    }
    return tempArray
}
