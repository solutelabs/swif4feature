//: [What' new](What'%20new) • [Strings](@previous)
/*:
 ## Private declarations visible in same-file extensions
*/
struct Date {
    private let secondsSinceReferenceDate: Double
}

extension Date: Equatable {
    static func ==(lhs: Date, rhs: Date) -> Bool {
        return lhs.secondsSinceReferenceDate == rhs.secondsSinceReferenceDate
    }
}

extension Date: Comparable {
    static func <(lhs: Date, rhs: Date) -> Bool {
        return lhs.secondsSinceReferenceDate < rhs.secondsSinceReferenceDate
    }
}
//: [Encoding and decoding](@next)
