//
//  String+Digits.swift
//  AustralianBusinessRegisteryKit
//
//  Created by Shane Whitehead on 27/9/18.
//  Copyright © 2018 KaiZen. All rights reserved.
//

import Foundation

extension String {
	var digits: String {
		return components(separatedBy: CharacterSet.decimalDigits.inverted)
			.joined()
	}
}
