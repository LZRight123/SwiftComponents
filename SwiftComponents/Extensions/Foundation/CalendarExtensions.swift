//
//  CalendarExtensions.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2019/2/19.
//  Copyright © 2019 com.FBBC.JoinTown. All rights reserved.
//

import Foundation

// MARK: - Methods
public extension Calendar {
    static let shareCalendar = Calendar.current

    /// SwifterSwift: Return the number of days in the month for a specified 'Date'.
    ///
    ///		let date = Date() // "Jan 12, 2017, 7:07 PM"
    ///		Calendar.current.numberOfDaysInMonth(for: date) -> 31
    ///
    /// - Parameter date: the date form which the number of days in month is calculated.
    /// - Returns: The number of days in the month of 'Date'.
    func numberOfDaysInMonth(for date: Date) -> Int {
        return range(of: .day, in: .month, for: date)!.count
    }

}
