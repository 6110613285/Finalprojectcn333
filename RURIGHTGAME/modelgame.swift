//
//  File.swift
//  project311(R U RIGHT)
//
//  Created by Rathapol Putharaksa on 5/5/2564 BE.
//

import Foundation
struct modelgame {
    static let arrow = ["top-arrow","down-arrow","left-arrow","right-arrow"]
    
    var randomarrow : Array<String> = []
    init (numran : Int){
        randomarrow.append("start")
        for _ in (0..<numran) {
            let index =  Int.random(in:0..<4)
            randomarrow.append(modelgame.arrow[index])
            
        }
        randomarrow.append("end")
        //print(randomarrow)

    }
    
    
}
