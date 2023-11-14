//
//  AppFlow.swift
//  APPNavigator
//
//  Created by 박준하 on 2023/09/22.
//  Copyright © 2023 APP-iOS. All rights reserved.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift
import Core
import UIKit

public class AppFlow: Flow {
    
    var window: UIWindow
    
    public var root: Presentable {
        return self.window
    }
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .loginIsRequired:
            return self.navigateToLogin()
        case .homeIsRequired:
            return self.navigateToHome()
        }
    }
    
    private func navigateToLogin() -> FlowContributors {
        let loginFlow = LoginFlow()
        Flows.use(loginFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: loginFlow, withNextStepper: OneStepper(withSingleStep: AppStep.loginIsRequired)))
    }
    
    private func navigateToHome() -> FlowContributors {
        let homeFlow = HomeFlow()
        Flows.use(homeFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: homeFlow, withNextStepper: OneStepper(withSingleStep: AppStep.homeIsRequired)))
    }
}
