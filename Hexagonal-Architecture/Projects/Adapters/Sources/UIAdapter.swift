//
//  UIAdapter.swift
//  Adapters
//
//  Created by 박준하 on 2023/09/21.
//  Copyright © 2023 Hexagonal-iOS. All rights reserved.
//

import UIKit
import RxSwift
import Core

public class UIAdapter: GreetingProvider {
    public func getGreeting() -> Observable<Greeting> {
        return Observable.just(Greeting(message: "안녕하세요"))
    }
}
