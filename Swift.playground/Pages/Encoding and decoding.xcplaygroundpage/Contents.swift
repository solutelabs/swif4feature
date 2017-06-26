//: [What' new](What'%20new) • [Private declarations visible in same file extension](@previous)
/*:
 # Encoding and Decoding
 Types can now make themselves (un-)archivable by conforming to the Codable protocol.
 Once you have a Codable value, you need to pass it to an encoder in order to archive it. Swift will also come with a built-in set of encoders and decoders for JSON (JSONEncoder and JSONDecoder) and property lists (PropertyListEncoder and PropertyListDecoder).
 */

struct Movie: Codable {
    enum MovieGenre: String, Codable {
        case horror, fiction, comedy, adventure, animation
    }
    
    var name : String
    var moviesGenre : [MovieGenre]
    var rating : Int
}

let aMovie = Movie(name: "Up", moviesGenre: [.comedy , .adventure, .animation], rating : 4)



// Encode data
import Foundation

let jsonEncoder = JSONEncoder()
jsonEncoder.outputFormatting = .prettyPrinted
let jsonData =  try jsonEncoder.encode(aMovie)
let jsonString = String(data: jsonData, encoding: .utf8)
print("JSON String : " + jsonString!)



// Decode data to object
let jsonDecoder = JSONDecoder()
let bMovie =  try jsonDecoder.decode(Movie.self, from: jsonData)
print("Name : \(aMovie.name)")
print("Rating : \(aMovie.rating)")

/*:
### Custom keys for JSON Encoding
 */

struct Address : Codable {
    
    var street: String
    var zip: String
    var city: String
    var state: String
    
    private enum CodingKeys : String, CodingKey {
        case street, zip = "zip_code", city, state
    }
    
}
let address = Address(street: "Apple Bay Street", zip: "94608",
                      city: "Emeryville", state: "California")


// Encoding
if let encoded = try? JSONEncoder().encode(address),
    let json = String(data: encoded, encoding: .utf8) {
    
    print(json)
}

// Decoding
let jsonStr = """
{"state":"California", "street":"Apple Bay Street", "zip": "9468", "city":"Emeryville"}
"""
let jSONData = jsonStr.data(using: .utf8)!
do {
    let decode = try JSONDecoder().decode(Address.self, from: jSONData)
    print("Decoded data: \(decode)")
} catch(let e) {
    print(e)
}
//: [Associated type constraints](@next)
