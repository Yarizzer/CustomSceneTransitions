//
//  SecondSceneInteractorContract.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol SecondSceneInteractable {
	func makeRequest(requestType: SecondSceneInteractorRequest.RequestType)
}

struct SecondSceneInteractorRequest {
	enum RequestType {
		case initialSetup
        case routeBack
	}
}
