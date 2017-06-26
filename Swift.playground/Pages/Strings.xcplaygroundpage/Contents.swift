//: [What' new](What'%20new) • [One-sided ranges](@previous)
/*:
 
 ## Strings
 
 ### Multi-line string literals
 
 
 [SE-0168]: https://github.com/apple/swift-evolution/blob/master/proposals/0168-multi-line-string-literals.md "Swift Evolution Proposal SE-0168: Multi-Line String Literals"
 */
let multilineString = """
    This is a multi-line string.
    You don't have to escape "quotes" in here.
        The position of the closing delimiter
    controls whitespace stripping.
    """
print(multilineString)


/*:
 
 ### String is a `Collection` again
 
 
 
 */
let greeting = "Hello, 😜!"
// No need to drill down to .characters
greeting.count
greeting.forEach {
    print($0)
}

/*:
 ### `Substring` is the new type for string slices
 
 */

let comma = greeting.index(of: ",")!
let substring = greeting[..<comma]
type(of: substring)
// String API can be called on Substring
print(substring.uppercased())

/*:
 ### `Character.unicodeScalars` property
 
 You can now access the code points of a `Character` directly without having to convert it to a `String` first ([SE-0178][SE-0178]):
 
 [SE-0178]: https://github.com/apple/swift-evolution/blob/master/proposals/0178-character-unicode-view.md "Swift Evolution Proposal SE-0178: Add `unicodeScalars` property to `Character`"
 */
let c: Character = "🇪🇺"
Array(c.unicodeScalars)

//: [Private declarations visible in same file extension](@next)
