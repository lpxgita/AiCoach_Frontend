//
//  CoachChat2.swift
//  AiCoach
//
//  Created by 向鑫 on 8/30/24.
//

import SwiftUI

struct CoachChat2: View {
    @State private var messages: [CoachChat2Message] = [
        CoachChat2Message(text: "你好，我是Adam", isUser: false),
        CoachChat2Message(text: "今天的感觉如何？", isUser: false),
        CoachChat2Message(text: "今天你做俯卧撑了吗", isUser: false)
    ]
    @State private var newMessage: String = ""
    
    var body: some View {
        VStack {
            // 顶部导航栏
            HStack {
                Button(action: {
                    // 返回按钮的动作
                }) {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                }
                Spacer()
                VStack {
                    Text("Adam")
                        .font(Font.custom("Poppins", size: 16).weight(.medium))
                        .foregroundColor(Color(red: 0, green: 0.05, blue: 0.03))
                    HStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 10, height: 10)
                        Text("正在休息")
                            .font(Font.custom("Poppins", size: 12))
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .resizable()
                    .frame(width: 20, height: 5)
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            
            // 消息显示部分
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(messages) { message in
                        HStack {
                            if message.isUser {
                                Spacer()
                                Text(message.text)
                                    .padding(10)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 46, height: 46)
                            } else {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 46, height: 46)
                                Text(message.text)
                                    .padding(10)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                Spacer()
                            }
                        }
                    }
                }
                .padding()
            }
            
            // 输入框部分
            HStack {
                TextField("Write your message", text: $newMessage)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button(action: {
                    sendMessage()
                }) {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(Color.white)
        }
    }
    
    func sendMessage() {
        if !newMessage.isEmpty {
            let userMessage = CoachChat2Message(text: newMessage, isUser: true)
            messages.append(userMessage)
            newMessage = ""
            
            // 调用AI回复
            getAIReply(for: userMessage.text)
        }
    }
    
    func getAIReply(for userInput: String) {
        // 构建请求
        guard let url = URL(string: "https://your-ai-api.com/reply") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // 将用户输入转为JSON格式
        let body: [String: Any] = ["message": userInput]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        // 执行网络请求
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            
            // 解析AI回复
            if let aiResponse = try? JSONDecoder().decode(AIResponse.self, from: data) {
                DispatchQueue.main.async {
                    let botMessage = CoachChat2Message(text: aiResponse.reply, isUser: false)
                    messages.append(botMessage)
                }
            }
        }.resume()
    }
}

struct CoachChat2Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct AIResponse: Decodable {
    let reply: String
}

struct CoachChat2_Previews: PreviewProvider {
    static var previews: some View {
        CoachChat2()
    }
}
