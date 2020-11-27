//
//  HomeScreenVM.swift
//  iOSCodeAssignment
//
//  Created by V on 27.11.2020.
//

import Foundation
import Moya
import RxSwift
import RxCocoa

final class HomeScreenVM {
	var postDriver: Driver<PostDetailsModel>!
	var toStartLoadingPostObserver: AnyObserver<Void> { toStartLoadingPostInnerSubject.asObserver() }
	var idPostFromField: PublishSubject<String?> = PublishSubject<String?>()
	
	private let toStartLoadingPostInnerSubject: PublishSubject<Void> = PublishSubject<Void>()
	private let provider = MoyaProvider<APIManagerJsonplaceholderTypicodeCom>()
	
	init() {
		postDriver = toStartLoadingPostInnerSubject
			.asObservable()
			.withLatestFrom(idPostFromField) { $1 }
			.filter { (lastIdPost: String?) -> Bool in lastIdPost != nil }
			.flatMap { [unowned self] (lastIdPost: String?) -> Single<PostDetailsModel> in
				return self.provider.rx.request(.getWithDetails(id: Int(lastIdPost ?? "") ?? 0))						// Moya's layer request
					.filterSuccessfulStatusCodes()																		//
					.map(PostDetailsModel.self)																			//
					.catchErrorJustReturn(PostDetailsModel())															//
			}
			.asDriver(onErrorJustReturn: PostDetailsModel())
	}
	
}
