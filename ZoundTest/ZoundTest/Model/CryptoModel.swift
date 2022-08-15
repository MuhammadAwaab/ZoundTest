/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct CryptoModel : Codable {
	let symbol : String?
	let baseAsset : String?
	let quoteAsset : String?
	let openPrice : String?
	let lowPrice : String?
	let highPrice : String?
	let lastPrice : String?
	let volume : String?
	let bidPrice : String?
	let askPrice : String?
	let at : Int?

	enum CodingKeys: String, CodingKey {

		case symbol = "symbol"
		case baseAsset = "baseAsset"
		case quoteAsset = "quoteAsset"
		case openPrice = "openPrice"
		case lowPrice = "lowPrice"
		case highPrice = "highPrice"
		case lastPrice = "lastPrice"
		case volume = "volume"
		case bidPrice = "bidPrice"
		case askPrice = "askPrice"
		case at = "at"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
		baseAsset = try values.decodeIfPresent(String.self, forKey: .baseAsset)
		quoteAsset = try values.decodeIfPresent(String.self, forKey: .quoteAsset)
		openPrice = try values.decodeIfPresent(String.self, forKey: .openPrice)
		lowPrice = try values.decodeIfPresent(String.self, forKey: .lowPrice)
		highPrice = try values.decodeIfPresent(String.self, forKey: .highPrice)
		lastPrice = try values.decodeIfPresent(String.self, forKey: .lastPrice)
		volume = try values.decodeIfPresent(String.self, forKey: .volume)
		bidPrice = try values.decodeIfPresent(String.self, forKey: .bidPrice)
		askPrice = try values.decodeIfPresent(String.self, forKey: .askPrice)
		at = try values.decodeIfPresent(Int.self, forKey: .at)
	}

}
