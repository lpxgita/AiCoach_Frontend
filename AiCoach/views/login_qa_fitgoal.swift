//
//  login_qa_fitgoal.swift
//  AiCoach
//
//  Created by 向鑫 on 8/27/24.
//
//TODO: 这个状态栏应该是系统插件，不是画的，解决
import SwiftUI

struct Login_fitgoal: View {
    var body: some View {
        ZStack {
            // 背景颜色
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // 问题标题
                Text("请问的你的健身目标是什么？")
                    .font(.system(size: 36, weight: .medium))
                    .foregroundColor(.black)
                    .padding(.bottom, 20)
                
                // 图片部分
                AsyncImage(url: URL(string: "https://via.placeholder.com/430x135"))
                    .frame(width: 430, height: 135)
                    .padding(.bottom, 20)
                
                // 答案选项
                VStack(spacing: 16) {
                    OptionView(text: "A. 良好的健康和身体状态")
                    OptionView(text: "B. 增肌")
                    OptionView(text: "C. 减脂")
                }
                .padding(.horizontal, 16)
                
                Spacer()
                
                // 跳过按钮和进度
                HStack {
                    Text("Skip")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(red: 0.38, green: 0.62, blue: 1))
                    
                    Spacer()
                    
                    Text("1/10")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.black)
                }
                .padding([.leading, .trailing], 16)
                .padding(.bottom, 20)
                
                // 继续按钮
                Button(action: {
                    // 继续按钮的操作
                }) {
                    Text("继续")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(12)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            }
        }
    }
}



// 自定义视图：选项视图
struct OptionView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 22, weight: .medium))
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black.opacity(0.3), lineWidth: 0.25)
            )
            .padding(.horizontal)
    }
}

struct Login_fitgoal_Previews: PreviewProvider {
    static var previews: some View {
        Login_fitgoal()
    }
}

