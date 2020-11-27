//
//  ViewController.swift
//  iOSCodeAssignment
//
//  Created by V on 23.11.2020.
//

import UIKit

final class DetailsScreenVC: UIViewController {
	
	@IBOutlet private var textView: UITextView!
	
	var post: PostDetailsModel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		guard post != nil else { return }
		textView.text = post.body
		title = post.title
	}
}
