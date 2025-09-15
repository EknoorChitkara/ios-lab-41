//
//  dataModel.swift
//  HotelCodable
//
//  Created by Eknoor on 28/08/25.
//

import Foundation

struct RoomType: Equatable{
    var id: Int
    var name: String
    var shortName: String
    var price: Double
    
   static  func == (lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
    static var all: [RoomType]{
        return [
            RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 175.00),
            RoomType(id: 1, name: "One King", shortName: "K", price: 209.00),
            RoomType(id: 2, name: "Penthouse Suite", shortName: "PHS", price: 350.00),
            ]
    }
}

struct Registration{
    var firstName: String
    var lastName: String
    var email: String
    
    var checkInDate: Date
    var checkOutDate: Date
    var numOfAdults: Int
    var numOfChildren: Int
    
    var wifi: Bool
    var roomType: RoomType
}



