//
//  InitialSceneViewModel.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialSceneViewModelType {
    var sceneTitle: String { get }
    
    func getCellViewModel(for index: Int) -> InitialSceneTableViewCellViewModelType
    func getType(with index: Int) -> SceneTransitionType
    func getData(for index: Int) -> SceneTransitionData
}

class InitialSceneViewModel {
    init() {
        self.types = [SceneTransitionData(with: Constants.blurData),
                      SceneTransitionData(with: Constants.circleData),
                      SceneTransitionData(with: Constants.cardData),
                      SceneTransitionData(with: Constants.dynamicItemData)]
    }
    
    private var types: [SceneTransitionData]
}

extension InitialSceneViewModel: InitialSceneViewModelType {
    var sceneTitle: String { return Constants.sceneTitle }
    
    func getCellViewModel(for index: Int) -> InitialSceneTableViewCellViewModelType { InitialSceneTableViewCellViewModel(with: types[index]) }
    func getType(with index: Int) -> SceneTransitionType { types[index].type }
    func getData(for index: Int) -> SceneTransitionData { types[index] }
}

extension InitialSceneViewModel: TableViewProviderViewModel {
    var numberOfTableSections: Int { Constants.sectionsCount }
    
    func numberOfTableRowsInSection(_ section: Int) -> Int { types.count }
    func heightForRow(atIndex index: Int) -> Float { Constants.defaultCellHeight }
}

extension InitialSceneViewModel {
    private struct Constants {
        static let sceneTitle = "Initial scene"
        static let blurData = (title: "Blur", description: "Blur type", type: SceneTransitionType.blur)
        static let circleData = (title: "Circle", description: "Circle type", type: SceneTransitionType.circle)
        static let cardData = (title: "Card", description: "Card type", type: SceneTransitionType.card)
        static let dynamicItemData = (title: "Dynamic item", description: "Dynamic item type", type: SceneTransitionType.dynamicItem)
        static let sectionsCount = 1
        static let defaultCellHeight: Float = 80.0
    }
}
