//
//  ContentView.swift
//  Instagram Clone
//
//  Created by Cameron Montesano on 11/21/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // navigation bar
            HStack {
                // instagram logo
                Image("instagram_logo_dark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .padding(.leading)
                
                
                Spacer()
                
                // menu options
                HStack(spacing: 25) {
                    NavMenuButton(returnText: "pressed new post button", imageName: "plus.app")
                    NavMenuButton(returnText: "pressed like button", imageName: "heart")
                    NavMenuButton(returnText: "pressed convos button", imageName: "paperplane")
                }
                .padding()
            } // end navBar
            
            ScrollView {
                // stories
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                        Spacer()
                            .padding(5)
                        
                        UserProfile(username: "ckmontesano", returnText: "user profile pressed", imageName: "UserProfile")
                        
                        StoryPreview(username: "FreshSmash", returnText: "story 1 pressed", imageName: "Profile1")
                        
                        StoryPreview(username: "SuperManga", returnText: "story 2 pressed", imageName: "Profile2")
                        
                        StoryPreview(username: "CooCooLoo", returnText: "story 3 pressed", imageName: "Profile3")
                        
                        StoryPreview(username: "Veritano", returnText: "story 4 pressed", imageName: "Profile4")
                        
                        StoryPreview(username: "Loopsy", returnText: "story 5 pressed", imageName: "Profile5")
                        
                        StoryPreview(username: "HumBum", returnText: "story 6 pressed", imageName: "Profile6")
                    
                        Spacer()
                            .padding(5)
                    }
                } // end stories
                .padding(.bottom, 8)
                
                Divider()
                
                // start of posts
                Post(profilePhotoName: "Profile2", username: "SuperManga", location: "Phoenix, Arizona", photoName: "Post1", caption: "Thought this looked like a pretty cool photo!", numComments: 143)
                
                Post(profilePhotoName: "Profile1", username: "FreshSmash", location: "Somewhere in California", photoName: "Post2", caption: "Cool deer pic 🦌 Very glad I was able to capture this pic before he ran away!", numComments: 35)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

struct NavMenuButton: View {
    
    var returnText: String
    var imageName: String
    
    var body: some View {
        Button(action: {
            print(returnText)
        }) {
            Image(systemName: "\(imageName)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 20, height: 20)
                .foregroundColor(.black)
        }
    }
}

struct StoryPreview: View {
    
    var username: String
    var returnText: String
    var imageName: String
    
    var body: some View {
        VStack {
            ZStack {
                Button(action: {
                    print(returnText)
                }) {
                    ZStack {
                        // gradient outline
                        Circle()
                            .fill(
                                LinearGradient(colors: [.red, .yellow], startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(width: 70, height: 70)
                            .rotationEffect(.degrees(-45))
                        
                        // black outline
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                        
                        Image(imageName)
                            .resizable()
                            .cornerRadius(90)
                            .frame(width: 55, height: 55)
                    }
                }
            }
            Text(username)
                .font(.system(size: 12, weight: .medium))
        }
    }
}

struct UserProfile: View {
    var username: String
    var returnText: String
    var imageName: String
    
    var body: some View {
        VStack {
            ZStack {
                Button(action: {
                    print(returnText)
                }) {
                    ZStack {
                        // gradient outline
                        Circle()
                            .opacity(0)
                            .frame(width: 70, height: 70)
                            .rotationEffect(.degrees(-45))
                        
                        // black outline
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                        
                        Image(imageName)
                            .resizable()
                            .cornerRadius(90)
                            .frame(width: 55, height: 55)
                        
                        Image(systemName: "plus.circle.fill")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading, 45)
                            .padding(.top, 45)
                    }
                }
            }
            Text(username)
                .font(.system(size: 12, weight: .medium))
        }
    }
}

struct Post: View {
    
    var profilePhotoName: String
    var username: String
    var location: String
    var photoName: String
    
    var caption: String
    var numComments: Int
    
    var body: some View {
        VStack {
            // user info
            HStack {
                Image(profilePhotoName)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .cornerRadius(45)
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading) {
                    Text(username)
                        .fontWeight(.bold)
                    Text(location)
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .padding(3)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            // end user info
            
            // post photo
            Image(photoName)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
            // end post photo
            
            // interactions
            VStack {
                HStack(spacing: 15) {
                    Image(systemName: "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                    Image(systemName: "message")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                    Image(systemName: "paperplane")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                               
                    Spacer()
                    
                    Image(systemName: "bookmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                }
                .padding(.leading)
                .padding(.trailing)
                
                HStack {
                    Text("Liked by **CooCooLoo** and **others**")
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                }
                .padding(.leading, 19)
                
                // end interactions
                
                // post details
                
                
                // end post details
                VStack(alignment: .leading) {
                    Text("**\(username)** \(caption)")
                    Text("View all \(numComments) comments")
                        .foregroundColor(.gray)
                }
                .padding(.top, 1)
                .padding(.leading)
                .padding(.trailing)
            }
            
            Divider()
        }
    }
}
