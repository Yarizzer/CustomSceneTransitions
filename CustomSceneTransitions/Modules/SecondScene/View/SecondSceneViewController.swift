//
//  SecondSceneViewController.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class SecondSceneViewController: BaseViewController<SecondSceneInteractable> {
	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        backButton.appear()
    }
	
	private func setup() {
        topPaddingConstraint.constant = (AppCore.shared.deviceLayer.hasTopNotch ? Constants.topConstraintValueWithNotch : Constants.topConstraintValueWithoutNotch)
        
		interactor?.makeRequest(requestType: .initialSetup)
	}
    
    @IBAction private func backButtonAction(_ sender: BackButton) {
        interactor?.makeRequest(requestType: .routeBack)
    }
    
    @IBOutlet private weak var topPaddingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var backButton: BackButton!
    @IBOutlet private weak var sceneTitle: UILabel!
    @IBOutlet private weak var typeTitle: UILabel!
    @IBOutlet private weak var typeDescription: UILabel!
}

extension SecondSceneViewController: SecondSceneViewControllerType {
	func update(viewModelDataType: SecondSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
            self.sceneTitle.text = model.sceneTitle
            self.typeTitle.text = model.typeTitle
            self.typeDescription.text = model.typeDescription
            
            switch model.type {
            case .blur: view.backgroundColor = AppCore.shared.styleLayer.colorBlue
            case .circle: view.backgroundColor = AppCore.shared.styleLayer.colorRed
            case .card: view.backgroundColor = AppCore.shared.styleLayer.colorGreen
            case .dynamicItem: view.backgroundColor = AppCore.shared.styleLayer.colorSoftPurple
            }
		}
	}
}

extension SecondSceneViewController {
	private struct Constants {
        static let topConstraintValueWithNotch: CGFloat = 44
        static let topConstraintValueWithoutNotch: CGFloat = 24
	}
}
