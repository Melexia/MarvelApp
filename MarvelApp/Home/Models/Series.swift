 //
 //
 // Series.swift
 // MarvelApp
 //
 // Using Swift 5.0
 //
 // Created by Andrea Sánchez Román on 28/09/21.
 // Copyright (c) 2021 and Confidential to Melexia All rights reserved.
 //

import Foundation
import ObjectMapper

struct Series : Mappable {
	var available : Int?
	var collectionURI : String?
	var items : [Items]?
	var returned : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		available <- map["available"]
		collectionURI <- map["collectionURI"]
		items <- map["items"]
		returned <- map["returned"]
	}

}
