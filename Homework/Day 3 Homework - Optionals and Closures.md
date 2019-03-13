# Day 3 Homework - Optionals and Closures

## Tutorials 

* <a href"https://hackernoon.com/swift-optionals-explained-simply-e109a4297298">Optionals</a>
* <a href"https://blog.bobthedeveloper.io/no-fear-closure-in-swift-3-with-bob-72a10577c564">Closures Part 1</a>
* <a href"https://blog.bobthedeveloper.io/no-fear-closure-in-swift-3-with-bob-part-2-1d79b8c4021d">Closures Part 2</a>

## Filter
* Implement your own version of ```filter``` using the function definition below

```
func myFilter(array: [Int], filterClosure: (Int) -> Bool) -> [Int] {
}
```

* The filter function should call the closure on each item in the array. If the closure evaluates to true this item should be saved into a new array that holds all the 'true' values. After all the items have been evaluated by your closure, return an array of only the ones that evaluated to true.

## Sort

* Implement the ```Sort``` function usng the definition below

```
func mySort(array: [Int], sortClosure: (Int, Int) -> Bool) -> [Int] {
}
```
* This function should evaluate every combination of two distinct items in the array that is passed in using the closure that is also passed in. It should then order the items correctly, and return the ordered items in an array.

## Grading rubric

| Item | Points | 
|:-----|-------:|
| Optionals Tutorial | 25 points
| Closures Tutorial | 25 points
| Filter Implementation | 25 points
| Sort Implementation | 25 points
|-----|-----|
| Total | 100 points