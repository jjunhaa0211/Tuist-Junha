import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "APPLogger",
    product: .staticFramework,
    dependencies: [
        .Project.ThridPartyLib
    ]
)
