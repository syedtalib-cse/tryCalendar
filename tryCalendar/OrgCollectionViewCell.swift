//
//  OrgCollectionViewCell.swift
//  HRMS
//
//  Created by Talib on 09/02/23.
//

import UIKit

class OrgCollectionViewCell: UICollectionViewCell {
    static let identifier = "OrgCell"
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewType: UIView!
    @IBOutlet weak var Content: UIView!
    @IBOutlet weak var lblSubHeadings: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewType.layer.cornerRadius = viewType.frame.height/2
    }

}
