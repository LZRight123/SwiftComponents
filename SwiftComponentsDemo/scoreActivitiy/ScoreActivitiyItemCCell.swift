//
//  ScoreActivitiyItemCCell.swift
//  Deer
//
//  Created by liangze on 2020/7/24.
//  Copyright © 2020 zhuxiaoliang. All rights reserved.
//

import UIKit
private let margin: CGFloat = 16

class ScoreActivitiyItemCCell: UICollectionViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var remarksLabel: UILabel!
    
    @IBOutlet weak var countsLabel: UILabel!
    @IBOutlet weak var confimBtn: UIButton!
    
    @IBOutlet weak var lineWidth: NSLayoutConstraint!
    

    override var intrinsicContentSize: CGSize { .init(width: ScreenWidth - 2 * margin, height: UIView.noIntrinsicMetric) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundColor = .white
        lineWidth.constant = ScreenWidth - margin * 2 - 13 - 7.5
//        contentView.removeConstraint(lineWidth)
    }

}
