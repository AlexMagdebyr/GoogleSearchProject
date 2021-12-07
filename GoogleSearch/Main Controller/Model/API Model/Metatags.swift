/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

//import Foundation
//struct Metatags : Codable {
//	let og:image : String?
//	let apple-itunes-app : String?
//	let og:image:width : String?
//	let twitter:card : String?
//	let og:site_name : String?
//	let applicable-device : String?
//	let og:image:type : String?
//	let og:description : String?
//	let og:image:secure_url : String?
//	let twitter:image : String?
//	let web-experience-app/config/environment : String?
//	let twitter:image:alt : String?
//	let twitter:site : String?
//	let og:image:alt : String?
//	let og:type : String?
//	let twitter:title : String?
//	let og:title : String?
//	let og:image:height : String?
//	let version : String?
//	let fb:app_id : String?
//	let viewport : String?
//	let ac-gn-search-suggestions-enabled : String?
//	let twitter:description : String?
//	let og:locale : String?
//	let og:url : String?
//	let apple:content_id : String?
//
//	enum CodingKeys: String, CodingKey {
//
//		case og:image = "og:image"
//		case apple-itunes-app = "apple-itunes-app"
//		case og:image:width = "og:image:width"
//		case twitter:card = "twitter:card"
//		case og:site_name = "og:site_name"
//		case applicable-device = "applicable-device"
//		case og:image:type = "og:image:type"
//		case og:description = "og:description"
//		case og:image:secure_url = "og:image:secure_url"
//		case twitter:image = "twitter:image"
//		case web-experience-app/config/environment = "web-experience-app/config/environment"
//		case twitter:image:alt = "twitter:image:alt"
//		case twitter:site = "twitter:site"
//		case og:image:alt = "og:image:alt"
//		case og:type = "og:type"
//		case twitter:title = "twitter:title"
//		case og:title = "og:title"
//		case og:image:height = "og:image:height"
//		case version = "version"
//		case fb:app_id = "fb:app_id"
//		case viewport = "viewport"
//		case ac-gn-search-suggestions-enabled = "ac-gn-search-suggestions-enabled"
//		case twitter:description = "twitter:description"
//		case og:locale = "og:locale"
//		case og:url = "og:url"
//		case apple:content_id = "apple:content_id"
//	}
//
//	init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//		og:image = try values.decodeIfPresent(String.self, forKey: .og:image)
//		apple-itunes-app = try values.decodeIfPresent(String.self, forKey: .apple-itunes-app)
//		og:image:width = try values.decodeIfPresent(String.self, forKey: .og:image:width)
//		twitter:card = try values.decodeIfPresent(String.self, forKey: .twitter:card)
//		og:site_name = try values.decodeIfPresent(String.self, forKey: .og:site_name)
//		applicable-device = try values.decodeIfPresent(String.self, forKey: .applicable-device)
//		og:image:type = try values.decodeIfPresent(String.self, forKey: .og:image:type)
//		og:description = try values.decodeIfPresent(String.self, forKey: .og:description)
//		og:image:secure_url = try values.decodeIfPresent(String.self, forKey: .og:image:secure_url)
//		twitter:image = try values.decodeIfPresent(String.self, forKey: .twitter:image)
//		web-experience-app/config/environment = try values.decodeIfPresent(String.self, forKey: .web-experience-app/config/environment)
//		twitter:image:alt = try values.decodeIfPresent(String.self, forKey: .twitter:image:alt)
//		twitter:site = try values.decodeIfPresent(String.self, forKey: .twitter:site)
//		og:image:alt = try values.decodeIfPresent(String.self, forKey: .og:image:alt)
//		og:type = try values.decodeIfPresent(String.self, forKey: .og:type)
//		twitter:title = try values.decodeIfPresent(String.self, forKey: .twitter:title)
//		og:title = try values.decodeIfPresent(String.self, forKey: .og:title)
//		og:image:height = try values.decodeIfPresent(String.self, forKey: .og:image:height)
//		version = try values.decodeIfPresent(String.self, forKey: .version)
//		fb:app_id = try values.decodeIfPresent(String.self, forKey: .fb:app_id)
//		viewport = try values.decodeIfPresent(String.self, forKey: .viewport)
//		ac-gn-search-suggestions-enabled = try values.decodeIfPresent(String.self, forKey: .ac-gn-search-suggestions-enabled)
//		twitter:description = try values.decodeIfPresent(String.self, forKey: .twitter:description)
//		og:locale = try values.decodeIfPresent(String.self, forKey: .og:locale)
//		og:url = try values.decodeIfPresent(String.self, forKey: .og:url)
//		apple:content_id = try values.decodeIfPresent(String.self, forKey: .apple:content_id)
//	}
//
//}
