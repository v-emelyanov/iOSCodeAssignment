//
//  iCA+String.swift
//  iOSCodeAssignment
//
//  Created by V on 27.11.2020.
//

import Foundation

extension String {
	
	func getIdValided() -> String? {
		guard self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted)==nil else { return nil }		// Checking for not digits
		let value = self.trimmingCharacters(in: .whitespacesAndNewlines)									// Checking for spaces
		guard (1...100).contains(Int(value) ?? 0) else { return nil }										// Checking for acceptable range of number
		return value.isEmpty ? nil : value.trimmingCharacters(in: .whitespacesAndNewlines)
	}
}
