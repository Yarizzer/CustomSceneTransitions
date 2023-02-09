//
//  InitialSceneInteractorService.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialSceneInteractorServiceType{
	
}

class InitialSceneInteractorService {
	init(withModel model: InitialSceneViewModelType) {
		self.model = model
	}
	
	private var model: InitialSceneViewModelType
}

extension InitialSceneInteractorService: InitialSceneInteractorServiceType {
	
}
