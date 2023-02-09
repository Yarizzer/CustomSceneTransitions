//
//  SecondSceneViewModel.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol SecondSceneViewModelType {
    var sceneTitle: String { get }
    var typeTitle: String { get }
    var typeDescription: String { get }
    var type: SceneTransitionType { get }
}

class SecondSceneViewModel {
    init(with data: SceneTransitionData) {
        self.data = data
    }
    
    private var data: SceneTransitionData
}

extension SecondSceneViewModel: SecondSceneViewModelType {
    var sceneTitle: String { return Constants.sceneTitle }
    var typeTitle: String { return data.title }
    var typeDescription: String { data.description }
    var type: SceneTransitionType { return data.type }
}

extension SecondSceneViewModel {
    private struct Constants {
        static let sceneTitle = "Second scene"
    }
}
