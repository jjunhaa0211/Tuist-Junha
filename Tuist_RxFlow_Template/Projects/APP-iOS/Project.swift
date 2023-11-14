import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "APP-iOS",
    platform: .iOS,
    product: .app,
    dependencies: [
        .Project.APPNavigator
    ],
    resources: ["Resources/**"],
    infoPlist: .extendingDefault(with: Project.baseinfoPlist)
)
