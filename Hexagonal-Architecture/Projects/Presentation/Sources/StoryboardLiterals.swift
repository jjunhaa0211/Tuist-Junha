import UIKit

public enum Storyboards: String {
    case sample = "Sample"
}

extension UIStoryboard{
    static func list(_ name : Storyboards) -> UIStoryboard{
        return UIStoryboard(name: name.rawValue, bundle: nil)
    }
}

