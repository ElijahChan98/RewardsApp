//
//  RewardsCell.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class RewardsCell: UITableViewCell {
    @IBOutlet weak var rewardImage: UIImageView!
    @IBOutlet weak var rewardName: UILabel!
    
    var onReuse: () -> Void = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        contentView.backgroundColor = UIColor.white
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 0.1
        contentView.layer.cornerRadius = 2
        contentView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        onReuse()
        rewardImage.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
