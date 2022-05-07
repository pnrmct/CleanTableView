//
//  JsonPlaceHolderService.swift
//  CleanTableView
//
//  Created by Pınar Macit on 12.04.2022.
//

import Alamofire
protocol JsonPlaceHolderProtocol {
    func fethAllPosts(onSuccess: @escaping ([PostModel])-> Void, onFail: @escaping (String?)-> Void)
}
enum JsonPlaceHolderPath:String {
case POSTS = "/posts"
}
extension JsonPlaceHolderPath{
    
    func withBashUrl() -> String {
        return "https://jsonplaceholder.typicode.com\(self.rawValue)"
    }
}

struct JsonPlaceHolderService: JsonPlaceHolderProtocol {
    func fethAllPosts(onSuccess: @escaping ([PostModel]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(JsonPlaceHolderPath.POSTS.withBashUrl(), method: .get).validate().responseDecodable(of: [PostModel].self) {
            (responce) in
            guard let items = responce.value else {
                onFail(responce.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
}
