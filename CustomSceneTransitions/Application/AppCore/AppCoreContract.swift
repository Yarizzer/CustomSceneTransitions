//
//  AppCoreContract.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//

protocol AppCoreDeviceLayerable: AnyObject {
    var deviceLayer: DeviceLayerType { get }
}

protocol AppCoreStyleLayerable: AnyObject {
    var styleLayer: StyleLayerType { get }
}
