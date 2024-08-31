//
//  Login_account_2.swift
//  AiCoach
//
//  Created by 向鑫 on 8/27/24.
//

import SwiftUI

struct Login_account_2: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    VStack(spacing: 16) {
                        
                        
                        // 图像
                        Image("placeholder")
                            .frame(width: 95.34, height: 96)
                            .padding(.top, 20) // 增加上方间距
                        
                        // 输入框区域
                        VStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("你的邮箱")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                
                                TextField("请输入你的邮箱", text:$email)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.black.opacity(0.2), lineWidth: 0.5)
                                    )
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("你的密码")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                
                                SecureField("请输入你的密码", text: $password)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.black.opacity(0.2), lineWidth: 0.5)
                                    )
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("请重新输入你的密码")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                
                                SecureField("请输入你的密码", text: $confirmPassword)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.black.opacity(0.2), lineWidth: 0.5)
                                    )
                                
                                HStack {
                                    Spacer()
                                    NavigationLink(destination: MainContentView()) {
                                        Text("已有账户，点击登录")
                                            .font(Font.custom("Inter", size: 13).weight(.medium))
                                            .foregroundColor(Color(red: 0.23, green: 0.45, blue: 1))
                                    }
                                }
                                
                            }
                            
                        }
                    }
                    .padding(.horizontal, 32)
                    
                    Spacer()
                    
                    // 注册按钮
                    Button(action: {
                        registerUser(email: email, password: password)
                    }) {
                        Text("注册")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.23, green: 0.45, blue: 1))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 10) // 增加底部间距
                }
            }
        }
        .navigationBarBackButtonHidden(true) // 隐藏返回按钮
        .onTapGesture {
            // 点击空白处关闭键盘
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
    
    func registerUser(email: String, password: String) {
        guard let url = URL(string: "http://yourbackendapi.com/register") else { return }
        let body: [String: String] = ["email": email, "password": password]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("User registered successfully!")
            } else {
                print("Registration failed.")
            }
        }.resume()
    }
}

struct Login_account_2_Previews: PreviewProvider {
    static var previews: some View {
        Login_account_2()
    }
}
