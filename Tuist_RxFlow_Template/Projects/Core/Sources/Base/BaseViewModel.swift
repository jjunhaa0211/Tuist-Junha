//
//  BaseViewModel.swift
//  Core
//
//  Created by 박준하 on 2023/09/22.
//  Copyright © 2023 APP-iOS. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

open class BaseViewModel {
    public var disposeBag = DisposeBag()
    public var steps = PublishRelay<Step>()
    
    public init() {
      }
}
