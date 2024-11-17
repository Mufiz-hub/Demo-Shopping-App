//
//  CategoryCVCell.swift
//  White-Orange
//
//  Created by Rahul Sharma on 08/11/24.
//

import UIKit

class CategoryCVCell: UICollectionViewCell {

    @IBOutlet weak var categorylbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setData(data : MainModel)
    {
        categorylbl.text = data.name ?? ""
    }

}
