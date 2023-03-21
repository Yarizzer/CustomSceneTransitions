//
//  InitialSceneViewModelContract.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 09.02.2023.
//

enum SceneTransitionType {
    case blur
    case circle
    case card
    case dynamicItem
}

struct SceneTransitionData {
    init(with data: (title: String, description: String, type: SceneTransitionType)) {
        self.title = data.title
        self.description = data.description
        self.type = data.type
    }
    
    var title: String
    var description: String
    var type: SceneTransitionType
}
