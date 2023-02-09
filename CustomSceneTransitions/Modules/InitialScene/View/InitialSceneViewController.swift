//
//  InitialSceneViewController.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class InitialSceneViewController: BaseViewController<InitialSceneInteractable> {
	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
	
	private func setup() {
		interactor?.makeRequest(requestType: .initialSetup)
	}
    
    private var selectedType: SceneTransitionType?
    private var provider: TableViewProviderType?
    
    @IBOutlet private weak var sceneTitle: UILabel!
    @IBOutlet private weak var tableView: UITableView!
}

extension InitialSceneViewController: InitialSceneViewControllerType {
	func update(viewModelDataType: InitialSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
            sceneTitle.text = model.sceneTitle
        case .setupProvider(let model):
            guard let model = model as? InitialSceneViewModel else { return }
            
            provider = TableViewProvider(for: self.tableView, with: model)
            provider?.registerCells([InitialSceneTableViewCell.self])
            provider?.onConfigureCell = { [weak self] indexPath in
                guard let provider = self?.provider else { return UITableViewCell() }
                
                let cell: InitialSceneTableViewCell = provider.dequeueReusableCell(for: indexPath)
                cell.setup(with: model.getCellViewModel(for: indexPath.row))
                
                return cell
            }
            provider?.onSelectCell = { [weak self] indexPath in
                self?.selectedType = model.getType(with: indexPath.row)
                self?.interactor?.makeRequest(requestType: .routeToSecondScene(withIndex: indexPath.row))
            }
		}
	}
}

//MARK: - UIViewControllerTransitioningDelegate
extension InitialSceneViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let selectedType = selectedType else { return  BlurTransitionAnimator()}
        
        switch selectedType {
        case .blur: return BlurTransitionAnimator()
        case .circle: return CircleShapeTransitionAnimator(isPresenting: true, transitionPoint: self.view.center)
        case .card: return CardShapeTransitionAnimator(isPresenting: true)
        }
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let selectedType = selectedType else { return  BlurTransitionAnimator()}
        
        switch selectedType {
        case .blur: return BlurTransitionAnimator()
        case .circle: return CircleShapeTransitionAnimator(isPresenting: false, transitionPoint: self.view.center)
        case .card: return CardShapeTransitionAnimator(isPresenting: false)
        }
    }
}

extension InitialSceneViewController {
	private struct Constants {}
}
