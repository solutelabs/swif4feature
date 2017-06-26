//: [What' new](What'%20new) • [NSNumber bridging](@previous)
/*:
 ## Composing classes and protocols
 */
import UIKit
protocol Shakeable {
    func shake()
}
extension UIButton: Shakeable {
    func shake() {
        /* ... */
    }
}
extension UILabel: Shakeable {
    func shake() {
        /* ... */
    }
}

/*:
All UIControls are not Shakeable
 */

//func shakeIt(controls: UIControl) {
//    for control in controls where control.isEnabled {
//        control.shake() // Type 'UIControl' does not conform to protocol 'Sequence'
//    }
//}

/*:
 Shakeable is not a UIControl neccessarily
 */

//func shakeIt(controls: Shakeable) {
//    for control in controls where control.isEnabled {
//        control.shake() // Type 'Shakeable' does not conform to protocol 'Sequence'
//    }
//}

/*:
 So, Tada 🤗
 */

func shakeIt(controls: [UIControl & Shakeable]) {
    for control in controls where control.isEnabled {
        control.shake()
    }
}

//: [Smaller Binaries](@next)
