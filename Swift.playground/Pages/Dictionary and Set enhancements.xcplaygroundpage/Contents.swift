//: [What' new](What'%20new) • [Associated type constraints](@previous)
/*:
## `Dictionary` and `Set` enhancements
### Sequence-based initializer
 Converting an array to an indexed dictionary.*/


let names = ["Cagney", "Lacey", "Bensen"]
let dict = Dictionary(uniqueKeysWithValues: zip(0..., names))
dict[1]


/*:
### Merging initializer and `merge` method
Specify how duplicate keys should be handled when creating a dictionary from a sequence or merging a sequence into an existing dictionary. */


let duplicates = [("a", 1), ("b", 2), ("a", 3), ("b", 4)]
let letters = Dictionary(duplicates, uniquingKeysWith: { (first, _) in first })
letters
let letterDict2 = Dictionary(duplicates, uniquingKeysWith: min)
//the largest value for any duplicate keys

/*:
 ### Subscript with default value
 
 You can provide a default value that will be returned for missing keys as a subscript argument, making the return type non-optional.
 
 This is especially useful when you want to mutate a value through the subscript:
 */
let source = "how now brown cow"
var frequencies: [Character: Int] = [:]
for char in source {
    frequencies[char, default: 0] += 1
}
frequencies
let x = frequencies["a", default: 0]
let y = frequencies["a"] ?? 0
/*:
 ### Dictionary-specific `map` and `filter`
 
 `filter` returns a `Dictionary` and not an `Array`. Similarly, the new `mapValues` method transforms the values while preserving the dictionary structure.
 */
let filtered = dict.filter {
    $0.key % 2 == 0
}
type(of: filtered)

let mapped = dict.mapValues { value in
    value.uppercased()
}
mapped

/*:
 `Set.filter` also returns a `Set` now and not an `Array`.
 */
let set: Set = [1,2,3,4,5]
let filteredSet = set.filter { $0 % 2 == 0 }
type(of: filteredSet)

/*:
 ### Grouping a sequence
 
 Group a sequence of values into buckets, e.g. partition words in a word list by their initial letter. This is one of my favorites.
 */
let contacts = ["Julia", "Susan", "John", "Alice", "Alex"]
let grouped = Dictionary(grouping: contacts, by: { $0.first! })
grouped


//: [MutableCollection.swapAt method](@next)
