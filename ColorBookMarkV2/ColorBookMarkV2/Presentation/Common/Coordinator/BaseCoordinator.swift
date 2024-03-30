//
//  BaseCoordinator.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/30/24.
//

import UIKit
import RxSwift

class BaseCoordinator: NSObject, Coordinator {

  let disposeBag = DisposeBag()

  var childCoordinators: [any Coordinator] = []
  var navigationController: UINavigationController
  var parentCoordinator: Coordinator?

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    fatalError("start() method must be implemented")
  }
}
