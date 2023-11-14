//
//  MockMyPageRepository.swift
//  DomainTests
//
//  Created by Junho Lee on 2022/12/13.
//  Copyright © 2022 RecorDream-iOS. All rights reserved.
//

import Foundation

import RxSwift

@testable import Domain

final class MockMyPageRepository: MyPageRepository {
    func userWithdrawal() -> Observable<Bool> {
        return Observable.just(true)
    }
    
    func enablePushNotice(time: String) -> Observable<String> {
        return Observable.just("AM 07:30")
    }
    
    func disablePushNotice() -> Observable<Void> {
        return Observable.just(())
    }
    
    func fetchUserInformation() -> Observable<MyPageEntity> {
        return Observable.just(Self.sampleFetchedData)
    }
    
    func userLogout() -> Observable<Bool> {
        return Observable.just(true)
    }
    
    func userWithdrawl() -> Observable<Bool> {
        return Observable.just(true)
    }
}

extension MockMyPageRepository {
    static let sampleFetchedData = MyPageEntity.init(userName: "샘플",
                                                     email: "이메일@naver.com",
                                                     pushOnOff: true,
                                                     pushTime: nil)
    
    static let sampleFetchedWrongData = MyPageEntity.init(userName: "샘플",
                                                     email: "이메일@naver.co",
                                                     pushOnOff: true,
                                                     pushTime: nil)
}

extension MyPageEntity: Equatable {
    public static func == (lhs: MyPageEntity, rhs: MyPageEntity) -> Bool {
        return lhs.userName == rhs.userName
        && lhs.pushOnOff == rhs.pushOnOff
        && lhs.email == rhs.email
        && lhs.pushTime == rhs.pushTime
    }
}
