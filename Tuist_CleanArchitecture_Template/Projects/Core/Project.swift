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
    name: "Core",
    product: .staticFramework,
    dependencies: [
        .Project.ThirdPartyLib
    ]
)
