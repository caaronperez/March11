import UIKit

var str = "Hello, playground"

// syntax of a function:
// func - Keyword denoting there will be a function definition following
// closure - the name of the function we are defining
// someClosure: The name of a paramater for the function we are defining
// @escaping  () -> Void - This is the type of the paramater "someClosure"
// () - > Void - This is the actual type. This is short hand for the most basic closure, just like a function, anything inside of the parenthesis is a paramater
// -> What follows this arrow is what will be returned (remember we're still talking about the paramater, so, this paramater is a closure, and the closure, not our 'closure' function, will return this thing
// Void - Every function that does not have a specific return, i.e. no return, actually returns 'Void', or, nothing
// @escaping - This means the 'someClosure' paramater will be called after our 'closure' function returns. i.e., the the code in the someClosure paramater will still be executing after the 'closure' function has finished running all its code.
func closure(someClosure: @escaping (Int) -> Void) {
    someClosure(5)
}


