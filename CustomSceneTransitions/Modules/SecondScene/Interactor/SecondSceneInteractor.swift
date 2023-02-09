//
//  SecondSceneInteractor.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class SecondSceneInteractor {
	init(withRouter router: SecondSceneRoutable, presenter: SecondScenePresentable) {
		self.router = router
		self.presenter = presenter
	}

	private var router: SecondSceneRoutable
	private var presenter: SecondScenePresentable
}

extension SecondSceneInteractor: SecondSceneInteractable {
	func makeRequest(requestType: SecondSceneInteractorRequest.RequestType) {
		switch requestType {
		case .initialSetup: presenter.response(responseType: .initialSetup)
        case .routeBack:
            presenter.response(responseType: .releaseView)
            router.dismiss()
		}
	}
}
