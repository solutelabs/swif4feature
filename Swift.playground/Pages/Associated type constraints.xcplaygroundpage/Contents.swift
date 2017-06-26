//: [What' new](What'%20new) • [Encoding and decoding](@previous)
/*:
 # Associated type constraints
### `Sequence.Element`

`Sequence` now has its own `Element` associated type. Anywhere you had to write `Iterator.Element` in Swift 3, you can now just write `Element`:
*/
extension Sequence where Element: Numeric {
    var sum: Element {
        var result: Element = 0
        for element in self {
            result += element
        }
        return result
    }
}

[1,2,3,4].sum

//: [Dictionary and Set enhancements](@next)
