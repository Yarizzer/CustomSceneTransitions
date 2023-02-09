//
//  SecondSceneRouter.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol SecondSceneRoutable {
	static func assembly() -> UIViewController
	func dismiss()
}

class SecondSceneRouter {
	private weak var view: SecondSceneViewController?
}

extension SecondSceneRouter: SecondSceneRoutable {
	static func assembly() -> UIViewController {
		let router = SecondSceneRouter()
		let vc                  = SecondSceneViewController(nibName: String(describing: SecondSceneViewController.self), bundle: Bundle.main)
		let viewModel           = SecondSceneViewModel()
		let presenterService    = SecondScenePresenterService(withModel: viewModel)
		let presenter           = SecondScenePresenter(for: vc, service: presenterService)
		let interactorService   = SecondSceneInteractorService(withModel: viewModel)
		let interactor          = SecondSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
		
		router.view = vc
		
		router.view?.interactor = interactor
		
		guard let view = router.view else {
			fatalError("cannot instantiate \(String(describing: SecondSceneViewController.self))")
		}
		
		return view
	}
	
    func dismiss() {
        self.view?.dismiss(animated: true, completion: nil)
    }
}
