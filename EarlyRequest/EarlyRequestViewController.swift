//
//  EarlyRequestViewController.swift
//  HRMS
//
//  Created by Talib on 26/04/23.
//

import UIKit
import Parchment


class EarlyRequestViewController: PagingViewController, PagingViewControllerDataSource {
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self

        
        
        //backgroundColor = .label
//        navigationController?.navigationBar.isHidden = false
//        backButton(title:"Early Request")
        
        
        
    }
    
    private let optionsArray = [
        "Early Request Form",
        "Request"
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        guard let navigationBar = navigationController?.navigationBar else { return}
//        navigationItem.titleView?.frame = CGRect(origin:.zero, size:navigationBar.bounds.size)
//        menuItemSize = .selfSizing(estimatedWidth:100, height:40)
//        menuInsets = UIEdgeInsets(top:self.view.safeAreaInsets.top, left:0, bottom: 0, right: 0)
//        menuItemSpacing = 0
//        
        
//        menuItemSize = .selfSizing(estimatedWidth: 100, height:40)
//        menuInsets = UIEdgeInsets(top: self.view.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
//        menuItemSpacing = 0
        
        
//        guard let navigationBar = navigationController?.navigationBar else { return }
//        navigationItem.titleView?.frame = CGRect(origin: .zero, size: navigationBar.bounds.size)
        
        
        
        menuItemSize = .selfSizing(estimatedWidth: 100, height:navigationController?.navigationBar.bounds.height ?? 40.0)
        menuInsets = UIEdgeInsets(top:self.view.safeAreaInsets.top, left:0, bottom: 0, right: 0)
        
        
        
    }
    
    
  
    
    

    func numberOfViewControllers(in pagingViewController: Parchment.PagingViewController) -> Int {
        
        return optionsArray.count
       
    }
    
    func pagingViewController(_: Parchment.PagingViewController, viewControllerAt index: Int) -> UIViewController {
        
        let earlyRequestForm = self.storyboard?.instantiateViewController(withIdentifier:"EarlyRequestForm") as! EarlyRequestFormViewController
       
        switch index {
        case 0:
             let earlyRequestForm = self.storyboard?.instantiateViewController(withIdentifier:"EarlyRequestForm") as! EarlyRequestFormViewController
            return earlyRequestForm
            
        case 1:
            let request = self.storyboard?.instantiateViewController(withIdentifier:"Request") as! RequestViewController
//            request.requestModel  = requestModel
            return request
                    
        default:
            print("No View Controllers found")
        }

        return earlyRequestForm
    }
    
    func pagingViewController(_: Parchment.PagingViewController, pagingItemAt index: Int) -> Parchment.PagingItem {
        return PagingIndexItem(index:index, title:optionsArray[index])
    }
    

}


