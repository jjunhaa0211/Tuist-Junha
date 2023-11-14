import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "APPNavigator",
    product: .staticFramework,
    dependencies: [
        .Project.Presentation,
        .Project.Data
    ]
)
