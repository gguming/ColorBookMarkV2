//
//  BaseViewController.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/30/24.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    var disposeBag: DisposeBag = DisposeBag()
    
    weak var coordinator: Coordinator?
}
