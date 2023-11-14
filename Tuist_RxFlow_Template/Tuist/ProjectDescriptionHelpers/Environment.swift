import ProjectDescription

public enum Environment {
    public static let appBundleId = "com.APP.Release"
    public static let organizationName = "APP-iOS"
    public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "15.0", devices: [.iphone])
}
