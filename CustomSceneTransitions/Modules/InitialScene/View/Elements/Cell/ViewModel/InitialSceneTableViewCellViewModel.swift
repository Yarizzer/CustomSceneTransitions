//
//  InitialSceneTableViewCellViewModel.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 09.02.2023.
//

protocol InitialSceneTableViewCellViewModelType {
    var title: String { get }
}

class InitialSceneTableViewCellViewModel {
    init(with type: SceneTransitionData) {
        self.type = type
    }
    
    private var type: SceneTransitionData
}

extension InitialSceneTableViewCellViewModel: InitialSceneTableViewCellViewModelType {
    var title: String { return type.title }
}

extension InitialSceneTableViewCellViewModel {
    private struct Constants {}
}
