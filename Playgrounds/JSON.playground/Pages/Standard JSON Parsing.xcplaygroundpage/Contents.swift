import UIKit

// url for api request: http://api.duckduckgo.com/?q=simpsons+characters&format=json

// How to open a file that is stored in the resources folder in a playground
// 1. build the URL for the file
//    a. you need the name, and the extension, and then plug it into Bundle.main.url(forResource:withExtension:)
// 2. This gives you an optional fileURL
// characterJSONFileURL is the url for the single character JSON dictionary
let characterJSONFileURL = Bundle.main.url(forResource: "character", withExtension: "json")
// responseJSONFileURL is the url for the full response from the api call above
let responseJSONFileURL = Bundle.main.url(forResource: "response", withExtension: "json")
// 3. 'open' the url by calling Data(contentsOf:) with the url. This will turn it into data (bits and bites, etc.)
//    a. Note: we force unwrapped the optional URL. This is ok because we are just in a playground. You would want to handle the optional in a more safe manner in production code.
let jsonCharacterData = try Data(contentsOf: characterJSONFileURL!)

// whenever you an API call you will get a response in the form of data.

func getJSONDictionary(from data: Data) -> [String: Any] {
    do {
        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        if let unwrappedJSON = json {
            return unwrappedJSON
        }
    } catch {
        print(error)
    }
    //    if let json = try? (JSONSerialization.jsonObject(with: data) as? [String: Any]), let jsonUnwrapped = json {
    //        return jsonUnwrapped
    //    }
    return[:]
}

struct Character {
    let description: String
    let url: String
    
    // the ? after init means that this initializer might fail. This is called a "Failable Initializer" If the jsonDictionary doesn't have the right properties, or is malformed, or there is some other error, this initializer might return nil, instead of a Character.
    init?(fromJSON: [String: Any]) {
        guard let description = fromJSON["Text"] as? String,
            let iconDictionary = fromJSON["Icon"] as? [String: String],
            let url = iconDictionary["URL"] else { return nil }
        self.description = description
        self.url = url
    }
}

let json = getJSONDictionary(from: jsonCharacterData)
let apu = Character(fromJSON: json)
if let apu = apu {
    print(apu.description)
}
let responseData = try Data(contentsOf: responseJSONFileURL!)
let responseJSON = getJSONDictionary(from: responseData)

if let relatedTopicsDictionaryArray = responseJSON["RelatedTopics"] as? [[String: Any]] {
    // One way to get the character array is by using compact map and writing out the closure as below
    //    let characters = relatedTopicsDictionaryArray.compactMap { (characterDictionary) -> Character? in
    //        return Character(fromJSON: characterDictionary)
    //    }
    // second way is to create a var that is an empty array of the type you want and then create a for loop and put each non nil item in your temporary array
    //    var charactersArray: [Character] = []
    //    for dictionary in relatedTopicsDictionaryArray {
    //        if let character = Character(fromJSON: dictionary) {
    //            cs.append(character)
    //        }
    //    }
    // reccommended way: use compact map and use the short notation as below
    let characters = relatedTopicsDictionaryArray.compactMap( { Character(fromJSON:$0) })
    for c in characters {
        print(c.url)
    }
}

