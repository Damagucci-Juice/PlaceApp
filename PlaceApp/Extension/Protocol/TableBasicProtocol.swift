//
//  TableBasicProtocol.swift
//  PlaceApp
//
//  Created by Gucci on 1/16/26.
//
import Foundation

protocol TableBasicProtocol: AnyObject {
    func setupTable()
}

protocol CellBasicProtocol: AnyObject {
    associatedtype Item
    func configure(_ item: Item)
}
