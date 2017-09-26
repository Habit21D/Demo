//
//  ViewController.swift
//  YJCollectionFlowLayoutLeft
//
//  Created by apple on 2017/9/25.
//  Copyright © 2017年 jyn. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    lazy var collectionView: UICollectionView = {
       let layout = YJCollectionFlowLayoutLeft()
//        layout.left = 10
//        layout.right = 10
//        layout.space = 10
        let tempView = UICollectionView(frame: CGRect(x:0 , y: 64, width:SCWIDTH, height:SCHEIGHT - 64 ) , collectionViewLayout: layout)
        tempView.register(CouponCollectionViewCell.self, forCellWithReuseIdentifier: "CouponCollectionViewCell")
        tempView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: "TitleCollectionViewCell")
        tempView.register(FooterCollectionViewCell.self, forCellWithReuseIdentifier: "FooterCollectionViewCell")
        tempView.delegate = self
        tempView.dataSource = self
        return tempView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(collectionView)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell
        if indexPath.row == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell", for: indexPath)
        }else if(indexPath.row > 0 && indexPath.row < 8){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CouponCollectionViewCell", for: indexPath)
        }else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FooterCollectionViewCell", for: indexPath)

        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if indexPath.row == 0 {
            return CGSize(width: SCWIDTH - 20, height: 200)
        }else if (indexPath.row > 0 && indexPath.row < 8){
            return CGSize(width: SCWIDTH/2 - 15, height: 120)
        }else {
            return CGSize(width: SCWIDTH - 20, height: 500)

        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

