//
//  yourname.swift
//  project311(R U RIGHT)
//
//  Created by Rathapol Putharaksa on 6/5/2564 BE.
//

import SwiftUI

struct yourname: View {
    @Binding var showlastpage : Bool
    @Binding var score : Int
    @Binding var name: String
    @Binding var showscore : Bool
    @ObservedObject var scoreplayer = highscoredata()
    var body: some View {
        VStack{
                           
            Text("your score : \(score)" ).foregroundColor(Color.red).padding(.top,20)
            Spacer()
            TextField("Your Name", text: $name)
             .textFieldStyle(RoundedBorderTextFieldStyle())
             .border(Color.black)
             .padding()
            
            Divider()
            
            HStack{
                
                Button("OK"){
                    showlastpage = true
                    showscore = true
                    scoreplayer.newplayer(name: name, score: score)
                }.frame(width: UIScreen.main.bounds.width - 50, height: 50).foregroundColor(.white)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 200).background(Color.black)
        //.opacity(0.5)
        .cornerRadius(12)
        .clipped()
        
    }
}


