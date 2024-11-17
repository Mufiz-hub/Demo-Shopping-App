//
//  ProductModel.swift
//  White-Orange
//
//  Created by Rahul Sharma on 08/11/24.
//

import Foundation


struct MainModel : Codable
{
    var slug : String?
    var name : String?
    var url : String?
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}

typealias Welcome = [MainModel]



struct SecondAPIMainModel : Codable
{
    var products :[Productss]?
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.products = try container.decodeIfPresent([Productss].self, forKey: .products)
    }
}

struct Productss : Codable
{
    var title : String?
    var description : String?
   
    var price : Double?
    var rating : Double?
    var thumbnail : String?
    var stock : Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.rating = try container.decodeIfPresent(Double.self, forKey: .rating)
        self.thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail)
        self.stock = try container.decodeIfPresent(Int.self, forKey: .stock)
    }
}
