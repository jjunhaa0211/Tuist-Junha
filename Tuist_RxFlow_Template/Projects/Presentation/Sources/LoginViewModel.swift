//
//  LoginViewModel.swift
//  Presentation
//
//  Created by 박준하 on 2023/09/22.
//  Copyright © 2023 APP-iOS. All rights reserved.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift
import Core

public class LoginViewModel: BaseViewModel, Stepper {
    
    public struct Input {
        let loginButtonTap: Observable<Void>
    }
    
    public struct Output {
        let clickedMessage: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        let clickedMessage = input.loginButtonTap.map { _ in
            return "클릭됨"
        }
        .asDriver(onErrorJustReturn: "")
        
        return Output(clickedMessage: clickedMessage)
    }
    
    func loginButtonTapped() {
         let nextStep = AppStep.homeIsRequired
         self.steps.accept(nextStep)
     }
}
