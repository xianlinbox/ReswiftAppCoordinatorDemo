//
//  StringUtilTests.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 09/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//
import Quick
import Nimble

class StringUtilSpec: QuickSpec {
    override func spec() {
        describe("formatForPound") {
            it("format double to string in pound format") {
                expect(StringUtil.formatForPound(59500.0)).to(equal("£59,500"))
            }
        }
    }
}

