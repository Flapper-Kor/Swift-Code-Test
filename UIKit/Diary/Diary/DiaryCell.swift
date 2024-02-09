//
//  DiaryCell.swift
//  Diary
//
//  Created by 이희웅 on 2023/05/29.
//

import UIKit

class DiaryCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
//    required init?(coder:NSCoder){
//        super.init(coder: coder)
//        self.contentView.layer.cornerRadius = 3.0
//        self.contentView.layer.borderWidth = 1.0
//        self.contentView.layer.borderColor = UIColor.black.cgColor
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.contentView.layer.cornerRadius = 3.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.black.cgColor
    }
}
