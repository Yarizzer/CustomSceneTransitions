//
//  BackButton.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 09.02.2023.
//

import UIKit

class BackButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = frame.height / 2
        configureSign()
    }
    
    private func setupView() {
        signShapeLayer = CAShapeLayer()
        
        layer.borderWidth = AppCore.shared.styleLayer.layerRegularBorderWidth
        layer.borderColor = AppCore.shared.styleLayer.colorGray.cgColor
        
        layer.addSublayer(signShapeLayer)
    }
    
    private func configureSign() {
        signShapeLayer.frame = bounds
        
        let firstPoint = CGPoint(x: self.frame.width  - (self.frame.width / 3), y: self.frame.height / 4)
        let secondPoint = CGPoint(x: self.frame.width / 3, y: self.frame.height / 2)
        let thirdPoint = CGPoint(x: self.frame.width  - (self.frame.width / 3), y: self.frame.height - (self.frame.height / 4))
        
        let signPath = UIBezierPath()
        signPath.move(to: firstPoint)
        signPath.addLine(to: secondPoint)
        signPath.addLine(to: thirdPoint)
        
        signShapeLayer.path = signPath.cgPath
    }
    
    func appear() {
        self.signShapeLayer.strokeEnd = Constants.signDefaultStrokeEnd
    }
    
    func disAppear() {
        self.signShapeLayer.strokeEnd = Constants.signInitialStrokeEnd
    }
    
    private var signShapeLayer: CAShapeLayer! {
        didSet {
            signShapeLayer.fillColor = AppCore.shared.styleLayer.colorClear.cgColor
            signShapeLayer.strokeColor = AppCore.shared.styleLayer.colorGray.cgColor
            signShapeLayer.strokeEnd = Constants.signInitialStrokeEnd
            signShapeLayer.lineWidth = AppCore.shared.styleLayer.layerRegularLineWidth
            signShapeLayer.lineCap = .round
        }
    }
}

extension BackButton {
    private struct Constants {
        static let signInitialStrokeEnd: CGFloat = 0
        static let signDefaultStrokeEnd: CGFloat = 1
    }
}
