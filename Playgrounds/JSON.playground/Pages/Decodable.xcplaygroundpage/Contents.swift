import Foundation

let characterJSONFileURL = Bundle.main.url(forResource: "character", withExtension: "json")
let responseJSONFileURL = Bundle.main.url(forResource: "response", withExtension: "json")
let jsonCharacterData = try Data(contentsOf: characterJSONFileURL!)
let responseJSONData = try Data(contentsOf: responseJSONFileURL!)

// to conform to decodable, you must implement the init(from decoder:) function in your class. If your keys are different from the var/let names, you will need a custom CodingKeys enum. If you have a nested dictionary you need to access, you will need a custom implementation of the init(from decoder:)
struct Character: Decodable {
    let description: String
    let url: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let icon = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .Icon)
        description = try container.decode(String.self, forKey: .description)
        url = try icon.decode(String.self, forKey: .url)
    }
    
    enum CodingKeys: String, CodingKey {
        case Icon
        case url = "URL"
        case description = "Text"
    }
}

struct Characters: Decodable {
    let characterArray: [Character]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        characterArray = try container.decode([Character].self, forKey: .response)
    }
    
    enum CodingKeys: String, CodingKey {
        case response = "RelatedTopics"
    }
}

let decoder = JSONDecoder()
let apu = try decoder.decode(Character.self, from: jsonCharacterData)

struct SimpleCharacter: Codable {
    let name: String
    let url: String
    let description: String
}

let simpleFileURL = Bundle.main.url(forResource: "simple", withExtension: "json")
let simpleData = try Data(contentsOf: simpleFileURL!)

let simple = try decoder.decode(SimpleCharacter.self, from: simpleData)
/* Codeable has its advantages. If you have a simple json structure and you are comfortable with the keys from the json as your property names, then very little customization is required. You just have to say the the class is Codable. If you have nested dictionaries or arrays you need to access, you will need to provide your own init. 
 */
let encoded = try JSONEncoder().encode(simple)
let string = String(data: encoded, encoding: .utf8)!
print(string)

let characters = try decoder.decode(Characters.self, from: responseJSONData)

for c in characters.characterArray {
    print(c.url)
}
