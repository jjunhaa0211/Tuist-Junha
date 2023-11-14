//
//  GreetingUseCase.swift
//  ApplicationService
//
//  Created by 박준하 on 2023/09/21.
//  Copyright © 2023 Hexagonal-iOS. All rights reserved.
//

import RxSwift
import Core

public class GreetingUseCase {
    private let greetingProvider: GreetingProvider
    
    public init(greetingProvider: GreetingProvider) {
        self.greetingProvider = greetingProvider
    }
    
    public func getGreeting() -> Observable<Greeting> {
        return greetingProvider.getGreeting()
    }
}
