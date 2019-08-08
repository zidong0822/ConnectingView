//
//  UploadView.swift
//  ConnectView
//
//  Created by harvey on 2019/3/1.
//  Copyright © 2019 harvey. All rights reserved.
//

import UIKit

class UploadView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(checkImageView)
        addSubview(uploadProgess)
        addSubview(progressLabel)
    }
    
    override func layoutSubviews() {
        checkImageView.snp.makeConstraints { (make) in
            make.width.equalTo(256)
            make.height.equalTo(178)
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalTo(snp.centerY).offset(-30)
        }
        uploadProgess.snp.makeConstraints { (make) in
            make.width.equalTo(420)
            make.height.equalTo(14)
            make.centerX.equalTo(snp.centerX).offset(-30)
            make.top.equalTo(checkImageView.snp.bottom).offset(50)
        }
        progressLabel.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(20)
            make.left.equalTo(uploadProgess.snp.right).offset(20)
            make.centerY.equalTo(uploadProgess.snp.centerY)
        }
    }
    
    public func changeProgess(progess:Float){
        uploadProgess.progress = progess
        progressLabel.text = "\(Int(progess/100))%"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    fileprivate lazy var uploadProgess:UIProgressView = {
        let uploadProgess = UIProgressView()
        uploadProgess.trackTintColor = UIColor(rgba:"#F5F5F5")
        uploadProgess.progressTintColor = UIColor(rgba:"#FF7D28")
        uploadProgess.progress = 0
        uploadProgess.layer.cornerRadius = 7
        uploadProgess.layer.masksToBounds = true
        return uploadProgess
    }()
    
    fileprivate lazy var progressLabel:UILabel = {
        let progressLabel = UILabel()
        progressLabel.font = UIFont.boldSystemFont(ofSize:16)
        progressLabel.textColor = .white
        progressLabel.textAlignment = .center
        progressLabel.adjustsFontSizeToFitWidth = true
        progressLabel.text = "0%"
        return progressLabel
    }()

}
