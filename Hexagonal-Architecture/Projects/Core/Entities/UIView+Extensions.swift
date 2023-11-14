import Foundation
import UIKit

public extension UIView {
    func addSubviews(_ viewsToAdd: [UIView]) {
        viewsToAdd.forEach({addSubview($0)})
    }
}
