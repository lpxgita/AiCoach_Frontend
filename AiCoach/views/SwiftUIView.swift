//
//  SwiftUIView.swift
//  AiCoach
//
//  Created by 向鑫 on 8/27/24.
//

import SwiftUI

struct testContentView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)

            VStack {
                // 顶部状态栏
                HStack {
                    Text("19:00")
                        .font(Font.custom("SF Pro Text", size: 15).weight(.semibold))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Rectangle()
                            .frame(width: 22, height: 11.33)
                            .foregroundColor(.clear)
                            .cornerRadius(2.67)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2.67)
                                    .stroke(.white, lineWidth: 0.50)
                            )
                            .background(
                                Rectangle()
                                    .frame(width: 18, height: 7.33)
                                    .background(Color(red: 0.20, green: 0.78, blue: 0.35))
                                    .cornerRadius(1.33)
                            )
                        Rectangle()
                            .frame(width: 15.33, height: 11)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/15x11"))
                            )
                        Rectangle()
                            .frame(width: 17, height: 10.67)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/17x11"))
                            )
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color(red: 0.68, green: 0.71, blue: 0.75))
                
                Spacer(minLength: 100)
                
                // Logo
                AsyncImage(url: URL(string: "https://via.placeholder.com/95x96"))
                    .frame(width: 95.34, height: 96)
                
                Spacer(minLength: 50)
                
                // 输入框区域
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("邮箱")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(.black)
                        TextField("请输入你的邮箱", text: .constant(""))
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black.opacity(0.2), lineWidth: 0.5)
                            )
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text("密码")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(.black)
                        SecureField("请输入你的密码", text: .constant(""))
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black.opacity(0.2), lineWidth: 0.5)
                            )
                    }
                }
                .padding(.horizontal, 16)
                
                Spacer(minLength: 20)
                
                // 忘记密码与注册
                HStack {
                    Text("忘记密码？点击找回")
                        .font(Font.custom("Inter", size: 13).weight(.medium))
                        .foregroundColor(Color(red: 0.23, green: 0.45, blue: 1))
                    
                    Spacer()
                    
                    Text("新用户点击注册")
                        .font(Font.custom("Inter", size: 13).weight(.medium))
                        .foregroundColor(Color(red: 0.23, green: 0.45, blue: 1))
                }
                .padding(.horizontal, 16)
                
                Spacer(minLength: 20)
                
                // 按钮区域
                VStack(spacing: 16) {
                    Button(action: {
                        // 处理免费计划按钮点击事件
                    }) {
                        Text("免费开始你的健身计划")
                            .font(Font.custom("Inter", size: 15).weight(.semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.23, green: 0.45, blue: 1))
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        // 处理跳过计划按钮点击事件
                    }) {
                        Text("跳过计划，进入app")
                            .font(Font.custom("Inter", size: 15).weight(.semibold))
                            .foregroundColor(Color(red: 0.23, green: 0.45, blue: 1))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white.opacity(0.30))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(red: 0.23, green: 0.45, blue: 1), lineWidth: 0.5)
                            )
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 40)
            }
        }
        .frame(width: 430, height: 932)
    }
}

struct testContentView_Previews: PreviewProvider {
    static var previews: some View {
        testContentView()
    }
}
