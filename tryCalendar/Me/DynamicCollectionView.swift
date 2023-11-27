//
//  DynamicCollectionView.swift
//  HRMS
//
//  Created by Talib on 13/02/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class DynamicCollectionView: UICollectionViewController {
    
   
    
    var dataSource:[DynamicPlans] = []
    var plans:[String] = []
    var employeeId:Int = 0
    var type = ""
    
    @IBOutlet weak var dynamicCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dynamicCV.dataSource = self
        dynamicCV.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width/2.2, height:view.frame.height/6)
        // layout.itemSize = CGSize(width:UIScreen.main.bounds.width/3, height:UIScreen.main.bounds.width/2)
        //        layout.minimumInteritemSpacing = 2
        //        layout.minimumLineSpacing =
        layout.sectionInset = UIEdgeInsets(top:10, left: 10, bottom:10, right: 10)
        dynamicCV.collectionViewLayout = layout
        
        // Register cell classes
        dynamicCV.register(UINib(nibName: "OrgCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: OrgCollectionViewCell.identifier)
        
        let employee_Id = UserDefaults.standard.integer(forKey:"employee_id")
        employeeId = employee_Id
        
       
        print("dataSource ",dataSource)
        
        dynamicCV.reloadData()
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        return dataSource.count
        
     
       
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrgCollectionViewCell.identifier, for: indexPath) as! OrgCollectionViewCell
        
        cell.Content.layer.cornerRadius = 8
        cell.Content.layer.borderWidth = 1.0
        cell.Content.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.Content.backgroundColor = .systemGray6
        cell.viewType.backgroundColor =  dataSource[indexPath.row].color
        
        let title = dataSource[indexPath.row].title
        
        cell.contentImage.image = UIImage(systemName: dataSource[indexPath.row].image)
        cell.lblTitle.text = dataSource[indexPath.row].Headtitle
        cell.lblSubHeadings.text = dataSource[indexPath.row].subHeadtitle
        
        if !title.isEmpty {
            cell.title.isHidden = false
            cell.title.text = title
        }else{
            cell.title.isHidden = true
        }
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("DynamicCV ",collectionView,indexPath.row)
       
        guard  let earlyRequest:EarlyRequestViewController =  self.storyboard?.instantiateViewController(withIdentifier:"EarlyRequest") as? EarlyRequestViewController else {return}
                navigationController?.pushViewController(earlyRequest, animated:true)
                
        
        
    }
    
}
struct DynamicPlans {
    
    var image:String
    var Headtitle:String
    var subHeadtitle:String
    var title:String
    var color:UIColor
    init(image: String, Headtitle: String, subHeadtitle: String, title: String,color:UIColor) {
        self.image = image
        self.Headtitle = Headtitle
        self.subHeadtitle = subHeadtitle
        self.title = title
        self.color = color
    }
    
}

