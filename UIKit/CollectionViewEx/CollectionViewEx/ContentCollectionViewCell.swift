//
//  ContentCollectionViewCell.swift
//  CollectionViewEx
//
//  Created by Slash on 2023/07/27.
//

import UIKit
import SnapKit

class ContentCollectionViewCell: UICollectionViewCell{
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // superview의 엣지에 맞게
        }
        
    }
}
