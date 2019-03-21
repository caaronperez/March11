import UIKit

// https://api.tvmaze.com/seasons/29670/episodes

struct WWEpisode: Codable {
    let id: Int
    let url: String
    let name: String
    let season: Int
    let number: Int
    let airdate: String
    let airtime: String
    let airstamp: String
    let runtime: Int
    let image: WWImage
    let summary: String
    let _links: WWLinks
    let nonsense = Nonsense(id: 5, url: "", name: "something", season: 4, number: 1, airdate: "hallu", airtime: "no", airstamp: "", runtime: 3, image: WWImage(medium: "sldkjf", original: "sldkjf"), summary: "sldkfj")
}

struct Nonsense: Codable {
    let id: Int
    let url: String
    let name: String
    let season: Int
    let number: Int
    let airdate: String
    let airtime: String
    let airstamp: String
    let runtime: Int
    let image: WWImage
    let summary: String
}

struct WWImage: Codable {
    let medium: String
    let original: String
}

struct WWLinks: Codable {
    let `self`: WWSelfLinks
}

struct WWSelfLinks: Codable {
    let href: String
}

let fileURL = Bundle.main.url(forResource: "tvmaze", withExtension: "json")!

let jsonData = try! Data.init(contentsOf: fileURL)
print(jsonData)

let array = try! JSONDecoder().decode([WWEpisode].self, from: jsonData)
let reencoded = try! JSONEncoder().encode(array.first!)
print(String(data: reencoded, encoding: .utf8)!)
