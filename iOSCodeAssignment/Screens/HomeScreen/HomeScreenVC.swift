//
//  HomeScreenVC.swift
//  iOSCodeAssignment
//
//  Created by V on 24.11.2020.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeScreenVC: UIViewController, View {
	@IBOutlet private var textFieldNumer: UITextField!
	@IBOutlet private var buttonSend: UIButton!

	var viewModel: HomeScreenVM!
	private let disposeBag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = HomeScreenVM()
		textFieldNumer.rx.text.bind(to: self.viewModel.idPostFromField).disposed(by: disposeBag)
		buttonSend.rx.tap.bind(to: self.viewModel.toStartLoadingPostObserver).disposed(by: disposeBag)
		viewModel.postDriver.drive {
			guard $0.isAllFieldsFullfill else { self.showError(text: "ID is not correct"); return }
			guard let vc = UIStoryboard(name: "HomeAndDetailsScreens", bundle: nil).instantiateViewController(withIdentifier: "DetailsScreenVC") as? DetailsScreenVC else { return }
			vc.post = $0
			self.navigationController?.pushViewController(vc, animated: true)
		}.disposed(by: disposeBag)
	}
	
}
