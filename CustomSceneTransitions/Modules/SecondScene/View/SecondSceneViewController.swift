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
	
	private func setup() {
        topPaddingConstraint.constant = (AppCore.shared.deviceLayer.hasTopNotch ? Constants.topConstraintValueWithNotch : Constants.topConstraintValueWithoutNotch)
        
		interactor?.makeRequest(requestType: .initialSetup)
	}
    
    @IBAction private func backButtonAction(_ sender: UIButton) {
        interactor?.makeRequest(requestType: .routeBack)
    }
    
    @IBOutlet private weak var topPaddingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var sceneTitle: UILabel!
}

extension SecondSceneViewController: SecondSceneViewControllerType {
	func update(viewModelDataType: SecondSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
            self.sceneTitle.text = model.sceneTitle
		}
	}
}

extension SecondSceneViewController {
	private struct Constants {
        static let topConstraintValueWithNotch: CGFloat = 44
        static let topConstraintValueWithoutNotch: CGFloat = 24
	}
}
