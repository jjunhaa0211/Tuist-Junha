//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 박준하 on 2023/07/03.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "Data",
    product: .staticFramework,
    dependencies: [
        .Project.APPNetwork,
        .Project.Domain
    ]
)
