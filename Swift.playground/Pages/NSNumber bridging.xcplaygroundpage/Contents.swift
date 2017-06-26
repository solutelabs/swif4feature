//: [What' new](What'%20new) • [MutableCollection.swapAt method](@previous)

/*:
 # NSNumber bridging
 Swift 4 fixes some dangerous behavior when bridging between native Swift number types and NSNumber.
*/
import Foundation

let n = NSNumber(value: UInt32(543))
let v = n as? Int8 // nil in Swift 4. This would be 31 in Swift 3 
//: [Composing classes and protocols](@next)
