//
//  ShopByFebricCell.swift
//  PracticalTaskEastEarn
//
//  Created by Disha on 27/02/24.
//

import UIKit

class ShopByFebricCell: UICollectionViewCell {

    @IBOutlet weak var febtitleLabel: UILabel!
    @IBOutlet weak var febricImageView: UIImageView!
    @IBOutlet weak var febGradientView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.febricImageView.layer.cornerRadius = self.febricImageView.bounds.size.height / 2
        self.febGradientView.layer.cornerRadius = self.febricImageView.bounds.size.height / 2
        // Initialization code
    }
    
    func configureCell(_ object: ShopBy?) {
        self.febtitleLabel.text = object?.name
        self.febricImageView.sd_setImage(with: URL(string: object?.image ?? ""), placeholderImage: UIImage(named: "shopping-bag"))
        self.febricImageView.layer.cornerRadius = self.febricImageView.bounds.size.height / 2
        self.febGradientView.layer.cornerRadius = self.febricImageView.bounds.size.height / 2
    }
    
    func configureRangeOfCell(_ object: RangeOfPattern?) {
        self.febtitleLabel.text = object?.name
        self.febricImageView.sd_setImage(with: URL(string: object?.image ?? ""), placeholderImage: UIImage(named: "shopping-bag"))
        self.febricImageView.layer.cornerRadius = self.febricImageView.bounds.size.height / 2
        self.febGradientView.layer.cornerRadius = self.febricImageView.bounds.size.height / 2
    }

}
