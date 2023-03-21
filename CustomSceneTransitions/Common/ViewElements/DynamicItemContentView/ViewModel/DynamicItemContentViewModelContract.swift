//
//  DynamicItemContentViewModelContract.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 21.03.2023.
//

enum DynamicItemContetntViewType {
    case regular
}

struct DynamicItemContentViewData {
    init(with demands: (title: String?, description: String?), for type: DynamicItemContetntViewType) {
        self.type = type
        
        switch type {
        case .regular:
            self.title          = demands.title
            self.description    = demands.description
        }
    }
    
    var type: DynamicItemContetntViewType
    var title: String?
    var description: String?
}
