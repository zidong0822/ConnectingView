//
//  ConnectSuccessView.swift
//  ConnectView
//
//  Created by harvey on 2019/3/1.
//  Copyright © 2019 harvey. All rights reserved.
//

import UIKit

class ConnectSuccessView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(rgba:"#FFA05A")
        addSubview(successCheck)
        addSubview(titleLabel)
        
    }
    
    override func layoutSubviews() {
        successCheck.snp.makeConstraints { (make) in
            make.width.height.equalTo(132)
            make.centerY.equalTo(snp.centerY)
            make.centerX.equalTo(snp.centerX).offset(-10)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(260)
            make.height.equalTo(22)
            make.top.equalTo(successCheck.snp.bottom).offset(40)
            make.centerX.equalTo(snp.centerX)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var successCheck:SuccessCheck = {
        let successCheck = SuccessCheck(frame:CGRect(x:0, y: 0, width: 132, height: 132))
        successCheck.layer.cornerRadius = 66
        successCheck.layer.masksToBounds = true
        successCheck.initWithTime(withDuration: 0.02, bgCcolor: UIColor(rgba:"#FF7D28"), colorOfStroke: .white, widthOfTick: 3){}
        return successCheck
    }()
    
    fileprivate lazy var titleLabel:UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize:16)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.text = "准备就绪，开始玩耍吧！"
        return titleLabel
    }()
    
}
