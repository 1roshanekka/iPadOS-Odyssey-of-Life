//
//  LoginView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 02/04/24.
//
import Foundation
import SwiftUI

struct LoginView: View {
    @State var loginEmail: String = ""
    @State var pass: String = ""
    var body: some View {
        
        //header
        VStack{
            
//            Image("loginScene")
//                .resizable()
//                .scaledToFill()
//                .blur(radius: 0.9)
            VStack{
                Text("Welcome Back !")
                    .font(.system(size: 50))
                    .bold()
            }
            .padding(.top, 100)
            Spacer()
            Text("")
        }
        .foregroundStyle(Color(.red))
        
        //login form
        
        ZStack{
            VStack{

                TextField("Email", text: $loginEmail)
                    .font(.subheadline)
                    .padding(12)
#if os(iOS)
                    .background(Color(uiColor: .systemGray6))
#else
#endif
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                SecureField ("Password", text: $pass)
                    .font(.subheadline)
                    .padding(12)
#if os(iOS)
                    .background(Color(uiColor: .systemGray6))
#else
#endif
//                    .background(Color.systemGray6)
//                    .background(Color(uiColor: .systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                
                
                Button{
                    // function to login
                } label: {
                    Text("Log in")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 345, height: 40)
                        .background(.blue)
                        .cornerRadius(10)
                    
                }
                .padding(.top, 20)
                
                Spacer()
                
                Divider()
                
                NavigationLink{
                    Text("Registration")
                } label: {
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign Up")
                    }
                    .font(.footnote)
                }
                .foregroundColor(.blue)
                .padding(.vertical, 16)
                
                
            }
        }
        
        //create account
        
        
    }
}

#Preview {
    LoginView()
}
