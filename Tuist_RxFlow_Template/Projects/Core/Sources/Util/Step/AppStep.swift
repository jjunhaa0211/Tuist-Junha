//
//  AppStep.swift
//  APPNavigator
//
//  Created by 박준하 on 2023/09/22.
//  Copyright © 2023 APP-iOS. All rights reserved.
//

import RxFlow
import UIKit

public enum AppStep: Step {
    case loginIsRequired
    case homeIsRequired
}
