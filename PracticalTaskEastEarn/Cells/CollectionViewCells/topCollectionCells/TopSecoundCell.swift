//
//  TopSecoundCell.swift
//  PracticalTaskEastEarn
//
//  Created by Disha on 26/02/24.
//

import UIKit

class TopSecoundCell: UICollectionViewCell {

    @IBOutlet weak var febricImageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var febDiscriptions: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ object: MainStickyMenu?) {
        self.febricImageView.sd_setImage(with: URL(string: object?.image ?? ""), placeholderImage: UIImage(named: "shopping-bag"))
        self.febDiscriptions.text = object?.title
    }

}
