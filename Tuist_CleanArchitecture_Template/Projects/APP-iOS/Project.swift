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
    name: "APP-iOS",
    platform: .iOS,
    product: .app,
    dependencies: [
        .Project.Data,
        .Project.Presentation
    ],
    resources: ["Resources/**"],
    infoPlist: .extendingDefault(with: Project.baseinfoPlist)
)
