//
//  SecondSceneRouter.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol SecondSceneRoutable {
    static func assembly(with data: SceneTransitionData) -> UIViewController
	func dismiss()
}

class SecondSceneRouter {
	private weak var view: SecondSceneViewController?
}

extension SecondSceneRouter: SecondSceneRoutable {
	static func assembly(with data: SceneTransitionData) -> UIViewController {
		let router = SecondSceneRouter()
		let vc                  = SecondSceneViewController(nibName: String(describing: SecondSceneViewController.self), bundle: Bundle.main)
		let viewModel           = SecondSceneViewModel(with: data)
		let presenterService    = SecondScenePresenterService(withModel: viewModel)
		let presenter           = SecondScenePresenter(for: vc, service: presenterService)
		let interactor          = SecondSceneInteractor(withRouter: router, presenter: presenter)
		
        vc.interactor = interactor
        
		router.view = vc
		
		guard let view = router.view else {
			fatalError("cannot instantiate \(String(describing: SecondSceneViewController.self))")
		}
		
		return view
	}
	
    func dismiss() {
        self.view?.dismiss(animated: true, completion: nil)
    }
}
