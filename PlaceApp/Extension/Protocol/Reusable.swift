//
//  Reusable.swift
//  PlaceApp
//
//  Created by Gucci on 1/16/26.
//

import Foundation

protocol Reusable: AnyObject {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        String(describing: Self.self)
    }
}
