//
//  BuggyBreakView.swift
//  ConnectView
//
//  Created by harvey on 2019/3/1.
//  Copyright © 2019 harvey. All rights reserved.
//
import UIKit
@objc public protocol BuggyBreakViewDelegate: class {
    @objc optional func retryControl()
}
class BuggyBreakView: UIView {

    var delegate:BuggyBreakViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(rgba:"#FFA05A")
        addSubview(tipLabel)
        addSubview(breakImageView)
        addSubview(retryButton)
    }
    
    override func layoutSubviews() {
        tipLabel.snp.makeConstraints { (make) in
            make.width.equalTo(260)
            make.height.equalTo(22)
            make.top.equalTo(27)
            make.centerX.equalTo(snp.centerX)
        }
        breakImageView.snp.makeConstraints { (make) in
            make.width.equalTo(268)
            make.height.equalTo(176)
            make.top.equalTo(tipLabel.snp.bottom).offset(30)
            make.centerX.equalTo(snp.centerX)
        }
        
        retryButton.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(38)
            make.top.equalTo(breakImageView.snp.bottom).offset(30)
            make.centerX.equalTo(snp.centerX)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var tipLabel:UILabel = {
        let tipLabel = UILabel()
        tipLabel.font = UIFont.boldSystemFont(ofSize:16)
        tipLabel.textColor = .white
        tipLabel.textAlignment = .center
        tipLabel.adjustsFontSizeToFitWidth = true
        tipLabel.text = "线缆未插好！"
        return tipLabel
    }()
    
    fileprivate lazy var breakImageView:UIImageView = {
        let breakImageView = UIImageView()
        breakImageView.image = UIImage(named:"icon_buggy_break")
        return breakImageView
    }()
    
    fileprivate lazy var retryButton:UIButton = {
        let retryButton = UIButton()
        retryButton.backgroundColor = UIColor(rgba:"#FF7D28")
        retryButton.layer.cornerRadius = 19
        retryButton.setTitle("再试一次", for: .normal)
        retryButton.setTitleColor(.white, for: .normal)
        retryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize:14)
        retryButton.addTarget(self, action: #selector(retryControl), for: .touchUpInside)
        return retryButton
    }()
    
    @objc func retryControl(){
        delegate?.retryControl?()
    }
}
