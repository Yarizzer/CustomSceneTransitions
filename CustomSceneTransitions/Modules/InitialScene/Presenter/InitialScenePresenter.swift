//
//  InitialScenePresenter.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class InitialScenePresenter {
	init(for view: InitialSceneViewControllerType, service: InitialScenePresenterServiceType) {
		self.viewController = view
		self.service = service
	}
	
	private var viewController: InitialSceneViewControllerType?
	private var service: InitialScenePresenterServiceType
}

extension InitialScenePresenter: InitialScenePresentable {
	func response(responseType: InitialScenePresenterResponse.InitialSceneResponseType) {
		let model = service.model
        
        switch responseType {
		case .initialSetup:     viewController?.update(viewModelDataType: .initialSetup(with: model))
        case .setupProvider:    viewController?.update(viewModelDataType: .setupProvider(with: model))
		case .releaseView:      viewController = nil
		}
	}
}
