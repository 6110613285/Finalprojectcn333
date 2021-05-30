//
//  HOME.swift
//  project311(R U RIGHT)
//
//  Created by Rathapol Putharaksa on 6/5/2564 BE.
//

import SwiftUI

struct HOME: View {
    @ObservedObject var viewModel = modelviewgame()
    @State var isshow = true
    @State var canclick = false
    @Binding var showyourname : Bool
    @Binding var score : Int
    
    //var showtime = 1
    var time = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State var numim = 0
    var body: some View {
        ZStack{
            
            Image("background").resizable()
                .ignoresSafeArea()
            
            VStack{
                Text("your score : \(score)" )
                    .font(.largeTitle).bold().foregroundColor(.red)
                
                
                HStack{
                    if(isshow){
                        Image(viewModel.oneshow(index: numim )).resizable()
                            .frame(width: 75, height: 75)
                        
                    }else{
                        Image("background").resizable()
                            .frame(width: 75, height: 75)
                        
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width, height: 150)
                
                .onReceive(time) {_ in
                    
                    if (numim < viewModel.showarrow.count - 1 ){
                        if(isshow){
                            self.numim = (self.numim + 1)
                            isshow = false
                        }
                        else{
                            isshow = true
                        }
                    }
                    else{
                        
                        canclick = true
                        isshow = true
                    }
                    
                }
                HStack{
                    ForEach(viewModel.check,id : \.self){i in
                        Image(i).resizable()
                            .frame(width: 20, height: 20)
                        
                        
                    }
                    Image("background").resizable()
                        .frame(width: 20, height: 20)
                }
                Divider()
                HStack{
                    VStack{
                        Button(action:{ click(canclick: canclick, arrow: "top-arrow")}) {
                            Image("top-arrow").resizable()
                                .frame(width: 60, height: 60)
                                .padding(.top,40)
                        }
                        
                        HStack{
                            Spacer()
                            Button(action:{ click(canclick: canclick, arrow: "left-arrow")}) {
                                Image("left-arrow").resizable()
                                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                    .frame(width: 60, height: 60)
                                    .padding(.all)}
                            Spacer()
                            Button(action:{ click(canclick: canclick, arrow: "right-arrow")}) {
                                Image("right-arrow").resizable().frame(width: 60, height: 60).padding(.all)
                                
                            }
                            Spacer()
                        }
                        
                        Button(action:{ click(canclick: canclick, arrow: "down-arrow")}) {
                            Image("down-arrow").resizable().frame(width: 60, height: 60)
                                .padding(.bottom,20)
                        }
                    }
                }
                
                
                
            }
            
        }
        
    }
    func click(canclick : Bool,arrow : String) {
        
        if(canclick){
            
            self.canclick = viewModel.addar(arrow: arrow)
            
            if(!self.canclick && !showyourname){//คลิกไม่ได้กับไม่แพ้
                let win = viewModel.checkar()
                if(win){
                    numim = 0
                    isshow = false
                    viewModel.newgame()
                    score = score + 1
                }
                else{
                    showyourname = !viewModel.checkar()
                }
                
            }
        }
        
    }
}
