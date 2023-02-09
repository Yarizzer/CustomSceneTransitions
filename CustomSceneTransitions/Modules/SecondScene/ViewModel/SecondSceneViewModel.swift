//
//  SecondSceneViewModel.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol SecondSceneViewModelType {
    var sceneTitle: String { get }
}

class SecondSceneViewModel: SecondSceneViewModelType {
    var sceneTitle: String { return Constants.sceneTitle }
}

extension SecondSceneViewModel {
    private struct Constants {
        static let sceneTitle = "Second scene"
    }
}
