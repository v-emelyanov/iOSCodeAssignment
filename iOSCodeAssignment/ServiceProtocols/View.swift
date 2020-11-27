//
//  View.swift
//  iOSCodeAssignment
//
//  Created by V on 27.11.2020.
//

import UIKit

protocol View { }

extension View {
	func showError(text: String) {
		guard let topVC = UIApplication.shared.keyWindow?.rootViewController else { return }
		let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default))
		topVC.present(alert, animated: true)
	}
}
