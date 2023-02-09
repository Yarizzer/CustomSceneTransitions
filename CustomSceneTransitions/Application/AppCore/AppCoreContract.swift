//
//  AppCoreContract.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//

protocol AppDeviceable {
    var deviceLayer: DeviceLayerType { get }
}

protocol AppStyleable {
    var styleLayer: StyleLayerType { get }
}
