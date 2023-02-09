//
//  InitialSceneInteractor.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class InitialSceneInteractor {
	init(withRouter router: InitialSceneRoutable, presenter: InitialScenePresentable, service: InitialSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
        self.service = service
	}

	private var router: InitialSceneRoutable
	private var presenter: InitialScenePresentable
    private var service: InitialSceneInteractorServiceType
}

extension InitialSceneInteractor: InitialSceneInteractable {
	func makeRequest(requestType: InitialSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup: presenter.response(responseType: .initialSetup)
        case .routeToSecondScene(let index): router.routeTo(scene: .secondScene(withData: service.getData(for: index)))
		}
	}
}
