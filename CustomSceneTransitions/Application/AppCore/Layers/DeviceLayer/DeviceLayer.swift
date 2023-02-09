//
//  DeviceLayer.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//

import UIKit
import AVFoundation

protocol DeviceLayerType {
    var screenSize: CGRect { get }
    var hasTopNotch: Bool { get }
    
    func generateSuccessFeedback()
    func generateFailureFeedback()
    func vibrate()
}

class DeviceLayer: DeviceLayerType {
    var screenSize: CGRect { return UIScreen.main.bounds }
        
    var hasTopNotch: Bool {
        if #available(iOS 11.0, tvOS 11.0, *) {
            // with notch: 44.0 on iPhone X, XS, XS Max, XR.
            // without notch: 24.0 on iPad Pro 12.9" 3rd generation, 20.0 on iPhone 8 on iOS 12+.
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 24
        }

        return false
    }
    
    func generateSuccessFeedback() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    func generateFailureFeedback() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }
    
    func vibrate() {
        UIDevice.vibrate()
    }
}

extension UIDevice {
    static func vibrate() {
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
    }
}
