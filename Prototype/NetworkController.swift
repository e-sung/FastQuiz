//
//  NetworkController.swift
//  Prototype
//
//  Created by esung on 2017. 10. 21..
//  Copyright © 2017년 esung. All rights reserved.
//

import Foundation
class NetworkController{

    static let main = NetworkController()
    private let slackWebHookURL = URL(string: "https://hooks.slack.com/services/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")!
    
    func sendNextSignal(){
        guard let url = URL(string: "http://192.168.0.35:3000/next") else {
            print("url wasn't made")
            return
        }
        let session = URLSession.shared
        session.dataTask(with: url).resume()
    }
    func sendPrevSignal(){
        guard let url = URL(string: "http://192.168.0.35:3000/prev") else {
            print("url wasn't made")
            return
        }
        let session = URLSession.shared
        session.dataTask(with: url).resume()
    }

    func sendOXQuiz(){
        let yesAction:Action = Action(name: "yes", text: "O", value: "yes")
        let noAction:Action = Action(name: "no", text: "X", value: "no")
        let attachment:Attachment = Attachment(text: "", callback_id: "quiz", actions: [yesAction,noAction])
        let aSlackMessage = SlackMessage(text: "<!channel> OX 퀴즈!", attachments: [attachment])
        
        guard let jsonToSend = try?JSONEncoder().encode(aSlackMessage) else{
            print("Encoding Error")
            return
        }
        
        var request = URLRequest(url: slackWebHookURL)
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpMethod = "POST"
        request.httpBody = jsonToSend
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request)
        dataTask.resume()
    }


}
