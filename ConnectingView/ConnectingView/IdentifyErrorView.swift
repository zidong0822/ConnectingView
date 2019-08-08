//
//  IdentifyErrorView.swift
//  ConnectView
//
//  Created by harvey on 2019/3/1.
//  Copyright © 2019 harvey. All rights reserved.
//

import UIKit
@objc public protocol IdentifyErrorViewDelegate: class {
    @objc optional func retryConnect()
}
class IdentifyErrorView: UIView {

    var delegate:IdentifyErrorViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tipLabel)
        addSubview(identifyErrorImageView)
        addSubview(waringLabel)
        addSubview(retryButton)
    }
    
    override func layoutSubviews() {
        tipLabel.snp.makeConstraints { (make) in
            make.width.equalTo(114)
            make.height.equalTo(22)
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(27)
        }
        identifyErrorImageView.snp.makeConstraints { (make) in
            make.width.equalTo(148)
            make.height.equalTo(121)
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(tipLabel.snp.bottom).offset(50)
        }
        waringLabel.snp.makeConstraints { (make) in
            make.width.equalTo(215)
            make.height.equalTo(22)
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(identifyErrorImageView.snp.bottom).offset(30)
        }
        retryButton.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(38)
            make.top.equalTo(waringLabel.snp.bottom).offset(10)
            make.centerX.equalTo(snp.centerX)
        }
    }
    
    fileprivate lazy var identifyErrorImageView:UIImageView = {
        let identifyErrorImageView = UIImageView()
        identifyErrorImageView.image = UIImage(named:"icon_buggy_identify_error")
        return identifyErrorImageView
    }()
    
    fileprivate lazy var tipLabel:UILabel = {
        let tipLabel = UILabel()
        tipLabel.font = UIFont.boldSystemFont(ofSize:16)
        tipLabel.textColor = .white
        tipLabel.textAlignment = .center
        tipLabel.adjustsFontSizeToFitWidth = true
        tipLabel.text = "小强识别有误！"
        return tipLabel
    }()
    
    fileprivate lazy var waringLabel:UILabel = {
        let waringLabel = UILabel()
        waringLabel.textColor = .white
        waringLabel.font = UIFont.boldSystemFont(ofSize:16)
        waringLabel.textAlignment = .center
        waringLabel.adjustsFontSizeToFitWidth = true
        waringLabel.text = "请关闭电源重新打开！"
        return waringLabel
    }()
    
    fileprivate lazy var retryButton:UIButton = {
        let retryButton = UIButton()
        retryButton.backgroundColor = UIColor(rgba:"#FF7D28")
        retryButton.layer.cornerRadius = 19
        retryButton.setTitle("再试一次", for: .normal)
        retryButton.setTitleColor(.white, for: .normal)
        retryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize:14)
        retryButton.addTarget(self, action: #selector(retryConnect), for: .touchUpInside)
        return retryButton
    }()
    
    @objc func retryConnect(){
        delegate?.retryConnect?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
