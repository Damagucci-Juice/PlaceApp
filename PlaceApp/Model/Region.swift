//
//  Region.swift
//  PlaceApp
//
//  Created by Gucci on 1/13/26.
//

enum Region: Int, CaseIterable {
    case all = 0
    case domestic
    case oversea

    var text: String {
        switch self {
        case .all:
            return "모두"
        case .domestic:
            return "국내"
        case .oversea:
            return "해외"
        }
    }
}
