//
//  SecondScenePresenterService.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol SecondScenePresenterServiceType{
	var model: SecondSceneViewModelType { get }
}

class SecondScenePresenterService {
	init(withModel model: SecondSceneViewModelType) {
		self.viewModel = model
	}
	
	private var viewModel: SecondSceneViewModelType
}

extension SecondScenePresenterService: SecondScenePresenterServiceType {
	var model: SecondSceneViewModelType { return viewModel }
}
