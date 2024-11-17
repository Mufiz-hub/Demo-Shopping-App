//
//  ViewController.swift
//  White-Orange
//
//  Created by Rahul Sharma on 08/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cvcell: UICollectionView!
    var selectedIndex = 0
    @IBOutlet weak var tvcell: UITableView!
    var productVM = ProductViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tvcell.register(UINib(nibName: "ProductTVCell", bundle: nil), forCellReuseIdentifier: "ProductTVCell")
        
        let nib = UINib(nibName: "CategoryCVCell", bundle: nil)
        cvcell.register(nib, forCellWithReuseIdentifier: "CategoryCVCell")
        
        cvcell.dataSource = self
        cvcell.delegate = self
        
        self.productVM.getData { result in
            if result
            {
                self.cvcell.reloadData()
                self.getSubProductData()
            }
            else
            {
                print("Error!!")
            }
        }
        // Do any additional setup after loading the view.
    }

    func getSubProductData(){
        
        self.productVM.getPrductData(url: productVM.welcomedata?[selectedIndex].url ?? "") { result in
            if result
            {
                self.tvcell.reloadData()
            }
            else
            {
                print("Erorr")
            }
        }
    }
}



extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productVM.welcomedata?.count ?? 00
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCVCell", for: indexPath) as! CategoryCVCell
        
        if let data = productVM.welcomedata?[indexPath.row]
        {
            cell.setData(data: data)
        }
        cell.categorylbl.textColor =  indexPath.row == selectedIndex ? .black : .lightGray
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = productVM.welcomedata?[indexPath.row].name ?? ""
        label.sizeToFit()
        return CGSize(width: Int(label.frame.width + 20), height: 40)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        collectionView.reloadData()
        getSubProductData()
    }
}

extension ViewController : UITableViewDelegate ,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productVM.productData?.count ?? 00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTVCell", for: indexPath) as! ProductTVCell
        
        if let data1 = productVM.productData?[indexPath.row]
        {
            cell.setData(data: data1)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
