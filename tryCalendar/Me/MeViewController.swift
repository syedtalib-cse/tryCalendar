//
//  MeViewController.swift
//  HRMS
//
//  Created by Talib on 10/02/23.
//

 
import UIKit
import Parchment

class MeViewController: PagingViewController {
   


    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self

        if let color = UIColor(named: "AppDarkBlue") {
           selectedTextColor = color
        }
        
        //backgroundColor = .label
//        navigationController?.navigationBar.isHidden = false
        
//        addChild(sideMenuViewController)
//        view.addSubview(sideMenuViewController.view)
//        sideMenuViewController.view.frame = CGRect(x: -sideMenuWidth, y: 0, width: sideMenuWidth, height: view.bounds.height)
//        sideMenuViewController.didMove(toParent: self)
       
        
    }
    
    private let optionsArray = [
        "Time",
        "Finance",
        "Expenses"
    ]

    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden =  false
//
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        tabBarController?.tabBar.isHidden = true
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        guard let navigationBar = navigationController?.navigationBar else { return }
//        navigationItem.titleView?.frame = CGRect(origin: .zero, size: navigationBar.bounds.size)
        menuItemSize = .selfSizing(estimatedWidth: 100, height:40)
        menuInsets = UIEdgeInsets(top: self.view.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
        menuItemSpacing = 0
    }
//    @objc func toggleSideMenu() {
//        let isSideMenuOpen = sideMenuViewController.view.frame.origin.x == 0
//
//        UIView.animate(withDuration: 0.3) {
//            self.sideMenuViewController.view.frame.origin.x = isSideMenuOpen ? -self.sideMenuWidth : 0
//        }
//    }
//
//    @objc func handlePanGesture(_ recognizer: UITapGestureRecognizer) {
//
////        let isSideMenuOpen = sideMenuViewController.view.frame.origin.x == 0
//
//        UIView.animate(withDuration: 0.3) {
//            self.sideMenuViewController.view.frame.origin.x =  -self.sideMenuWidth
//        }
//
//    }
}


extension MeViewController: PagingViewControllerDataSource {
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: optionsArray[index])
    }

    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        
        let dyamicCV = self.storyboard?.instantiateViewController(withIdentifier:"DynamiCollection") as! DynamicCollectionView
        
        switch index {
        case 0:
            dyamicCV.type = "Time"
            dyamicCV.dataSource = [DynamicPlans(image: "mappin", Headtitle: "Clock In", subHeadtitle: "SHIFT TODAY", title: "09:30 0AM-06:30 PM", color:.systemPink),
                                   DynamicPlans(image: "airplane.departure", Headtitle: "Apply Leave", subHeadtitle: "", title: "You Can Apply Leave From Here", color:.systemYellow),
                                   DynamicPlans(image: "timer", Headtitle: "Request Credit for comp-off", subHeadtitle: "", title: "Request Credit for Compensatery off Here", color: .systemOrange),
                                   DynamicPlans(image: "newspaper", Headtitle: "Leave Balances", subHeadtitle: "", title:"View Balances and Leave History", color:.systemBrown),
                                   DynamicPlans(image: "clock", Headtitle: "Attendance History", subHeadtitle: "", title: "View Attendance history and other statics", color:.systemPurple),
                                   DynamicPlans(image: "clock.fill", Headtitle: "Compoff- History", subHeadtitle: "", title: "View all comp-off requests and History", color:.systemGreen),
                                   DynamicPlans(image: "dial.low.fill", Headtitle: "Holidays", subHeadtitle: "", title: "Next Holiday", color:.green),
                                   DynamicPlans(image: "doc.text.fill", Headtitle: "Early Request form", subHeadtitle: "", title: "Maximum 2 hours early request can be taken", color:.systemBlue)
            ]
           
        case 1:
            dyamicCV.type = "Finance"
            dyamicCV.dataSource = [DynamicPlans(image: "dollarsign.circle.fill", Headtitle: "My Pay", subHeadtitle: "LAST PAY DEPOSIT", title: "Feb 2022", color:.systemPurple),
                                   DynamicPlans(image: "dollarsign.circle.fill", Headtitle: "Manage Tax", subHeadtitle: "", title: "View and manage tax & declaration information", color:.systemOrange)
            ]
        case 2:
            dyamicCV.dataSource = []
        default:
            break
        }
        
        return dyamicCV
    }

    func numberOfViewControllers(in _: PagingViewController) -> Int {
        return optionsArray.count
    }
    
}




