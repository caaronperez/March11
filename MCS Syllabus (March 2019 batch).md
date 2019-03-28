# MCS Syllabus - March 2019 Group

# Table of Contents

* [Week 1](#week-1)

	* [Day 1 - Orientation Day -- No Technical Training](#day-1)
	* [Day 2 - Introduction To Programming](#day-2)
	* [Day 3 - Optionals and Closures](#day-3)
	* [Day 4 - Xc😭de, UI Components, and AutoLayout](#day-4)
	* [Day 5 - UI Continued, Extensions, Protocols, and UITableViews](#day-5)

* [Week 2](#week-2)

	* [Day 6 - Git, HIG, and the App Store](#day-6)
	* [Day 7 - Catch Up Day](#day-7)
	* [Day 8 - Programmatic Views, Codable, and JSONSerialization](#day-8)
	* [Day 9 - Third Party Libraries, CocoaPods, and Network Calls](#day-9)
	* [Day 10 - Test: JSON, TableView, DetailView, Constraints](#day-10)

* [Week 3](#week-3)

	* [Day 11 - Catchup / Deep Dive on Difficult Topics](#day-11)
	* [Day 12 - Network Calls](#day-12)
	* [Day 13 - Network Calls Continued, Singleton Pattern](#day-13)
	* [Day 14 - Network Calls Continued Continued, CollectionViews](#day-14)
	* [Day 15 - Persistance](#day-15)


# <a name="week-1"></a>Week 1


## <a name="day-1"></a>Day 1: Orientation Day

* No technical training given today

## <a name="day-2"></a>Day 2: Introduction to Programming

### What is a program?

* A program is a set of instructions that a computer can understand and execute
* What is a programming language?
	* What kinds of langugages are there?
		* Low level
		* High level

### OOP

* What is Object Oriented Programming?
	* Instead of focusing on inputs an outputs (a more traditional approach to programming) OOP focuses on data as model objects. A "Human" object might include Name, DOB, Age, Hight, Location, etc. Pretty much everything is an object in OOP. 
	* Four principals of OOP
		* Encapsulation
		* Abstraction
		* Inheritance
		* Polymorphism
* What is an object?
	* An object is a model of a real life thing (like a person) and it usually has a state and methods to manage itsself. 

### Value types

* Structs
* Enum
* Array
* Dictionary
* Set

### Reference types

* Class


## <a name="day-3"></a>Day 3: Optionals and Closures
	
### Optionals

### Closures

## <a name="day-4"></a>Day 4: Xc😭de, UI Components, and AutoLayout

### Xc😭de

* Templates
* Creating a new project
* Assistant Editor
* Inspector Panel
	* File Inspector
	* Quick Help Inspector
	* Identity Inspector
	* Attributes Inspector
	* Size Inspector
	* Connections Inspector
* Navigator Panel
	* Project Navigator
	* Source Control Navigator
	* Symbol Navigator
	* Find Navigator
	* Issue Navigator
	* Test Navigator
	* Debug Navigator
	* Breakpoint Navigator
	* Report Navigator
* Debug Area
	* Variables View
	* Console

### Storyboards

* Scenes
* Document Outline Panel
* Update Frames Button
* Embed In Menu
* Align Menu
* Add New Constraints Menu (Tie-Fighter Menu)
* Resolve Auto Layout Issues Button
* Objects Library

### Simulators

### UIView

### Basic UIControls

* UILabel
* UIImage
* UIButton
* UISegmentedControl
* UITextField
* UISlider
* UISwitch

### IBOutlet

### IBAction
	
### Auto Layout

* UIStackView
* Constraints


## <a name="day-5"></a>Day 5: UI Continued, Extensions, Protocols, and UITableViews

### Extensions

* Extend the functionality of classes. Even classes where we don't have access to the implementation code.

### Protocols

* Associated type

### UINavigationController

* Navigation Stack

### UITabBarController

* Refactor to storyboard 

### UIViewController lifecycle

* viewDidLoad
* viewWillAppear
* viewDidAppear
* viewWillDissapear
* viewDidDissapear

### UIViewController Communication and Transitions

* Types of segues
* prepareForSegue
* unwind segue
* willDisplayCellAt
* Triggering transitions via buttons

### App lifecycle

* The actual lifecycle of an app from not running to running to closed in iOS
* The "App Lifecycle" in the sense of the lifecycle of createing an app from start to finish

### Continue UI Components

* UITableView
	* UITableViewDelegate
		* <a href="https://developer.apple.com/documentation/uikit/uitableviewdelegate">Apple Docs</a>
		* tableView(_:willDisplay:forRowAt:)
		* tableView(_:didSelectRowAt:)
	* UITableViewDataSource
		* <a href="https://developer.apple.com/documentation/uikit/uitableviewdatasource">Apple Docs</a>
		* numberOfSections(in:)
		* tableView(_:numberOfRowsInSection:)
		* tableView(_:cellForRowAt:)
	* Cells
		* textLabel
		* detailTextLabel
		* imageView	
		* Default cells
			* Basic
			* Right Detail
			* Left Detail
			* Subtitle
				
### MVC

# <a name="week-2"></a>Week 2

## <a name="day-6"></a>Day 6: Git, HIG, and the App Store

### Version Control

* What is Git?
	* Push
	* Pull
	* Merge
	* Rebase
* Git branching stratagies

### HIG
* What are the Human Interface Guidelines?

### App Store Guidelines

* what can be accepted/rejected
* causes of rejection?
* develop in perspective of the user
* demonstrations of good app design, patterns
* bad designs?
* Android?


## <a name="day-7"></a>Day 7: Catch Up Day

* Go over topics that we are struggling with
	* Closures
	* Size Classes in AutoLayout
	* ViewController Life Cycle Functions

## <a name="day-8"></a>Day 8: Programmatic Views, Codable, JSONSerialization

### Programmatic Views
### Codable
### JSONSerialization



## <a name="day-9"></a>Day 9: Third Party Libraries and CocoaPods

### Third Party Libraries

* Advantages
* Disadvantages
	*  Security Risks

### CocoaPods

* Alamofire
* SwiftyJson
* FBSDK
* SnapKit
* SwiftLint

## <a name="day-10"></a>Day 10: Test - JSON, TableView, DetailView, Constraints

### Things to study:
* Parsing JSON (codable and JSONSerialization)
* Loading data into a tableview
* Transitions between ViewControllers, including passing data between them

# <a name="week-3"></a>Week 3

## <a name="day-11"></a>Day 11: Catchup / Deep Dive on difficult topics

* JSON parsing
* CompactMap

## <a name="day-12"></a>Day 12: Network Calls

* CompactMap
* Understanding the NetworkController Snippit
* Building a quick app to connect to the Joke API

## <a name="day-13"></a>Day 13: Network Calls Continued

* Singleton design pattern
* What is an instance?
* What is the initializer for?
* What is an object?

### Network Calls

* <a href="https://developer.apple.com/documentation/foundation/urlsession">```URLSession```</a>
	* This is apples 1st party class that handles network calls. Many third party libraries for networking will utilize this class to preform their functionality.
	* What are the main methods/properties I should be aware of?
		* <a href="https://developer.apple.com/documentation/foundation/urlsession/1409000-shared">```shared```</a>
			* This is a pre-configured singleton instance that is ready for us to use. 😁
		* <a href="https://developer.apple.com/documentation/foundation/urlsession/1410330-datatask">```dataTask(with:completionHandler:)```</a>
			* a ```dataTask``` starts in a 'suspended' state. Therefor, you must call <a href="https://developer.apple.com/documentation/foundation/urlsessiontask/1411121-resume">```.resume()```</a> on the dataTask, or it will never start the network call
* What else should I know?
	* iOS devices have multiple 'threads' that they execute programs on. The ```main``` thread is the one in charge of updating UI. 
		* ALL UI MUST BE UPDATED ON THE MAIN THREAD
		* If you update it on a background thread, the app will, at the very least, become unresponsive, and at worst, crash.
	* So, how do I update the UI on the main thread?
		* ```DispatchQueue.main.async { // execute code here }```
			
<details> 
	<summary>NetworkController Snippit</summary>

```

class NetworkController {
    
    // MARK: Properties
    
    enum HTTPMethod: String {
        case Get = "GET"
        case Put = "PUT"
        case Post = "POST"
        case Patch = "PATCH"
        case Delete = "DELETE"
    }
    
    static func performRequest(for url: URL,
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
    
    static func url(byAdding parameters: [String : String]?,
                    to url: URL) -> URL {
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters?.compactMap({ URLQueryItem(name: $0.0, value: $0.1) })
        
        guard let url = components?.url else {
            fatalError("URL optional is nil")
        }
        return url
    }
}


```

</details>
	
## <a name="day-14"></a>Day 14: Network Calls Continued Continued and Collection Views

* Continue working with the network controller
* Demonstrate how to use it to make network calls
* hook up buttons to network calls
* Parse response and turn into objects
* save objects so you can display them

### UICollectionViews

* What is a <a href="https://developer.apple.com/documentation/uikit/uicollectionview">```UICollectionView```</a>?
	* Like a tableview, it is a subclass of a UIScrollView
	* It displays a collection of things. Instead of just having rows, it also has columns
	* It has it's own cell type, just like a TableView
* What are the main methods I should be aware of?
	* Protocol: <a href="https://developer.apple.com/documentation/uikit/uicollectionviewdatasource">```UICollectionViewDataSource```</a>
		* <a href="https://developer.apple.com/documentation/uikit/uicollectionviewdatasource/1618058-collectionview">```collectionView(_:numberOfItemsInSection:)```</a>
		* <a href="https://developer.apple.com/documentation/uikit/uicollectionviewdatasource/1618029-collectionview">```collectionView(_:cellForItemAt:)```</a> 
	* Protocol: <a href="https://developer.apple.com/documentation/uikit/uicollectionviewdelegate">```UICollectionViewDelegate```</a>
		* <a href="https://developer.apple.com/documentation/uikit/uicollectionviewdelegate/1618032-collectionview">```collectionView(_:didSelectItemAt:)```</a>
		* <a href="https://developer.apple.com/documentation/uikit/uicollectionviewdelegate/1618087-collectionview">```collectionView(_:willDisplay:forItemAt:)```</a>
* How do I create a custom <a href="https://developer.apple.com/documentation/uikit/uicollectionviewlayout">```UICollectionViewLayout```</a>?

## <a name="day-15"></a>Day 15: Persistance

### What persistance options are available for me in iOS?


#### First Party Solutions

* Core Data
	* Useful for storing custom objects and large amounts of data
* UserDefaults
	* for storing things like settings for the app
	* small amounts of simple data
* Plist
	* for storing small amounts of data
* Keychain
	* for storing sensitive information (passwords, security tokens, keys, credit cards, etc.)
* FileManager
	* Can handle more data, but its less secure
* NSKeyedArchiver
	* Works with UserDefaults to store custom objects as data 

#### In-between Party Solutions

* Custom SQLite Database
	* SQLite is a third party database, but you get to implement it all yourself. In code. 😭 

#### Third Party Solutions

* Realm
	* Simmilar to Core Data. For large amounts of data. 
	* You'd get the SDK (pod), install it in your project, and then use the third party library
	* This is the kind of code you'd need to write if you wanted to use a basic SQLite database


# <a name="week-4"></a>Week 4

<!---
***********************
	Week 4:
Objective-C Topics to cover:
Objective-C
Bridging Objective-C to Swift, Swift to Objective-C
KVC/KVO
NSNotificationCenter
Dynamic/Synthesize
Dynamic Dispatch

+
Instruments
Git
GitFlow
***********************
-->

## <a name="day-16"></a>Day 16: Core Data Deep Dive

### Core Data

* Main components
	* <a href="https://developer.apple.com/documentation/coredata/nsmanagedobject">```NSManagedObject```</a>
		* "A base class that implements the behavior required of a Core Data model object." - Apple Docs
		* This is a basic custom object you have created for your app and wish to store in Core Data
		* The actual code for this class is generated automatically for you, but its hidden by default
	* <a href="https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext">```NSManagedObjectContext```</a>
		* "An object space that you use to manipulate and track changes to managed objects." - Apple Docs
		* Frequently referred to as a 'scratchpad' where you can work with your objects
		* The objects will not persist unless you <b><i>save</b></i> this context
	* <a href="https://developer.apple.com/documentation/coredata/nsmanagedobjectmodel">```NSManagedObjectModel```</a>
		* This is what your data structure looks like
		* can include one or more <a href="https://developer.apple.com/documentation/coredata/nsentitydescription">```NSEntityDescription```</a>s, which are basically one of your custom objects
		* includes relationships between entitys
	* <a href="https://developer.apple.com/documentation/coredata/nsfetchrequest">```NSFetchRequest```</a>
		* "A description of search criteria used to retrieve data from a persistent store." - Apple Docs
		* you use a fetch request to pull your items out of storage and load them into your context so that you can work with them
	* <a href="https://developer.apple.com/documentation/coredata/nspersistentstorecoordinator">```NSPersistentStoreCoordinator```</a>
		* "A coordinator that uses the model to help contexts and persistent stores communicate." - Apple Docs
		* This is the class that goes between the persistant store and the context
	* <a href="https://developer.apple.com/documentation/foundation/nspredicate">```NSPredicate```</a>
		* "A definition of logical conditions used to constrain a search either for a fetch or for in-memory filtering." -Apple Docs 
		* This is the logic part of your fetch request
* CoreDataStack 
	* This generally refers to a combination of the above tools, generally contained within some sort of helper, or service class, that preforms the necessary functionality to get stuff in and out of Core Data and to manipulate the objects

### Core Data Tricky Topics

* How to fetch
* How to save
* Codable and Core Data
* What is a Core Data Fault?


<!---
***********************
Day 16: Introduction to Objective-C
***********************

Present weekend assignments for first half.

Introduction to Objective-C
	-Variables, Constants, Optionals
	-atomic, nonatomic, strong, weak
	-header and implementation file
	-import everything

Data Types and Collection Types
	-Classes
	-Enum
	-Arrays
	-Dictionaries
	-Sets
	-Mutable and Nonmutable types 

Additional Swift Capabilities
	-Extensions/Categories
	-Protocols
	-Blocks

UITableView, UICollectionView, etcetc
	-with Objective-C instead

NSJSONSerialization

End of class Exercise 1: working with individual items, functions, etc

Weekday Homework 1:
	-basic Swift exercise, but it's Objective-C
Weekday Homework 2:
	-Assign an Objective-C assignment, with details that we will implement throughout the week

-->

## <a name="day-17"></a>Day 17

<!---
***********************
Day 17: One-to-Many
***********************

-KVC
-KVO
-NSNotifications
-Dynamic, Synthesize
-Dynamic Dispatch
-use Swift and Objective-C together


-->

## <a name="day-18"></a>Day 18

<!---
***********************
Day 18: Git & Instruments
***********************

-git
-github
-making commits, etc
-Instruments
	-find memory leaks
-gitflow to fix bugs


-task: given some (problem) app, make a branch to analyze issues
	-look at issues with Instruments


-->

## <a name="day-19"></a>Day 19

<!---
***********************
Day 19: Testing
***********************

Unit Testing
XCTests
XCUITests
Test-Driven Development
-dependency injection
-mocks


-testing Objc and Swift code together?

-task: continuing from yesterday, start setting up tests
	-add a new feature, with a test


-->

## <a name="day-20"></a>Day 20

<!---
***********************
Day 20: Testing Cont.
***********************

Crashlytics
Cause Errors, Track Errors
Get Crash Logs
Create branch to resolve errors.

Let class do this, merge at the end.

-task: what are some common complaints? How do we solve these issues?

-task: take some old assignment, add tests to it


-->

