//
//  ItemCell.swift
//  ZoundTest
//
//  Created by Muhammad Oneeb on 14/08/2022.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var cryptoDescription: UILabel!
    @IBOutlet weak var lowPriceLabel: UILabel!
    @IBOutlet weak var highPriceLabel: UILabel!
    @IBOutlet weak var changePercentageLabel: UILabel!
    @IBOutlet weak var coloredView: UIView!
    
    
    var cellViewModel: ItemViewModelProtocol? {
        didSet {
            self.cryptoName.text = cellViewModel?.currencyNameForDisplay()
            self.currencyLabel.text = cellViewModel?.getCurrencyLabel()
            self.cryptoDescription.text = cellViewModel?.currencyDescForDisplay()
            self.lowPriceLabel.text = cellViewModel?.getLowPriceToDipslay()
            self.highPriceLabel.text = cellViewModel?.getHighPriceToDisplay()
            self.changePercentageLabel.text = cellViewModel?.getCurrentOpenPrice()
            self.coloredView.backgroundColor = cellViewModel?.isOpenPriceLowerThanLastPrice() ?? true ? #colorLiteral(red: 0.7882352941, green: 0, blue: 0.07843137255, alpha: 1) : #colorLiteral(red: 0, green: 0.7333333333, blue: 0.3647058824, alpha: 1)
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
