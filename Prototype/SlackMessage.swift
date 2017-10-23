//
//  SlackMessage.swift
//  Prototype
//
//  Created by esung on 2017. 10. 21..
//  Copyright © 2017년 esung. All rights reserved.
//

import Foundation
struct SlackMessage:Codable{
    let text:String
    let attachments:[Attachment]
}

struct Attachment:Codable{
    let text:String
    let callback_id:String
    let attachment_type:String = "default"
    let actions:[Action]
}

struct Action:Codable{
    let name:String
    let text:String
    let type:String = "button"
    let value:String
}
