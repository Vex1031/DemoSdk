//
//  BroadCastTableCell.swift
//  DemoSdk
//
//  Created by vex on 2022/04/11.
//

import UIKit
import SnapKit

final class BroadCastTableCell : UITableViewCell {
    
    var broadcastLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    var thumnailImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var statusLabel : UILabel = {
        let label = UILabel()
        label.text = "방송중"
        return label
    }()
    
    var scheduleLabel : UILabel = {
        let label = UILabel()
        label.text = "2020.12.05"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(thumnailImage)
        self.addSubview(broadcastLabel)
        self.addSubview(statusLabel)
        self.addSubview(scheduleLabel)
        setScheduleLabel()
        setBroadcsetLabel()
        setThumnailImage()
        setStatusLabel()
    }
    
    private func setBroadcsetLabel() {
        broadcastLabel.snp.makeConstraints{make in
            make.leading.equalTo(thumnailImage.snp.trailing).offset(12)
            make.top.equalToSuperview().offset(8)
        }
    }
    
    private func setThumnailImage() {
        thumnailImage.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(24)
            make.width.height.equalTo(90)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setStatusLabel() {
        statusLabel.snp.makeConstraints{ make in
            make.top.equalTo(broadcastLabel.snp.bottom).offset(12)
            make.leading.equalTo(thumnailImage.snp.trailing).offset(12)
        }
    }
    private func setScheduleLabel() {
        scheduleLabel.snp.makeConstraints{make in
            make.top.equalTo(statusLabel.snp.bottom).offset(12)
            make.leading.equalTo(thumnailImage.snp.trailing).offset(12)
        }
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
