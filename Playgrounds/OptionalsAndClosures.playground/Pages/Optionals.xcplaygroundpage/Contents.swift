import UIKit

/* Optionals
 What is an optional?
 An optional is something (var, let, pretty much any type of thing can be 'optional') that either has a value or does not have a value. This is explicitly declared in the Swift language.
 An optional is marked by a ?
 How do optionals work under the hood?
 Optionals are implemented in swift via an enum, with cases of .some and .none
 In objective c, pretty much everything is an optional
 */

// implicitly unwrapped optional is one where in the decleration of a property, you use the 'bang' (!). This means its an optional property, so it can be nil, but you are saying that you know it will not be nil the first time it is accessed.
var x: Int! = 5

x = nil
print(x?.advanced(by: 5))


// Unwrapping an optional with 'if let' statement
// when you use an if let statement, you are checking if there is a value that can be assigned to a new constant. The bracket statements will only get run if there is a value, and that temporary assignation works.
if let unwrappedX = x {
    print(unwrappedX)
}

class Friend {
    var name: String
    var isFemale: Bool
    var placeWeMet: String
    var phoneNumber: String?
    var email: String?
    
    // Computed property. We tell the compiler what type to expect this property to be. We then tell the compiler how to 'compute' this property, and then return the computed value. This property will be freshly computed each time we access the property.
    var stringDescription: String {
        // this string is built using 'string interpolation'. We use the properties inside a 'string literal' and then when we access this string, it replaces those references with the current value of their properties.
        var string = "This is \(name), we met at \(placeWeMet). "
        if let phoneNumber = phoneNumber {
            string.append(isFemale ? "She " : "He ")
            string.append("is really cool. ")
            string.append(isFemale ? "She " : "He ")
            string.append("gave me ")
            string.append(isFemale ? "her " : "his ")
            string.append("phone number. It is \(phoneNumber). Shhhhhh. Don't tell anyone. Its a secret.")
        }
        // A guard let statement is another way to unwrap an optional. Syntax is 'guard let <name of temp assignation constant> = <optional you are trying to unwrap> else { <you need to break the scope here> }'
        // Guard statements are useful if you want to unwrap the optional and have it accessible outside of the guard statement. You want to either unwrap the value, or exit the scope.
        guard let phoneNumber = phoneNumber else {
            // basically, inside these brackets is your back up plan for what happens if the temporary assignation fails.
            print("There was an error accessing the phoneNumber value") // prints to the console, so you can do easier debugging on why this failed
            return string // exiting scope
        }
        print(phoneNumber) // phone number is no longer optional here because the guard statement unwrapped it
        return string
    }
    
    init(name: String, isFemale: Bool, placeWeMet: String, phoneNumber: String? = nil, email: String? = nil) {
        self.name = name
        self.isFemale = isFemale
        self.placeWeMet = placeWeMet
        self.phoneNumber = phoneNumber
        self.email = email
    }
}

let jane = Friend(name: "Jane", isFemale: true, placeWeMet: "The Mall on Peach Tree Street", phoneNumber: "385-291-3847", email: "jane@gmail.com")
let bob = Friend(name: "Bob", isFemale: false, placeWeMet: "The bar on the corner of Peach Tree and Peach Crossing", phoneNumber: nil, email: nil)

print(jane.stringDescription)
print(bob.stringDescription)

