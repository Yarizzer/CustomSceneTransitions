//
//  SecondScenePresenter.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class SecondScenePresenter {
	init(for view: SecondSceneViewControllerType, service: SecondScenePresenterServiceType) {
		self.viewController = view
		self.service = service
	}
	
	private var viewController: SecondSceneViewControllerType?
	private var service: SecondScenePresenterServiceType
}

extension SecondScenePresenter: SecondScenePresentable {
	func response(responseType: SecondScenePresenterResponse.SecondSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup: viewController?.update(viewModelDataType: .initialSetup(with: model))
		case .releaseView: viewController = nil
		}
	}
}
