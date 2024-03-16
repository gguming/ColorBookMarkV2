//
//  Coordinator.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/16/24.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}


