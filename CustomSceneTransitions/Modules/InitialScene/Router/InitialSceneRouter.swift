//
//  InitialSceneRouter.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol InitialSceneRoutable: AnyObject {
	static func assembly() -> UIViewController
	func routeTo(scene type: InitialSceneRoutableContractData.InitialSceneRoutableSceneType)
}

class InitialSceneRouter {
	private func prepareDestinationScene(with type: InitialSceneRoutableContractData.InitialSceneRoutableSceneType) -> UIViewController {
		switch type {
        case .secondScene(let data): return SecondSceneRouter.assembly(with: data)
		}
	}
	
	private weak var view: InitialSceneViewController?
}

extension InitialSceneRouter: InitialSceneRoutable {
	static func assembly() -> UIViewController {
		let router = InitialSceneRouter()
		let vc                  = InitialSceneViewController(nibName: String(describing: InitialSceneViewController.self), bundle: Bundle.main)
		let viewModel           = InitialSceneViewModel()
		let presenterService    = InitialScenePresenterService(withModel: viewModel)
		let presenter           = InitialScenePresenter(for: vc, service: presenterService)
        let interactorService   = InitialSceneInteractorService(withModel: viewModel)
		let interactor          = InitialSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
		
		router.view = vc
		
		router.view?.interactor = interactor
		
		guard let view = router.view else {
			fatalError("cannot instantiate \(String(describing: InitialSceneViewController.self))")
		}
		
		return view
	}
	
	func routeTo(scene type: InitialSceneRoutableContractData.InitialSceneRoutableSceneType) {
		let vc = prepareDestinationScene(with: type)
		vc.modalPresentationStyle = .currentContext
		vc.transitioningDelegate = view
		self.view?.present(vc, animated: true)
	}
}
