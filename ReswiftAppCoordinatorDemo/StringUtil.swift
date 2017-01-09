//
//  StringUtility.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 09/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//
import Foundation

struct StringUtil {
    static func formatForPound(_ number: Double) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let numberString = numberFormatter.string(from: NSNumber(value: number))!
        return "£\(numberString)"
    }}
