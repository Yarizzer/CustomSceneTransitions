//
//  AppCore.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//

class AppCore {
    static let shared = AppCore()
    
    private init() {
        self.deviceL = DeviceLayer()
    }
    
    //Layers
    private var deviceL: DeviceLayerType
}

extension AppCore: AppDeviceable {
    var deviceLayer: DeviceLayerType { return deviceL }
}
