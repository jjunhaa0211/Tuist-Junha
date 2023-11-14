//
//  DataTests.swift
//  ProjectDescriptionHelpers
//
//  Created by Junho Lee on 2022/09/18.
//

import XCTest

import Nimble
import RxSwift
import RxTest

@testable import Domain

final class MyPageUseCaseTestWithNimble: XCTestCase {
    
    private var scheduler: TestScheduler!
    private var disposeBag: DisposeBag!
    private var myPageUseCase: MyPageUseCase!
    private var myPageRepository: MyPageRepository!
    
    override func setUp() {
        self.scheduler = TestScheduler(initialClock: 0)
        self.disposeBag = DisposeBag()
        self.myPageRepository = MockMyPageRepository()
        self.myPageUseCase = DefaultMyPageUseCase(repository: self.myPageRepository)
    }
    
    override func tearDownWithError() throws {
        self.myPageUseCase = nil
        self.myPageRepository = nil
        self.disposeBag = nil
    }
    
    func test_check_fetching() {
        let fetchedDataOutput = scheduler.createObserver(MyPageEntity?.self)
        
        self.scheduler.createColdObservable([
            .next(10, ())
        ])
        .withUnretained(self)
        .subscribe(onNext: { strongSelf, _ in
            strongSelf.myPageUseCase.fetchMyPageData()
        })
        .disposed(by: self.disposeBag)
        
        self.myPageUseCase.myPageFetched
            .subscribe(fetchedDataOutput)
            .disposed(by: self.disposeBag)
        
        self.scheduler.start()
        
        expect(fetchedDataOutput.events).to(
            equal([.next(10, MockMyPageRepository.sampleFetchedData)]),
            description: "failed - Repository에서 제공한 데이터와 일치하는지 테스트"
        )
    }
}
