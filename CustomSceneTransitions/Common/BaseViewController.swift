//
//  BaseViewController.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//

import UIKit

class BaseViewController<InteractorT>: UIViewController {
    override func viewDidLoad() { super.viewDidLoad() }
    
    var interactor: InteractorT?
}
