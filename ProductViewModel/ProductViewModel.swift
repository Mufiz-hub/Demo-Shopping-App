//
//  ProductViewModel.swift
//  White-Orange
//
//  Created by Rahul Sharma on 08/11/24.
//

import Foundation

class ProductViewModel : NSObject
{
    var maindata : MainModel?
    var welcomedata : Welcome?
    var productData : [Productss]?
    func getData(completion : @escaping (Bool) -> Void)
    {
        let url = APIKeys.base_Url + APIKeys.Endpoint.endP
        
        NetworkCall(url: url , method: .get, isJSONRequest: false).executeQuery()
        {
            (result : Result<Welcome , Error>)in
            switch result {
            case .success(let post):
                print(post)
                self.welcomedata = post
                completion(true)
            case .failure(let err):
                completion(false)
                print(err.localizedDescription)
                print(" ")
            }
        }
    }
    
    func getPrductData(url:String,completion : @escaping (Bool) -> Void)
    {
        NetworkCall(url: url , method: .get, isJSONRequest: false).executeQuery()
        {
            (result : Result<SecondAPIMainModel , Error>)in
            switch result {
            case .success(let post):
                print(post)
                self.productData = post.products
                completion(true)
            case .failure(let err):
                completion(false)
                print(err.localizedDescription)
                print(" ")
            }
        }
    }
}
