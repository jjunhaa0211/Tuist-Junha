import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "ApplicationService",
    platform: .iOS,
    product: .staticFramework,
    dependencies: [
        .Project.Core
    ]
)
