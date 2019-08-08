//
//  ConnecTimeOutView.swift
//  ConnectView
//
//  Created by harvey on 2019/3/1.
//  Copyright © 2019 harvey. All rights reserved.
//

import UIKit
import SnapKit
@objc public protocol ConnecTimeOutViewDelegate: class {
    @objc optional func retryConnect()
}
class ConnecTimeOutView: UIView {

    var delegate:ConnecTimeOutViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(rgba:"#FFA05A")
        addSubview(tipLabel)
        addSubview(timeOutImageView)
        addSubview(waringLabel)
        addSubview(retryButton)
    }
    
    override func layoutSubviews() {
        tipLabel.snp.makeConstraints { (make) in
            make.width.equalTo(260)
            make.height.equalTo(22)
            make.top.equalTo(27)
            make.centerX.equalTo(snp.centerX)
        }
        timeOutImageView.snp.makeConstraints { (make) in
            make.width.equalTo(364)
            make.height.equalTo(184)
            make.top.equalTo(tipLabel.snp.bottom).offset(20)
            make.centerX.equalTo(snp.centerX)
        }
        waringLabel.snp.makeConstraints { (make) in
            make.width.equalTo(467)
            make.height.equalTo(22)
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(timeOutImageView.snp.bottom).offset(20)
        }
        retryButton.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(38)
            make.top.equalTo(waringLabel.snp.bottom).offset(10)
            make.centerX.equalTo(snp.centerX)
        }
    }
    
    fileprivate lazy var timeOutImageView:UIImageView = {
        let timeOutImageView = UIImageView()
        timeOutImageView.image = UIImage(named:"icon_connect_timeout")
        return timeOutImageView
    }()
    
    fileprivate lazy var tipLabel:UILabel = {
        let tipLabel = UILabel()
        tipLabel.font = UIFont.boldSystemFont(ofSize:16)
        tipLabel.textColor = .white
        tipLabel.textAlignment = .center
        tipLabel.adjustsFontSizeToFitWidth = true
        tipLabel.text = "蓝牙连接超时！"
        return tipLabel
    }()
    
    fileprivate lazy var waringLabel:UILabel = {
        let waringLabel = UILabel()
        waringLabel.textColor = .white
        waringLabel.font = UIFont.boldSystemFont(ofSize:16)
        waringLabel.textAlignment = .center
        waringLabel.adjustsFontSizeToFitWidth = true
        waringLabel.text = "若小强电源未开启，请打开电源；若电源已开启，请重启电源！"
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
