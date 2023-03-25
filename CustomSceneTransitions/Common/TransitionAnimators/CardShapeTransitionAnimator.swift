//
//  CardShapeTransitionAnimator.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 09.02.2023.
//

import UIKit

class CardShapeTransitionAnimator: NSObject {
    //MARK: - Init
    init(isPresenting: Bool) {
        self.presentingMode = isPresenting
    }
    
    private func present(with context: UIViewControllerContextTransitioning) {
        let containerView = context.containerView
        
        guard let currentView = context.view(forKey: .from), let destinationVC = context.viewController(forKey: .to), let destinationView = context.view(forKey: .to) else { return }
        
        destinationView.frame = AppCore.shared.deviceLayer.screenSize
        destinationView.transform = Constants.scalingTransformMinValue
        destinationView.center.x = Constants.screenCenter.x * 3
        containerView.addSubview(destinationView)
        
        currentView.layer.masksToBounds = true
        destinationView.layer.masksToBounds = true
        
        configureBackground(in: containerView)
        
        addCornerRadiusAnimations(currentView: currentView, destinationView: destinationView)
        
        UIView.animate(withDuration: Constants.animationScalingDuration, animations: {
            currentView.transform = Constants.scalingTransformMinValue
        }, completion: { _ in
            UIView.animate(withDuration: Constants.animationMoveDuration, animations: {
                currentView.center.x = -Constants.screenCenter.x
                destinationView.center.x = Constants.screenCenter.x
            }, completion: { _ in
                UIView.animate(withDuration: Constants.animationScalingDuration, animations: {
                    destinationView.transform = Constants.scalingTransformdefaultValue
                    destinationView.frame = context.finalFrame(for: destinationVC)
                }, completion: { [weak self] finished in
                    destinationView.layer.cornerRadius = 0
                    
                    guard let backgroundView = self?.backgroundView else { return }
                    
                    backgroundView.removeFromSuperview()
                    
                    context.completeTransition(finished)
                })
            })
            
        })
    }
    
    private func dismiss(with context: UIViewControllerContextTransitioning) {
        let containerView = context.containerView
        guard let currentView = context.view(forKey: .from), let destinationVC = context.viewController(forKey: .to), let destinationView = context.view(forKey: .to) else { return }
        
        let finalFrame = context.finalFrame(for: destinationVC)
        
        destinationView.transform = Constants.scalingTransformMinValue
        destinationView.center.x = -Constants.screenCenter.x
        containerView.addSubview(destinationView)
        
        configureBackground(in: containerView)
        
        currentView.layer.masksToBounds = true
        destinationView.layer.masksToBounds = true
        
        addCornerRadiusAnimations(currentView: currentView, destinationView: destinationView)
        
        UIView.animate(withDuration: Constants.animationScalingDuration, delay: 0, animations: {
            currentView.transform = Constants.scalingTransformMinValue
        }, completion: { _ in
            UIView.animate(withDuration: Constants.animationMoveDuration, delay: 0, animations: {
                currentView.center.x = Constants.screenCenter.x + AppCore.shared.deviceLayer.screenSize.width
                destinationView.center.x = Constants.screenCenter.x
            }, completion: { _ in
                UIView.animate(withDuration: Constants.animationScalingDuration, delay: 0, options: [.curveEaseOut], animations: {
                    destinationView.transform = Constants.scalingTransformdefaultValue
                    destinationView.frame = finalFrame
                }, completion: { [weak self] finished in
                    destinationView.layer.cornerRadius = 0
                    
                    guard let backgroundView = self?.backgroundView else { return }
                    
                    backgroundView.removeFromSuperview()
                    context.completeTransition(finished)
                })
            })
        })
    }
    
    private func configureBackground(in containerView: UIView) {
        backgroundView = UIView(frame: AppCore.shared.deviceLayer.screenSize)
        
        guard let backgroundView = backgroundView else { return }
        
        let imageView = UIImageView(frame: AppCore.shared.deviceLayer.screenSize)
        
        imageView.image = UIImage(named: Constants.backgroundImageName)
        
        imageView.contentMode = .scaleAspectFill
        backgroundView.addSubview(imageView)
        
        containerView.insertSubview(backgroundView, at: 0)
    }
    
