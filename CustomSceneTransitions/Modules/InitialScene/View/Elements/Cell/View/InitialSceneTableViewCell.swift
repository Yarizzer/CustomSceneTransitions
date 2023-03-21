//
//  InitialSceneTableViewCell.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 09.02.2023.
//

import UIKit

class InitialSceneTableViewCell: UITableViewCell {
    func setup(with model: InitialSceneTableViewCellViewModelType) {
        self.model = model
        
        dynamicContent.setup(with: model.dynamicItemModel)
        
        setupView()
    }
    
    private func setupView() {
        #warning("setting up view here")
    }
    
    private var model: InitialSceneTableViewCellViewModelType?
    
    @IBOutlet private weak var dynamicContent: DynamicItemContentView!
}

extension InitialSceneTableViewCell: NibLoadableView {}
