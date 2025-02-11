//
//  MyLocation.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//
import Foundation
struct MyLocation : Codable{
    var name:String?
    var region:String?
    var country:String?
    var lat:Double?
    var lon:Double?
    var tz_id:String?
    var localtime_epoch:Int64?
    var localtime:String?
}
