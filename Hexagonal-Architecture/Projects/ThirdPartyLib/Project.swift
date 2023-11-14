import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "ThirdPartyLib",
    platform: .iOS,
    product: .framework,
    dependencies: [
        .SPM.RxCocoa,
        .SPM.RxSwift,
        .SPM.SnapKit,
        .SPM.Then
    ]
)
