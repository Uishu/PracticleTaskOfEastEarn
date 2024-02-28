//
//  CategoryCell.swift
//  PracticalTaskEastEarn
//
//  Created by Disha on 27/02/24.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var downImageView: UIImageView!
    @IBOutlet weak var cattitle: UILabel!
    @IBOutlet weak var categoryView: CornerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.categoryView.rightTopRadius = self.categoryView.frame.height / 2
        self.categoryView.rightBottomRadius = self.categoryView.frame.height / 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
