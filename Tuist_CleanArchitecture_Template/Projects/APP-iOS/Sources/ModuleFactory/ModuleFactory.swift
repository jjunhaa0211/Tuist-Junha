import Foundation
import Presentation

public class ModuleFactory {
    public static let shared = ModuleFactory()
    private init() { }
}

extension ModuleFactory: ModuleFactoryInterface {
    
    public func loginVC() -> Presentation.LoginViewController {
        let loginVC = LoginViewController()

        return loginVC
    }
}
