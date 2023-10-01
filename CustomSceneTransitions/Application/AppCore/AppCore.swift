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
        self.styleL = StyleLayer()
    }
    
    //Layers
    private var deviceL: DeviceLayerType
    private var styleL: StyleLayerType
}

extension AppCore: AppCoreDeviceLayerable {
    var deviceLayer: DeviceLayerType { deviceL }
}

extension AppCore: AppCoreStyleLayerable {
    var styleLayer: StyleLayerType { styleL }
}
