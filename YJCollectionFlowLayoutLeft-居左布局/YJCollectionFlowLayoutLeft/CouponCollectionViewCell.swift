//
//  CouponCollectionViewCell.swift
//  YJCollectionFlowLayoutLeft
//
//  Created by apple on 2017/9/25.
//  Copyright © 2017年 jyn. All rights reserved.
//

import UIKit

class CouponCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
