//
//  AppStepper.swift
//  APPNavigator
//
//  Created by 박준하 on 2023/09/22.
//  Copyright © 2023 APP-iOS. All rights reserved.
//

import Foundation
import RxFlow
import RxCocoa
import Core
import RxSwift

public class AppStepper: Stepper {

    public let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    public init() {
    }

    public var initialStep: Step {
        return AppStep.loginIsRequired
    }
}
