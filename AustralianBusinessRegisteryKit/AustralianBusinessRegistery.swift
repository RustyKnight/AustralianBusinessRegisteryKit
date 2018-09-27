//
//  AustralianBusinessRegistery.swift
//  AustralianBusinessRegisteryKit
//
//  Created by Shane Whitehead on 27/9/18.
//  Copyright © 2018 KaiZen. All rights reserved.
//

import Foundation

public enum ACNResult {
	case invalidLength
	case invalidCharacter
	case valid
	case invalid
}

public typealias ABNResult = ACNResult

public class AustralianBusinessRegistery {
	
	public static func isValid(acn: String) -> ACNResult {
		let numericalValue = acn.digits
		guard numericalValue.count == 9 else {
			return .invalidLength
		}
		
		let parts = Array(numericalValue)
		let weights = [8, 7, 6, 5, 4, 3, 2, 1]
		var sum = 0
		for position in 0..<weights.count {
			guard let value = Int(String(parts[position])) else {
				return .invalidCharacter
			}
			sum += value * weights[position]
		}
		
		let remainder = sum % 10
		var complement = 10 - remainder
		if complement == 10 {
			complement = 0
		}
		
		guard complement == Int(String(parts.last!)) else {
			return .invalid
		}
		
		return .valid
	}
	
	public static func isValid(abn: String) -> ABNResult {
		let numericalValue = abn.digits
		guard numericalValue.count == 11 else {
			return .invalidLength
		}
		
		let parts = Array(numericalValue)
		let weights = [10, 1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
		var sum = 0
		for position in 0..<weights.count {
			guard var value = Int(String(parts[position])) else {
				return .invalidCharacter
			}
			if position == 0 {
				value = max(0, value - 1)
			}
			sum += value * weights[position]
		}
		
		return (sum % 89 == 0) ? .valid : .invalid
	}
}
