//
//  TableViewProviderViewModel.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 09.02.2023.
//

protocol TableViewProviderViewModel {
    var numberOfTableSections: Int { get }
    func numberOfTableRowsInSection(_ section: Int) -> Int
    func heightForRow(atIndex index: Int) -> Float
}
