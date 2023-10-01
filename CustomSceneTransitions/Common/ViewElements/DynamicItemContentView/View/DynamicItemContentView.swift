//
//  DynamicItemContentView.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 21.03.2023.
//

import UIKit

final class DynamicItemContentView: UIView {
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
        
        guard let canvas = canvas else { return }
        
        canvas.layer.cornerRadius = Constants.cornerRadiusValue
        canvas.layer.borderWidth = Constants.borderWidthValue
        canvas.layer.borderColor = AppCore.shared.styleLayer.colorDarkGray.cgColor
    }
    
    private func setupView() {
        self.canvas = UIView()
        
        guard let canvas = canvas else { return }
        
        canvas.backgroundColor = AppCore.shared.styleLayer.colorLightGray

        addSubview(canvas)
    }
    
    private func setupConstraints(for type: DynamicItemContentViewType) {
        guard let canvas else { return }
        
        canvas.translatesAutoresizingMaskIntoConstraints = false
        
        canvas.topAnchor.constraint(equalTo: topAnchor).isActive = true
        canvas.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        canvas.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        canvas.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        switch type {
        case .regular:
            guard let titleLabel, let descriptionLabel else { return }
            
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            
            titleLabel.topAnchor.constraint(equalTo: canvas.topAnchor).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.elementsPaddingValue).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -Constants.elementsPaddingValue).isActive = true
            titleLabel.heightAnchor.constraint(equalTo: canvas.heightAnchor, multiplier: Constants.titleMultiplier).isActive = true
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
            descriptionLabel.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.elementsPaddingValue).isActive = true
            descriptionLabel.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -Constants.elementsPaddingValue).isActive = true
            descriptionLabel.bottomAnchor.constraint(equalTo: canvas.bottomAnchor).isActive = true
        }
        
        self.setNeedsLayout()
    }
    
    func setup(with model: DynamicItemContentViewData) {
        self.type = model.type
        
        guard let type = type, let canvas = canvas else { return }
        
        switch type {
        case .regular:
            titleLabel = UILabel()
            descriptionLabel = UILabel()
            
            guard let titleLabel, let descriptionLabel else { return }
            
            titleLabel.textColor = AppCore.shared.styleLayer.colorDarkGray
            titleLabel.minimumScaleFactor = Constants.minScaleFactor
            titleLabel.adjustsFontSizeToFitWidth = true
            
            descriptionLabel.textColor = AppCore.shared.styleLayer.colorDarkGray
            descriptionLabel.minimumScaleFactor = Constants.minScaleFactor
            descriptionLabel.adjustsFontSizeToFitWidth = true
            
            titleLabel.text = model.title
            descriptionLabel.text = model.description
            
            canvas.addSubview(titleLabel)
            canvas.addSubview(descriptionLabel)
        }
        
        setupConstraints(for: model.type)
    }
    
    private var type: DynamicItemContentViewType?
    
    private var canvas: UIView?
    private var titleLabel: UILabel?
    private var descriptionLabel: UILabel?
}

extension DynamicItemContentView {
    private struct Constants {
        //Layer's prop's
        static let cornerRadiusValue: CGFloat = 20.0
        static let borderWidthValue: CGFloat = 1
        //Padding
        static let elementsPaddingValue: CGFloat = 10.0
        //Multipliers
        static let titleMultiplier: CGFloat = 0.7
        //Labels prop's
        static let minScaleFactor: CGFloat = 0.5
    }
}
