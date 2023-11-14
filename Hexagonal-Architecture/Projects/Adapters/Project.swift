import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "Adapters",
    platform: .iOS,
    product: .staticFramework,
    dependencies: [
        .Project.Core,
        .Project.ApplicationService,
        .Project.ThirdPartyLib
    ]
)
