//
//  CoachChat.swift
//  AiCoach
//
//  Created by 向鑫 on 8/28/24.
//
import Foundation
import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool // 用于区分用户和AI
    let timestamp: Date
}

class CoachChatModel: ObservableObject {
    @Published var messages: [Message] = [
        Message(text: "你好，我是Adam", isUser: false, timestamp: Date()),
        Message(text: "你好，我向鑫", isUser: true, timestamp: Date()),
        Message(text: "这是帮你规划的日程安排", isUser: false, timestamp: Date()),
        Message(text: "今天的感觉如何？", isUser: false, timestamp: Date()),
        Message(text: "今天你做俯卧撑了吗", isUser: false, timestamp: Date())
    ]
    
    func sendMessage(_ text: String) {
        let message = Message(text: text, isUser: true, timestamp: Date())
        messages.append(message)
        
        // 模拟AI回复
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let reply = Message(text: "这是AI的回复", isUser: false, timestamp: Date())
            self.messages.append(reply)
        }
    }
}


struct CoachChatView: View {
    @StateObject private var viewModel = CoachChatModel()
    @State private var messageText = ""

    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages) { message in
                    MessageView(message: message)
                }
            }
            .padding(.horizontal)
            
            HStack {
                TextField("Write your message", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Button(action: {
                    viewModel.sendMessage(messageText)
                    messageText = ""
                }) {
                    Image(systemName: "paperplane.fill")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationBarTitle("Adam", displayMode: .inline)
    }
}

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.leading, 50)
            } else {
                Text(message.text)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.trailing, 50)
                Spacer()
            }
        }
        .padding(.vertical, 2)
    }
}

struct CoachChatView_Previews: PreviewProvider {
    static var previews: some View {
        CoachChatView()
    }
}
