import UIKit

public extension UILabel {
    @discardableResult
    func setTypoStyle(_ typo: UIFont, _ spacing: CGFloat = -1) -> Self {
        self.font = typo
//        self.setCharacterSpacing(spacing)
        return self
    }
}

public extension UITextView {
    @discardableResult
    func setTypoStyle(_ typo: UIFont, _ spacing: CGFloat = -1) -> Self {
        self.font = typo
//        self.setCharacterSpacing(spacing)
        return self
    }
}
