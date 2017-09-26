//
//  TitleCollectionViewCell.swift
//  YJCollectionFlowLayoutLeft
//
//  Created by apple on 2017/9/25.
//  Copyright © 2017年 jyn. All rights reserved.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor.cyan
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
