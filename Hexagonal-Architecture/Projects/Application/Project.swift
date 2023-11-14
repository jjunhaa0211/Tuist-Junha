import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "Hexagonal-iOS",
    platform: .iOS,
    product: .app,
    dependencies: [
        .Project.Core,
        .Project.ApplicationService,
        .Project.Presentation
    ],
    resources: ["Resources/**"],
    infoPlist: .extendingDefault(with: Project.baseinfoPlist)
)
