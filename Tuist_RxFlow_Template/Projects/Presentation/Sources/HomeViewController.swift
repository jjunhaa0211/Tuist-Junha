//
//  HomeViewController.swift
//  Presentation
//
//  Created by 박준하 on 2023/09/22.
//  Copyright © 2023 APP-iOS. All rights reserved.
//

import UIKit
import SnapKit
import RxFlow
import RxCocoa
import RxSwift
import Core

public class HomeViewController: UIViewController, Stepper {

    public var steps = PublishRelay<Step>()
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(logoutButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.view.backgroundColor = .systemBackground

        self.view.addSubview(self.button)
        
        self.button.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
    
    @objc
    func logoutButtonDidTap() {
        self.steps.accept(AppStep.loginIsRequired)
    }
}
