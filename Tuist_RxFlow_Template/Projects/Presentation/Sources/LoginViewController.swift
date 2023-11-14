//
//  LoginViewController.swift
//  Presentation
//
//  Created by 박준하 on 2023/09/22.
//  Copyright © 2023 APP-iOS. All rights reserved.
//

import UIKit
import RxFlow
import RxCocoa
import SnapKit
import Core

public class LoginViewController: BaseViewController<LoginViewModel> {
    
    public var steps = PublishRelay<Step>()
        
    public var initialStep: Step {
        AppStep.homeIsRequired
    }
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    public override func attribute() {
        self.title = "Login"
        self.view.backgroundColor = .systemBackground
    }
    
    public override func layout() {
        self.view.addSubview(self.button)
        self.button.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
    
    @objc
    func loginButtonTapped() {
        let input = LoginViewModel.Input(loginButtonTap: self.button.rx.tap.asObservable())
        self.viewModel.transform(input: input)
        self.viewModel.loginButtonTapped()
    }
}
