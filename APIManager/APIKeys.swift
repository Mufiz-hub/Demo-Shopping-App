//
//  APIKeys.swift
//  White-Orange
//
//  Created by Rahul Sharma on 08/11/24.
//

import Foundation
import UIKit
import Kingfisher


struct APIKeys
{
    static var base_Url = "https://dummyjson.com/"

    static var api_Keys = ""
    
    struct Endpoint
    {
        static var endP = "products/categories"
        static var productsEndp = "products/category/beauty"

    }
    
}


class Helper
{
    @MainActor class func getImgFromUrl(imgView : UIImageView,url : String)
    {
        let url = URL(string : url)
        imgView.kf.setImage(with: url,placeholder: UIImage(named: "placeHolder"))
    }
}
