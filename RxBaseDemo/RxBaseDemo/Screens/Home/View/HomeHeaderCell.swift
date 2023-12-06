//
//  HomeHeaderCell.swift
//  MilkeeDemo
//
//  Created by Thien.Vu2 on 07/12/2023.
//

import Foundation
import UIKit
import SnapKit

class HomeHeaderCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back!"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor.red
        return label
    }()
    
    private lazy var descriptionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Vu Hoang Thien"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor.red
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.red
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setupView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionsLabel)
        contentView.addSubview(confirmButton)
    }
    
    private func configureView() {
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 2.0
        contentView.layer.borderColor = UIColor.red.cgColor
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        descriptionsLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.width.equalTo(42)
            make.height.equalTo(19)
            make.centerX.equalToSuperview()
        }
        
        confirmButton.snp.makeConstraints { make in
            make.width.equalTo(105)
            make.height.equalTo(26)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-16)
        }
    }
}
