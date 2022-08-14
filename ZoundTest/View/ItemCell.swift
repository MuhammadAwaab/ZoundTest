//
//  ItemCell.swift
//  ZoundTest
//
//  Created by Muhammad Oneeb on 14/08/2022.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var cryptoName: UILabel!
    
    
    var cellViewModel: ItemViewModelProtocol? {
        didSet {
            self.cryptoName.text = cellViewModel?.currencyNameForDisplay()
        }
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
