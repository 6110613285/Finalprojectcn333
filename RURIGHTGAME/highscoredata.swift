//
//  highscoredata.swift
//  project311(R U RIGHT)
//
//  Created by Rathapol Putharaksa on 14/5/2564 BE.
//

import Foundation
import Firebase
class highscoredata: ObservableObject{
    private var db = Firestore.firestore()
    @Published var data: [highscore] = []
    private let collectionName = "player"
    init() {
        loadAll()
    }
    func getdata() -> [highscore]{
        loadAll()
        return data
    }
    
    func newplayer(name: String, score: Int){
        db.collection(collectionName).addDocument(data: [
            "name": name,
            "score": score
        ])
        loadAll()
    }
    
    /*func upDateNote(id: String, name: String){
     db.collection(collectionName).document(id).updateData([
     "name": name,
     ]){ error in
     if let error = error{
     print(error)
     }
     else {
     print("successfully update")
     }
     }
     loadAll()
     }
     
     func remove(at index: IndexSet){
     let noteToDelete = data.remove(at: index.first!)
     db.collection(collectionName).document(noteToDelete.id).delete()
     loadAll()
     }
     */
    private func loadAll(){
        db.collection(collectionName).getDocuments { (snapshot, error) in
            if let error = error{
                print(error)
                return
            }
            guard let documents = snapshot?.documents else {
                return
            }
            self.data = documents.compactMap { document in
                let data = document.data()
                guard let name = data["name"] as? String,
                      let score = data["score"] as? Int
                else {
                    return nil
                }
                return highscore(id: document.documentID,
                                     name: name,
                                     score: score)
            }
            self.data = self.data.sorted{ $0.score > $1.score }
            //print(self.data[0].name)
        }
    }
}

struct highscore : Identifiable{
    let id : String
    let name: String
    let score: Int
}

