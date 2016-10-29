//
//  ViewController.swift
//  todo_withoutstoryboard
//
//  Created by Ashari Juang on 7/18/16.
//  Copyright © 2016 letsbuildtheapp. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "To-do list"
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.alwaysBounceVertical = true
        collectionView?.registerClass(TaskCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView?.registerClass(TaskHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let taskCell = collectionView.dequeueReusableCellWithReuseIdentifier("cellid", forIndexPath: indexPath) as! TaskCell
        taskCell.nameLabel.text = "Sample Task \(indexPath.item)"
        return taskCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, 50)
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "headerId", forIndexPath: indexPath)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(view.frame.width, 100)
    }
    
}

class TaskHeader : BaseCell{
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Header"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFontOfSize(14)
        return label
    }()
    
    override func setupViews() {
        
        addSubview(nameLabel)
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    }
}

class TaskCell : BaseCell {
        
        let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Sample Task"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFontOfSize(14)
            return label
        }()
        
        override func setupViews() {
        
            addSubview(nameLabel)
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        }
}

class BaseCell : UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}

