//
//  APIManager.swift
//  iOSCodeAssignment
//
//  Created by V on 24.11.2020.
//

import Foundation
import Moya

enum APIManagerJsonplaceholderTypicodeCom {
	case getWithDetails(id: Int)
}

extension APIManagerJsonplaceholderTypicodeCom: TargetType {
	var baseURL: URL {
		return URL(string: "https://jsonplaceholder.typicode.com")!
	}

	var path: String {
		switch self {
		case let .getWithDetails(id): return "/posts/"+String(id)
		}
	}

	var method: Moya.Method {
		switch self {
		case .getWithDetails: return .get
		}
	}

	var sampleData: Data {
		return Data()
	}

	var task: Task {
		switch self {
		case .getWithDetails: return .requestPlain
		}
	}

	var headers: [String: String]? {
		return ["Content-type": "application/json"]
	}

}
