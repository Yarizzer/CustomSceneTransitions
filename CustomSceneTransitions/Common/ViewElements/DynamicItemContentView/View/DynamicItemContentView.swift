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
        
        guard let canvas = canvas, let title = titleLabel else { return }
        
        canvas.layer.cornerRadius = Constants.cornerRadiusValue
        canvas.layer.borderWidth = Constants.borderWidthValue
        canvas.layer.borderColor = AppCore.shared.styleLayer.colorDarkGray.cgColor
        
        guard let type = type else { return }
        
        switch type {
        case .regular:
            title.heightAnchor.constraint(equalTo: canvas.heightAnchor, multiplier: Constants.titleMultiplier).isActive = true
        }
    }
    
    private func setupView() {
        self.canvas = UIView()
        
        guard let canvas = canvas else { return }
        
        canvas.backgroundColor = AppCore.shared.styleLayer.colorLightGray

        addSubview(canvas)
    }
    
    private func setupConstraints(for type: DynamicItemContetntViewType) {
        guard let canvas = canvas else { return }
        
        canvas.translatesAutoresizingMaskIntoConstraints = false
        
        canvas.topAnchor.constraint(equalTo: topAnchor, constant: Constants.elementsPaddingValue).isActive = true
        canvas.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.elementsPaddingValue).isActive = true
        canvas.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.elementsPaddingValue).isActive = true
        canvas.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.elementsPaddingValue).isActive = true
        
        switch type {
        case .regular:
            guard let title = titleLabel, let description = descriptionLabel else { return }
            
            title.translatesAutoresizingMaskIntoConstraints = false
            description.translatesAutoresizingMaskIntoConstraints = false
            
            title.topAnchor.constraint(equalTo: canvas.topAnchor).isActive = true
            title.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.elementsPaddingValue).isActive = true
            title.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -Constants.elementsPaddingValue).isActive = true
            
            description.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
            description.leadingAnchor.constraint(equalTo: canvas.leadingAnchor, constant: Constants.elementsPaddingValue).isActive = true
            description.trailingAnchor.constraint(equalTo: canvas.trailingAnchor, constant: -Constants.elementsPaddingValue).isActive = true
            description.bottomAnchor.constraint(equalTo: canvas.bottomAnchor).isActive = true
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
            
            guard let title = titleLabel, let description = descriptionLabel else { return }
            
            title.textColor = AppCore.shared.styleLayer.colorDarkGray
            title.minimumScaleFactor = Constants.minScaleFactor
            title.adjustsFontSizeToFitWidth = true
            
            description.textColor = AppCore.shared.styleLayer.colorDarkGray
            description.minimumScaleFactor = Constants.minScaleFactor
            description.adjustsFontSizeToFitWidth = true
            
            title.text = model.title
            description.text = model.description
            
            canvas.addSubview(title)
            canvas.addSubview(description)
        }
        
        setupConstraints(for: model.type)
    }
    
    private var type: DynamicItemContetntViewType?
    
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
