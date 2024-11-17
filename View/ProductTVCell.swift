//
//  ProductTVCell.swift
//  White-Orange
//
//  Created by Rahul Sharma on 08/11/24.
//

import UIKit

class ProductTVCell: UITableViewCell {
    
    @IBOutlet weak var productimg: UIImageView!
    
    @IBOutlet weak var titlelbl: UILabel!
    
    @IBOutlet weak var desclbl: UILabel!
    
    @IBOutlet weak var stocklbl: UILabel!
    
    @IBOutlet weak var pricelbl: UILabel!
    
    @IBOutlet weak var retinglbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setData(data : Productss)
    {
        titlelbl.text = data.title ?? ""
        desclbl.text = data.description ?? ""
        stocklbl.text = "\(data.stock ?? 0)"
        retinglbl.text = "\(data.rating ?? 00)"
        pricelbl.text = "\(data.price ?? 00)"
        Helper.getImgFromUrl(imgView: self.productimg, url: data.thumbnail ?? "")
    }
}
