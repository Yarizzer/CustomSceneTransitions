//
//  InitialSceneTableViewCellViewModel.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 09.02.2023.
//

protocol InitialSceneTableViewCellViewModelType {
    var title: String { get }
    var description: String { get }
    
    var dynamicItemModel: DynamicItemContentViewData { get }
}

class InitialSceneTableViewCellViewModel {
    init(with type: SceneTransitionData) {
        self.type = type
    }
    
    private var type: SceneTransitionData
}

extension InitialSceneTableViewCellViewModel: InitialSceneTableViewCellViewModelType {
    var title: String { return type.title }
    var description: String { return type.description }
    
    var dynamicItemModel: DynamicItemContentViewData {
        return DynamicItemContentViewData(with: (title: type.title, description: type.description),
                                          for: .regular)
    }
}

extension InitialSceneTableViewCellViewModel {
    private struct Constants {}
}