    private func addCornerRadiusAnimations(currentView cView: UIView, destinationView dView: UIView) {
        let cornerRadiusOutAnimation = CAKeyframeAnimation(keyPath: Constants.animationCornerRadiusKeyPath)
        cornerRadiusOutAnimation.duration = Constants.animationCornerRadiusDuration
        cornerRadiusOutAnimation.values = Constants.animationCornerRadiusOutValues
        cornerRadiusOutAnimation.keyTimes = Constants.animationCornerRadiusOutKeyTimes
        cornerRadiusOutAnimation.timingFunctions = Constants.animationCornerRadiusTimingFunctions
        cornerRadiusOutAnimation.beginTime = Constants.animationCornerRadiusBeginTime
        cornerRadiusOutAnimation.isRemovedOnCompletion = true
        cView.layer.add(cornerRadiusOutAnimation, forKey: Constants.animationCornerRadiusKeyPath)
        
        let cornerRadiusInAnimation = CAKeyframeAnimation(keyPath: Constants.animationCornerRadiusKeyPath)
        cornerRadiusInAnimation.duration = Constants.animationCornerRadiusDuration
        cornerRadiusInAnimation.values = Constants.animationCornerRadiusInValues
        cornerRadiusInAnimation.keyTimes = Constants.animationCornerRadiusInKeyTimes
        cornerRadiusInAnimation.timingFunctions = Constants.animationCornerRadiusTimingFunctions
        cornerRadiusInAnimation.beginTime = Constants.animationCornerRadiusBeginTime
        cornerRadiusInAnimation.isRemovedOnCompletion = true
        dView.layer.add(cornerRadiusInAnimation, forKey: Constants.animationCornerRadiusKeyPath)
    }
    
    //MARK: - Prop's
    private let presentingMode: Bool
    private var backgroundView: UIView?
}

extension CardShapeTransitionAnimator: UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if presentingMode {
            self.present(with: transitionContext)
        } else {
            self.dismiss(with: transitionContext)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Constants.animationDuration
    }
}

extension CardShapeTransitionAnimator {
    private struct Constants {
        //Common
        static let screenCenter: CGPoint = CGPoint(x: AppCore.shared.deviceLayer.screenSize.midX, y: AppCore.shared.deviceLayer.screenSize.midY)
        static let backgroundImageName = "CardShapeTranstionBackgroundImage-universal"
        
        static let cornerRadiusMin: CGFloat = 0
        static let cornerRadiusMax: CGFloat = AppCore.shared.deviceLayer.screenSize.maxY / 30
        
        static let scalingTransformMinValue = CGAffineTransform(scaleX: 0.9, y: 0.9)
        static let scalingTransformdefaultValue = CGAffineTransform(scaleX: 1, y: 1)
        //Animations
        //-Common
        static let animationDuration: Double = 1
        //-Scale animation
        static let animationScalingDuration = Constants.animationDuration * 0.3
        //-Move animation
        static let animationMoveDuration = Constants.animationDuration * 0.4
        //-CornerRadius animation
        static let animationCornerRadiusKeyPath = "cornerRadius"
        static let animationCornerRadiusDuration = Constants.animationDuration
        static let animationCornerRadiusOutValues: [CGFloat] = [Constants.cornerRadiusMin, Constants.cornerRadiusMax, Constants.cornerRadiusMax]
        static let animationCornerRadiusOutKeyTimes: [NSNumber] = [0.000, 0.350, 1.000]
        static let animationCornerRadiusInValues: [CGFloat] = [Constants.cornerRadiusMax, Constants.cornerRadiusMax, Constants.cornerRadiusMin]
        static let animationCornerRadiusInKeyTimes: [NSNumber] = [0.000, 0.650, 1.000]
        static let animationCornerRadiusTimingFunctions = [CAMediaTimingFunction(name: .linear)]
        static let animationCornerRadiusBeginTime: Double = 0
    }
}
