//
//  Date+.swift
//  PlaceApp
//
//  Created by Gucci on 1/18/26.
//

import Foundation

extension Date {
    var timeInSouthKorea: String {
        dateFormmatter.string(from: self)
    }
}

fileprivate let dateFormmatter: DateFormatter = {
    let result = DateFormatter()
    result.locale = Locale(identifier: "ko_KR")
    result.dateFormat = "hh:mm a"
    return result
}()
