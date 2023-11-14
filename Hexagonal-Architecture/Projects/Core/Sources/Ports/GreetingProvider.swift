//
//  GreetingProvider.swift
//  Core
//
//  Created by 박준하 on 2023/09/21.
//

import Foundation
import UIKit
import RxSwift

public protocol GreetingProvider {
    func getGreeting() -> Observable<Greeting>
}

open class SimpleGreetingProvider: GreetingProvider {
    
    public init() {}
    
    public func getGreeting() -> Observable<Greeting> {
        let greeting = Greeting(message: "안녕하세요")
        return Observable.just(greeting)
    }
}

open class FormalGreetingProvider: GreetingProvider {
    
    public init() {}
    
    public func getGreeting() -> Observable<Greeting> {
        let greeting = Greeting(message: "안녕하십니까")
        return Observable.just(greeting)
    }
}

open class CasualGreetingProvider: GreetingProvider {
    
    public init() {}
    
    public func getGreeting() -> Observable<Greeting> {
        let greeting = Greeting(message: "안녕")
        return Observable.just(greeting)
    }
}
