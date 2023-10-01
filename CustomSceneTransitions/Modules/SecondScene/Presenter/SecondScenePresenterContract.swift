//
//  SecondScenePresenterContract.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol SecondScenePresentable {
	func response(responseType: SecondScenePresenterResponse.SecondSceneResponseType)
}

struct SecondScenePresenterResponse {
	enum SecondSceneResponseType {
		case initialSetup
		case releaseView
	}
}
