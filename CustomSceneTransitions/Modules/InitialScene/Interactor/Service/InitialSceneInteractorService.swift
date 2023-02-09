//
//  InitialSceneInteractorService.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 09.02.2023.
//

protocol InitialSceneInteractorServiceType{
    func getData(for index: Int) -> SceneTransitionData
}

class InitialSceneInteractorService {
    init(withModel model: InitialSceneViewModelType) {
        self.model = model
    }
    
    private var model: InitialSceneViewModelType
}

extension InitialSceneInteractorService: InitialSceneInteractorServiceType {
    func getData(for index: Int) -> SceneTransitionData {
        return model.getData(for: index)
    }
}
