//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 박준하 on 2023/07/03.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "APPKit",
    product: .staticFramework,
    dependencies: [
        .Project.Core
    ],
    resources: ["Resources/**"]
)
