//
//  InitialScenePresenterService.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialScenePresenterServiceType{
	var model: InitialSceneViewModelType { get }
}

class InitialScenePresenterService {
	init(withModel model: InitialSceneViewModelType) {
		self.viewModel = model
	}
	
	private var viewModel: InitialSceneViewModelType
}

extension InitialScenePresenterService: InitialScenePresenterServiceType {
	var model: InitialSceneViewModelType { viewModel }
}
