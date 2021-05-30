//
//  firstpage.swift
//  project311(R U RIGHT)
//
//  Created by Rathapol Putharaksa on 10/5/2564 BE.
//

import SwiftUI

struct firstpage: View {
    
    @Binding var showhome : Bool
    @Binding var showlastpage : Bool
    var body: some View{
    
        ZStack{
            Image("background").resizable()
            .ignoresSafeArea()
            VStack{
            Spacer()
            Text("R U RIGHT").font(.largeTitle).bold().foregroundColor(.red)
            Spacer()
                Text("วิธีการเล่น").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("จำลูกศรที่มีการสุ่มขึ้นมา").font(.title)
                Text("และกดปุ่มลูกศรตามที่เห็น").font(.title)
                Text("เมื่อมีสัญลักษณ์แสดงแทนลูกศร").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
            Button("START"){
                showhome = true
            }.frame(width: UIScreen.main.bounds.width - 50, height: 50).foregroundColor(.white).background(Color.orange)
            .padding(.bottom)
            Button("HIGH SCORE"){
                showlastpage = true
            }.frame(width: UIScreen.main.bounds.width - 50, height: 50).foregroundColor(.white).background(Color.orange)
            .padding(.bottom,100)
            }
            
        }
    }
}




