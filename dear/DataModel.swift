//
//  User.swift
//  dear
//
//  Created by kyungtaek on 2017. 2. 15..
//  Copyright © 2017년 sicamp. All rights reserved.
//

import Foundation
import RealmSwift

//class RealmString: Object {
//    dynamic var rawValue = ""
//}

class Receiver: Object {
    dynamic var receiverID = ""
    dynamic var name = ""
    dynamic var phoneNumber = ""

    override class func primaryKey() -> String? {
        return "receiverID"
    }
}

class User: Object {
    dynamic var userName: String = ""
    dynamic var password: String = ""
    dynamic var phoneNumber: String = ""
    dynamic var birthDay: Double = 0
    dynamic var deviceToken: String = ""
    dynamic var profileImageUrl: String = ""
    dynamic var pushDuration: Double = 60*60*24
    dynamic var lastLoginAlarmDuration: Double = 60*60*24*365
    dynamic var isDead: Bool = false
    dynamic var readKey: String = ""
    let receivers = List<Receiver>()

    override class func primaryKey() -> String? {
        return "phoneNumber"
    }
}

class Answer: Object {
    dynamic var answerID: String = ""
    dynamic var answerText: String?
    dynamic var answerPhoto: String?
    dynamic var answerVideo: String?
    dynamic var lastUpdate: Double = 0

    private let SEPARATOR = "||"

//    dynamic var combinedReceiverIDs: String? = nil
//    var receivers: [String] {
//        get {
//            guard let perms = self.combinedReceiverIDs else { return [] }
//            return perms.components(separatedBy: SEPARATOR)
//        }
//        set {
//            combinedReceiverIDs = newValue.count > 0 ? newValue.joined(separator:SEPARATOR) : nil
//        }
//    }
//
//    override static func ignoredProperties() -> [String] {
//        return ["receivers"]
//    }

    let receiverObjects = List<Receiver>()
    var receivers: [String] {
        get {
            return []
        }
        set {
            for receiverID in newValue {
                if let receiver = DataSource.instance.fetchReceiver(receiverID: receiverID) {
                    self.receiverObjects.append(receiver)
                }
            }
        }
    }

    override static func ignoredProperties() -> [String] {
        return ["receivers"]
    }

    override class func primaryKey() -> String? {
        return "answerID"
    }
}

class WillItem: Object {
    dynamic var willItemID: String = ""
    dynamic var questionID: String = ""
    dynamic var question: String = ""
    dynamic var lastUpdate: Double = 0

    let answers = List<Answer>()

    override class func primaryKey() -> String? {
        return "willItemID"
    }
}