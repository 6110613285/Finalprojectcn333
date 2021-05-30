//
//  modelviewgame.swift
//  project311(R U RIGHT)
//
//  Created by Rathapol Putharaksa on 6/5/2564 BE.
//

import Foundation
class modelviewgame : ObservableObject {
    static var numran = 3 //จำนวนลูกศร
    @Published var check : Array<String> = []
    @Published var model : modelgame = createGame()
    var score : Int = 0
    var showarrow:Array<String> {
        model.randomarrow
    }
    func oneshow(index : Int) -> String {
        let onearrow = model.randomarrow[index]
        return onearrow
    }
    
    
    static func createGame() -> modelgame
    {
        return modelgame(numran: numran)
    }
    /*func reset(){
            modelviewgame = EmojiMemoryGame.createMemoryGame()
        }*/
    func addar(arrow : String) -> Bool{
        if(check.count < modelviewgame.numran - 1){
            check.append(arrow)
            //print(check.count)
            return true
        }
        else if(check.count == modelviewgame.numran - 1){
            check.append(arrow)
            //print(check)
            //print(checkar())
            //print(check.count)
            return false
        }
        else{return false}
        
    }
    func checkar() -> Bool{
        for i in (0..<check.count){
            if(check[i] != model.randomarrow[i + 1]){
                //print(score)
                return false
            }
            
        }
        
        return true
    }
    func newgame() {
        score = self.score + 1
        if( score > 0){
            modelviewgame.numran +=  1
            self.model = modelviewgame.createGame()
            self.check = []
        }
        
    }
}
