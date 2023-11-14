import Foundation
import Presentation
import Core

public class ModuleFactory {
    public static let shared = ModuleFactory()
    private init() { }
}

extension ModuleFactory: ModuleFactoryInterface {
    public func Viewcontroller() -> Presentation.ViewController {
        
        let greetingProvider = SimpleGreetingProvider()
        let greetingUseCase = GreetingUseCase(greetingProvider: greetingProvider)
        
        let viewController = ViewController(greetingUseCase: greetingUseCase)
        
        return viewController
    }
    
    
}
