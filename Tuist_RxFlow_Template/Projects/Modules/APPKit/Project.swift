import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "APPKit",
    product: .staticFramework,
    dependencies: [
        .Project.Core
    ],
    resources: ["Resources/**"],
    hasTest: true
)
