//
//  BlurTransitionAnimator.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 09.02.2023.
//

import UIKit

class BlurTransitionAnimator: NSObject {
    private func runTransitioning(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let currentView = transitionContext.view(forKey: .from), let presentedView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            
            return
        }
        
        let blurEffectView = prepareBlurView()
        
        presentedView.frame = AppCore.shared.deviceLayer.screenSize
        presentedView.alpha = Constants.minAlphaValue
        
        blurEffectView.frame = AppCore.shared.deviceLayer.screenSize
        blurEffectView.alpha = Constants.minAlphaValue
        
        containerView.addSubview(presentedView)
        containerView.addSubview(blurEffectView)
        
        UIView.animate(withDuration: Constants.animationDuration / 3, delay: 0, options: [.curveEaseInOut],  animations: {
            blurEffectView.alpha = Constants.maxAlphaValue
        }) { _ in
            UIView.animate(withDuration: Constants.animationDuration / 3, delay: 0, options: [.curveEaseInOut], animations: {
                currentView.alpha = Constants.minAlphaValue
                presentedView.alpha = Constants.maxAlphaValue

            }) { _ in
                UIView.animate(withDuration: Constants.animationDuration / 3, delay: 0, options: [.curveEaseInOut], animations: {
                    blurEffectView.alpha = Constants.minAlphaValue
                    
                }) { finished in
                    blurEffectView.removeFromSuperview()
                    transitionContext.completeTransition(finished)
                }
            }
        }
    }
    
    private func prepareBlurView() -> UIVisualEffectView {
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurEffectView.alpha = Constants.minAlphaValue
        
        return blurEffectView
    }
}

extension BlurTransitionAnimator: UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        runTransitioning(using: transitionContext)
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        Constants.animationDuration
    }
}

extension BlurTransitionAnimator {
    private struct Constants {
        static let minAlphaValue: CGFloat = 0.0
        static let maxAlphaValue: CGFloat = 1.0
        
        static let animationDuration: Double = 1.5
    }
}
