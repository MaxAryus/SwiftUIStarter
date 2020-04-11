//
//  Login.swift
//  SwiftUIStarter
//
//  Created by Max Aryus on 16.03.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

let storedUsername = "Max Aryus"
let storedPassword = "12345"


struct ContentView: View {
    
    @State var username      = ""
    @State var userpassword  = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    @State var edetingMode: Bool = false
    
    var body: some View {
        
        ZStack{
            VStack{
                WelcomeText()
                UserImage()
                
                UsernameTextField(username: $username, editingMode: $edetingMode)
                PasswordSecureFile(password: $userpassword)
                
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                Button(action: {
                    if self.username == storedUsername && self.userpassword == storedPassword {
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false
                    } else {
                        self.authenticationDidFail = true
                        self.authenticationDidSucceed = false
                    }
                }) {
                    LoginButtonContent()
                }
                
            }
            .padding()
            if authenticationDidSucceed {
                FoodView()
            }
            
        }
        .offset(y: edetingMode ? -150 : 0)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}
struct UserImage: View {
    var body: some View {
        Image("profileImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150, alignment: .center)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
        
    }
    
}

struct UsernameTextField: View {
    @Binding var username: String
    @Binding var editingMode: Bool
   
    
    var body: some View {
        TextField("Username", text: $username, onEditingChanged: { edit in
            if edit {
                self.editingMode = true
            } else {
                self.editingMode = false
            }

        })
        .padding()
        .background(lightGreyColor)
        .cornerRadius(10.0)
        .padding(.bottom, 20)
    
    }
    
}

struct PasswordSecureFile: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(10.0)
            .padding(.bottom, 20)
    }
}
