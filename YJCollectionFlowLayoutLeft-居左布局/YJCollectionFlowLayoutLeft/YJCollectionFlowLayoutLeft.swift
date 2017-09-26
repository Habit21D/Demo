//
//  YJCollectionFlowLayoutLeft.swift
//  YJCollectionFlowLayoutLeft
//
//  Created by apple on 2017/9/25.
//  Copyright © 2017年 jyn. All rights reserved.
//

import UIKit

class YJCollectionFlowLayoutLeft: UICollectionViewFlowLayout {
    
    var left: CGFloat = 0
    var right: CGFloat = 0
    var space: CGFloat = 0
    var contentSizeHeight:CGFloat = 0
    override func prepare() {
        super.prepare()
        left = left > 0 ? left : 10
        right = right > 0 ? right : 10
        space = space > 0 ? space : 10
    }
    
    // 返回内容区域总大小，不是可见区域
    override var collectionViewContentSize: CGSize {
        get {
            return CGSize(width: (collectionView?.bounds.width)!, height:contentSizeHeight)
        }
        set {
            self.collectionViewContentSize = newValue
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attrsArr = super.layoutAttributesForElements(in: rect)
         let count = self.collectionView?.numberOfItems(inSection: 0) ?? 0

        guard var attrsArray = attrsArr else {
            return nil
        }
        for attr in attrsArray
        {
            if attr.representedElementKind == nil {
                
                if let tempAttr = self.layoutAttributesForItem(at: attr.indexPath),let index = attrsArray.index(of: attr) {
                   
                    attrsArray[index] = tempAttr
                }
            }
        }
        
        if (count > 0){
            contentSizeHeight = attrsArray[count - 1].frame.maxY
        }
        return attrsArray
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let rawAttr = super.layoutAttributesForItem(at: indexPath)
        let width = rawAttr?.frame.width ?? 0
        let height = rawAttr?.frame.height ?? 0
        let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        if indexPath.row == 0 {
            //当前cell为第一个
            attr.frame = CGRect(x: left, y:attr.frame.minY, width: width, height: height)
        }else {
            //上一个cell
            if let lastAttr = self.layoutAttributesForItem(at:IndexPath(item: indexPath.row - 1, section: 0)){
                //判断上一个cell后方是否还放得下当前cell
                if (lastAttr.frame.maxX + width + right + space <= self.collectionView?.bounds.width ?? 0){
                    //如果能放下
                    attr.frame = CGRect(x: lastAttr.frame.maxX + space, y: lastAttr.frame.minY, width: width, height: height)
                }else{
                    //如果不能放下另起一行
                    attr.frame = CGRect(x: left, y:lastAttr.frame.maxY + space, width: width, height:height)
                }
            }
        }
        
        return attr
    }
    
 
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
}
