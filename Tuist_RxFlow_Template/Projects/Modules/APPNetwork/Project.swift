import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "APPNetwork",
    product: .staticFramework,
    dependencies: [
        .Project.Core
    ],
    hasTest: true
)
