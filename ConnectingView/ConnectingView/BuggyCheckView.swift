//
//  BuggyView.swift
//  ConnectView
//
//  Created by harvey on 2019/3/1.
//  Copyright © 2019 harvey. All rights reserved.
//

import UIKit

class BuggyCheckView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(rgba:"#FFA05A")
        addSubview(tipLabel)
        addSubview(checkImageView)
    }
    
    override func layoutSubviews() {
        tipLabel.snp.makeConstraints { (make) in
            make.width.equalTo(114)
            make.height.equalTo(22)
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(27)
        }
        checkImageView.snp.makeConstraints { (make) in
            make.width.equalTo(256)
            make.height.equalTo(178)
            make.center.equalTo(snp.center)
        }
        
    }
    
    fileprivate lazy var tipLabel:UILabel = {
        let tipLabel = UILabel()
        tipLabel.font = UIFont.boldSystemFont(ofSize:16)
        tipLabel.textColor = .white
        tipLabel.textAlignment = .center
        tipLabel.adjustsFontSizeToFitWidth = true
        tipLabel.text = "小强正在体检中..."
        return tipLabel
    }()
    
    fileprivate lazy var checkImageView:UIImageView = {
        let checkImageView = UIImageView()
        var images = [UIImage]()
        for index in 0...39{
            images.append(UIImage(named:"icon_buggy_check\(index)")!)
        }
        checkImageView.animationImages = images
        checkImageView.startAnimating()
        return checkImageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
