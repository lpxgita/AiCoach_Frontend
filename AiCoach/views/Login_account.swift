import SwiftUI

struct MainContentView: View {

    
    var body: some View {
        NavigationView {
            ZStack {
                // 背景颜色
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack(spacing: 20) {
                        // 图像显示区域
                        Image("placeholder")
                            .frame(width: 95.17, height: 95.83)
                            .padding(.top,20)
                        
                        
                        
                        // 输入框区域
                        VStack(spacing: 20) {
                            VStack(alignment: .leading, spacing:6) {
                                Text("邮箱")
                                    .font(.system(size: 16))
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
                            
                            VStack(alignment: .leading, spacing:6) {
                                Text("密码")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                
                                SecureField("请输入你的密码", text: .constant(""))
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.black.opacity(0.2), lineWidth: 0.5)
                                    )
                                // 忘记密码与注册
                                HStack {
                                    Text("忘记密码？点击找回")
                                        .font(Font.custom("Inter", size: 13).weight(.medium))
                                        .foregroundColor(Color(red: 0.23, green: 0.45, blue: 1))
                                    
                                    Spacer()
                                    NavigationLink(destination: Login_account_2()) {
                                        Text("新用户点击注册")
                                            .font(Font.custom("Inter", size: 13).weight(.medium))
                                            .foregroundColor(Color(red: 0.23, green: 0.45, blue: 1))
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                    .padding(.horizontal, 32)
                    
                    Spacer()
                    
                    // 按钮区域
                    VStack(spacing: 16) {
                        Button(action: {
                            // 处理免费计划按钮点击事件
                        }) {
                            Text("免费开始你的健身计划")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        
                        //                    Button(action: {
                        //                        // 处理跳过计划按钮点击事件
                        //                    }) {
                        //                        Text("跳过计划，进入app")
                        //                            .font(.system(size: 15, weight: .semibold))
                        //                            .foregroundColor(Color.blue)
                        //                            .frame(maxWidth: .infinity)
                        //                            .padding()
                        //                            .background(Color.white)
                        //                            .cornerRadius(8)
                        //                            .overlay(
                        //                                RoundedRectangle(cornerRadius: 8)
                        //                                    .stroke(Color.blue, lineWidth: 0.5)
                        //                            )
                        //                    }
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 10)
                }
            }

        }
        .navigationBarBackButtonHidden(true) 
        .onTapGesture {
            // 点击空白处关闭键盘
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
