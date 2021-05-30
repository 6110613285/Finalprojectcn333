//
//  lastpage.swift
//  project311(R U RIGHT)
//
//  Created by Rathapol Putharaksa on 6/5/2564 BE.
//

import SwiftUI

struct lastpage: View {
    @Binding var showyourname : Bool
    @Binding var showhome : Bool
    @Binding var showlastpage : Bool
    @Binding var score : Int
    @Binding var name : String
    @Binding var showscore : Bool
    @ObservedObject var highscoreplayer = highscoredata()
    var body: some View {
        ZStack{
            
            Color.black
                .ignoresSafeArea()
            VStack{
                
                Text("HIGH SCORE").font(.largeTitle).bold().colorInvert().padding(.top,100).padding(.bottom,50)
                HStack{
                    Spacer()
                    VStack{
                        Text("NAME").font(.title).bold().colorInvert()
                    }
                    Spacer()
                    VStack{
                        Text("SCORE").font(.title).bold().colorInvert()
                    }
                    Spacer()
                }.frame(width:UIScreen.main.bounds.width)
                VStack{
                    HStack{
                        Spacer()
                        VStack{
                            ForEach(highscoreplayer.getdata()){i in
                                Text("\(i.name)").colorInvert().font(.title)
                            }
                            /*Text("\(name)").colorInvert().font(.title)*/
                        }.padding(.horizontal)
                        Spacer()
                        VStack{
                            ForEach(highscoreplayer.getdata()){i in
                                Text("\(i.score)").colorInvert().font(.title)
                            }
                            /*if (showscore){
                                Text("\(score)" ).colorInvert().font(.title)
                            }*/
                        }.padding(.horizontal,40)
                        Spacer()
                    }.frame(width:UIScreen.main.bounds.width)
                }
                Spacer()
                Button("NEW GAME"){
                    showhome = true
                    score = 0
                    showyourname = false
                    showlastpage = false
                    name = ""
                    
                }.frame(width: UIScreen.main.bounds.width - 50, height: 50)
                .foregroundColor(.white).background(Color.orange).padding(.bottom,100)
            }
        }
    }
}



