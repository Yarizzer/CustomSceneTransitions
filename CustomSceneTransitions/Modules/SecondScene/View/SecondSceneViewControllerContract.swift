//
//  SecondSceneViewControllerContract.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol SecondSceneViewControllerType {
	func update(viewModelDataType: SecondSceneViewControllerViewModel.ViewModelDataType)
}

struct SecondSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: SecondSceneViewModelType)
	}
}
