import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "Presentation",
    platform: .iOS,
    product: .staticFramework,
    dependencies: [
        .Project.Core,
        .Project.ApplicationService
    ]
)
