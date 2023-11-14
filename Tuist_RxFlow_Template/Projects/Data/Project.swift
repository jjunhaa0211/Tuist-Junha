import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Data",
    product: .staticFramework,
    dependencies: [
        .Project.APPNetwork,
        .Project.Domain
    ],
    hasTest: true
)
