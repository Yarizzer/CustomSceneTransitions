//
//  DynamicItemContentViewModelContract.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 21.03.2023.
//

enum DynamicItemContentViewType {
    case regular
}

struct DynamicItemContentViewData {
    init(with demands: (title: String?, description: String?), for type: DynamicItemContentViewType) {
        self.type = type
        
        switch type {
        case .regular:
            self.title          = demands.title
            self.description    = demands.description
        }
    }
    
    var type: DynamicItemContentViewType
    var title: String?
    var description: String?
}
