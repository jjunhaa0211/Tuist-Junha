//
//  Dependency+Project.swift
//  MyPlugin
//
//  Created by 박준하 on 2023/04/17.
//

import ProjectDescription

public extension TargetDependency {
    struct Project {}
}

public extension TargetDependency.Project {
    static let Core = TargetDependency.project(target: "Core", path: .relativeToRoot("Projects/Core"))
    static let Adapters = TargetDependency.project(target: "Adapters", path: .relativeToRoot("Projects/Adapters"))
    static let Presentation = TargetDependency.project(target: "Presentation", path: .relativeToRoot("Projects/Presentation"))
    static let ThirdPartyLib = TargetDependency.project(target: "ThirdPartyLib", path: .relativeToRoot("Projects/ThirdPartyLib"))
    static let ApplicationService = TargetDependency.project(target: "ApplicationService", path: .relativeToRoot("Projects/ApplicationService"))
}
