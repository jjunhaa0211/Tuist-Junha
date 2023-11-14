import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "Core",
    platform: .iOS,
    product: .staticFramework,
    dependencies: [
        .Project.ThirdPartyLib
    ]
)
