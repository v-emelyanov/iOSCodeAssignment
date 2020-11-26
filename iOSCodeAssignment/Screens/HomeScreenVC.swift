//
//  HomeScreenVC.swift
//  iOSCodeAssignment
//
//  Created by V on 24.11.2020.
//

import Foundation
import UIKit
import Moya
import RxSwift
import RxCocoa

final class HomeScreenVC: UIViewController {
	@IBOutlet private var textFieldNumer: UITextField!
	@IBOutlet private var buttonSend: UIButton!

	var viewModel: HomeScreenVM!
	private let disposeBag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = HomeScreenVM()
		textFieldNumer.rx.text.bind(to: self.viewModel.idPostFromField).disposed(by: disposeBag)
		buttonSend.rx.tap.bind(to: self.viewModel.toStartLoadingPostObserver).disposed(by: disposeBag)
		viewModel.postDriver.drive { aaa in print(aaa) }.disposed(by: disposeBag)
	}
	
}

final class HomeScreenVM {
	var postDriver: Driver<PostDetailsModel>!
	var toStartLoadingPostObserver: AnyObserver<Void> { toStartLoadingPostInnerSubject.asObserver() }
	var idPostFromField: PublishSubject<String?> = PublishSubject<String?>()
	
	private let toStartLoadingPostInnerSubject: PublishSubject<Void> = PublishSubject<Void>()
	private let provider = MoyaProvider<APIManagerJsonplaceholderTypicodeCom>()
	
	init() {
		postDriver = toStartLoadingPostInnerSubject
			.asObservable()
			.withLatestFrom(idPostFromField)
			.flatMap { lastIdPost in
				self.provider.rx.request(.getWithDetails(id: Int(lastIdPost ?? "") ?? 0))
					.filterSuccessfulStatusCodes()
					.map(PostDetailsModel.self)
					.catchErrorJustReturn(PostDetailsModel())
			}
			.asDriver(onErrorRecover: { (err) -> Driver<PostDetailsModel> in
				Driver<PostDetailsModel>.empty()
			})

	}
}

struct PostDetailsModel: Decodable {
	let userId: Int?
	let id: Int?
	let title: String?
	let body: String?
	init() { userId = nil; id = nil; title = nil; body = nil }
}
