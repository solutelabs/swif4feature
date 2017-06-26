/*:
 [What' new](@previous)
 # One Sided Ranges
 Swift 4 introduces ranges where either the lower or upper bound is unspecified.
 */

let letters = ["a","b","c","d"]
let numberedLetters = zip(1..., letters)

/*:
 Construct an infinite sequence

 The collectionʼs startIndex or endIndex “fills in” the missing lower or upper bound, respectively.
 */

let numbers = [1,2,3,4,5,6,7,8,9,10]
numbers[5...] // instead of numbers[5..<numbers.endIndex]
numbers[...4]
/*
 One-sided ranges can be used in pattern matching constructs, e.g. in a case expression in a switch statement.
 */
let value = 0
switch value {
case 1...:
    print("greater than zero")
case 0:
    print("zero")
case ..<0:
    print("less than zero")
        default:
        fatalError("unreachable")
}
//: [Strings](@next)
