import UIKit

/*
 #Value types
 * Structs
    - A value type container for an object
 * Enums
    - Short for enumeration
    - a value type container for a group of related values
 * Arrays
    - An ordered list of values
        ex. array of Ints [1, 2, 3]
        access values by index ex. array[0]
 * Dictionary
    - an unorderd list of key:value pairs
        ex. ["key": "vaule", "key2": "value", "key3": "value]
        access value dictionary["key"]
 * String
    - an ordered collection of characters
 * Set
    - an unordered collection of unique elements
 
 Reference types
 * Classes
    - A reference type container for an object

*/

struct Person {
    let name: String
    var weight: Int
    var hairColor: HairColor
    func greeting() {
        print("Hello world! I'm \(name)!")
        // switch statement must be exhaustive. Include all cases, or include a default case.
        switch hairColor {
        case .blonde:
            print("I'm blonde!")
        case .brunette:
            print("I'm brunette!")
        case .red:
            print("I'm red!")
        default:
            print("I don't care what color my hair is")
        }
    }
}

enum HairColor {
    case blonde
    case brunette
    case red
    case grey
    case brown
    case blue
}



let bob = Person(name: "Bob", weight: 200, hairColor: .blonde)
print(bob)
bob.greeting()



/*
 1. Bet 1
 2. check if won or lost
 3. if won, reset bet to 1 or if lost double bet
 
 
 3. check if divisble by 15, if so, print fizzbuzz
 1. check if divisble by 3, if so, print fizz
 2. check if divisble by 5, if so, print buzz
 */

func fizzBuzz(below: Int) -> [String] {
//    for number in 1...100 {
//        if number % 15 == 0 {
//            print("fizzbuzz")
//        } else if number % 3 == 0 {
//            print("fizz")
//        } else if number % 5 == 0 {
//            print("buzz")
//        } else {
//            print(number)
//        }
//    }
    var array = [String]()
    for number in 1..<below {
        var stringToPrint = ""
        if number % 3 == 0 {
            stringToPrint.append("fizz")
        }
        if number % 5 == 0 {
            stringToPrint.append("buzz")
        }
        // ternery operator
        stringToPrint.isEmpty ? array.append(String(number)) : array.append(stringToPrint)
    }
    return array
}

print(fizzBuzz(below:1000))

var array = [1, 2, 5, 3, 6, 2, 1, 2]



//let orderedArray = array.sor

