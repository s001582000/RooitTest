//
//  ViewModel.swift
//  RooitTest
//
//  Created by YASYUAN LINANG on 2023/9/17.
//

import Foundation
import RealmSwift
import RxRealm
import RxSwift

class ViewModel {
    var realm = try! Realm()
    let disposeBag = DisposeBag()
    func fetchData() {
        APIManager.shared.request(NewsApi.GetNews()).subscribe { result in
            if let articles = result.articles {
                try! self.realm.write {
                    for article in articles {
                        let item = NewsItem()
                        item.title = article.title ?? ""
                        item.url = article.url ?? ""
                        item.image = article.urlToImage ?? ""
                        self.realm.add(item)
                    }
                }
            }
        } onFailure: { error in
            print(error.localizedDescription)
        }.disposed(by: disposeBag)
    }
    
    func getTasks() -> Observable<Results<NewsItem>> {
        let tasks = realm.objects(NewsItem.self)
        return Observable.collection(from: tasks)
    }
}
