/*
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Request : Codable {
	let title : String?
	let totalResults : String?
	let searchTerms : String?
	let count : Int?
	let startIndex : Int?
	let inputEncoding : String?
	let outputEncoding : String?
	let safe : String?
	let cx : String?

	enum CodingKeys: String, CodingKey {

		case title = "title"
		case totalResults = "totalResults"
		case searchTerms = "searchTerms"
		case count = "count"
		case startIndex = "startIndex"
		case inputEncoding = "inputEncoding"
		case outputEncoding = "outputEncoding"
		case safe = "safe"
		case cx = "cx"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try? values.decodeIfPresent(String.self, forKey: .title)
		totalResults = try? values.decodeIfPresent(String.self, forKey: .totalResults)
		searchTerms = try? values.decodeIfPresent(String.self, forKey: .searchTerms)
		count = try? values.decodeIfPresent(Int.self, forKey: .count)
		startIndex = try? values.decodeIfPresent(Int.self, forKey: .startIndex)
		inputEncoding = try? values.decodeIfPresent(String.self, forKey: .inputEncoding)
		outputEncoding = try? values.decodeIfPresent(String.self, forKey: .outputEncoding)
		safe = try? values.decodeIfPresent(String.self, forKey: .safe)
		cx = try? values.decodeIfPresent(String.self, forKey: .cx)
	}

}
