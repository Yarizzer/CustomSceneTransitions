//
//  StyleLayerType.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 09.02.2023.
//

import UIKit

protocol StyleLayerType {
    //Colors
    var colorClear: UIColor { get }
    var colorWhite: UIColor { get }
    var colorBlack: UIColor { get }
    var colorLightGray: UIColor { get }
    var colorGray: UIColor { get }
    var colorDarkGray: UIColor { get }
    var colorRed: UIColor { get }
    var colorSoftGreen: UIColor { get }
    var colorGreen: UIColor { get }
    var colorSoftYellow: UIColor { get }
    var colorSoftBlue: UIColor { get }
    var colorBlue: UIColor { get }
    var colorSoftPurple: UIColor { get }
    var colorPurple: UIColor { get }
    //Fonts
    var labelTitleFontExtraLarge: UIFont { get }
    var labelTitleFontLarge: UIFont { get }
    var labelTitleFontMedium: UIFont { get }
    var labelTitleFontSmall: UIFont { get }
    var labelTitleFontExtraSmall: UIFont { get }
    //Buttons
    var layerRegularBorderWidth: CGFloat { get }
    var layerRegularLineWidth: CGFloat { get }
}

