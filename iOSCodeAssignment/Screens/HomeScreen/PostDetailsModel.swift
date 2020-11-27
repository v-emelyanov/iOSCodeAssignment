//
//  Model.swift
//  iOSCodeAssignment
//
//  Created by V on 27.11.2020.
//

import Foundation

struct PostDetailsModel: Decodable {
	let userId: Int?
	let id: Int?
	let title: String?
	let body: String?
	init() { userId = nil; id = nil; title = nil; body = nil }
	
	var isAllFieldsFullfill: Bool {
		guard userId != nil, id != nil, let title = title, let body = body, !title.isEmpty, !body.isEmpty else { return false }
		return true
	}
}
