import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let RxSwift = TargetDependency.external(name: "RxSwift")
    static let RxCocoa = TargetDependency.external(name: "RxCocoa")
    static let RxRelay = TargetDependency.external(name: "RxRelay")
    static let RxTest = TargetDependency.external(name: "RxTest")
    static let RxBlocking = TargetDependency.external(name: "RxBlocking")
    static let Nimble = TargetDependency.external(name: "Nimble")
    static let Quick = TargetDependency.external(name: "Quick")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
    static let RxFlow = TargetDependency.external(name: "RxFlow")
}
