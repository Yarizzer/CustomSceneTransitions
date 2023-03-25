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
        guard let destinationVC = context.viewController(forKey: .to), let destinationView = context.view(forKey: .to) else {
            context.completeTransition(false)
            
            return
        }
        
        destinationView.isHidden = true
        destinationView.frame = context.finalFrame(for: destinationVC)
        
        let dynamicCellView = DynamicItemContentView(frame: cellRect)
        dynamicCellView.setup(with: data)
        
        containerView.addSubview(dynamicCellView)
        containerView.addSubview(destinationView)
        
        dynamicCellView.layoutIfNeeded()
        UIView.animate(withDuration: Constants.animationDuration / 3, animations: {
            dynamicCellView.center.x = AppCore.shared.deviceLayer.screenSize.midX
            dynamicCellView.center.y = AppCore.shared.deviceLayer.screenSize.height / 3
            
            dynamicCellView.frame.size.width = AppCore.shared.deviceLayer.screenSize.midX
//
//            dynamicCellView.frame.size.width = AppCore.shared.deviceLayer.screenSize.midX
//            dynamicCellView.frame.size.height = AppCore.shared.deviceLayer.screenSize.midY
//            presentedView.transform = CGAffineTransform(scaleX: 1, y: 1)
//            presentedView.frame = finalFrame
            
            //dynamicCellView.transform = CGAffineTransform(scaleX: 1, y: 1)
            //dynamicCellView.frame = finalFrame
            
//            presentedView.alpha = 1
//            dynamicCellView.alpha = 1
            dynamicCellView.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: Constants.animationDuration / 3, delay: 0, animations: {
                dynamicCellView.frame.size.height = AppCore.shared.deviceLayer.screenSize.midY
                dynamicCellView.center.y = AppCore.shared.deviceLayer.screenSize.midY
                
                dynamicCellView.layoutIfNeeded()
            }) { finished in
//                dynamicCellView.prepareForAppear() {
//
//                }
                
                dynamicCellView.removeFromSuperview()
                
                destinationView.isHidden = false
                
                context.completeTransition(finished)
            }
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
        Constants.animationDuration
    }
}

extension DynamicItemTransitionAnimator {
    private struct Constants {
        static let animationDuration: Double = 10
    }
}
