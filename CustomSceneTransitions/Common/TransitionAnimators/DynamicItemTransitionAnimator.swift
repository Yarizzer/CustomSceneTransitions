//
//  DynamicItemTransitionAnimator.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 21.03.2023.
//

import UIKit

final class DynamicItemTransitionAnimator: NSObject {
    //MARK: - Init
    init(isPresenting: Bool, cellRect: CGRect, data: DynamicItemContentViewData) {
        self.isPresenting = isPresenting
        self.cellRect = cellRect
        self.data = data
    }
    
    private func runTransition(using context: UIViewControllerContextTransitioning) {
        let containerView = context.containerView
        guard let presentedVC = context.viewController(forKey: .to), let presentedView = context.view(forKey: .to) else {
            context.completeTransition(false)
            
            return
        }
        
        let finalFrame = context.finalFrame(for: presentedVC)
        
        let dynamicCellView = DynamicItemContentView(frame: cellRect)
        dynamicCellView.setup(with: data)
        
        containerView.addSubview(dynamicCellView)
        
        dynamicCellView.layoutIfNeeded()
        UIView.animate(withDuration: Constants.animationDuration, animations: {
            dynamicCellView.layoutIfNeeded()
            dynamicCellView.frame.size.width = AppCore.shared.deviceLayer.screenSize.width / 2
            dynamicCellView.frame.size.height = AppCore.shared.deviceLayer.screenSize.height / 2
//            presentedView.transform = CGAffineTransform(scaleX: 1, y: 1)
//            presentedView.frame = finalFrame
            
            //dynamicCellView.transform = CGAffineTransform(scaleX: 1, y: 1)
            //dynamicCellView.frame = finalFrame
            dynamicCellView.center = presentedView.center
            
//            presentedView.alpha = 1
//            dynamicCellView.alpha = 1
            dynamicCellView.layoutIfNeeded()
        }) { finished in
            dynamicCellView.removeFromSuperview()
            context.completeTransition(finished)
        }
    }
    
    private let isPresenting: Bool
    private let cellRect: CGRect
    private let data: DynamicItemContentViewData
}

extension DynamicItemTransitionAnimator: UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        runTransition(using: transitionContext)
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Constants.animationDuration
    }
}

extension DynamicItemTransitionAnimator {
    private struct Constants {
        static let animationDuration: Double = 10
    }
}
