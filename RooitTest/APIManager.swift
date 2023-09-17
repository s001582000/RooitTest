//
//  APIManager.swift
//  RooitTest
//
//  Created by YASYUAN LINANG on 2023/9/17.
//

import Foundation
import Moya
import RxSwift
class APIManager {
    static let shared = APIManager()
    private let proovider = MoyaProvider<MultiTarget>()
    func request<Request: DecodableResponseTargetType>(_ request: Request) -> Single<Request.ResponseType> {
        let target = MultiTarget.init(request)
        return proovider.rx.request(target).filterSuccessfulStatusCodes().map(Request.ResponseType.self)
    }
}
