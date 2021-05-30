

import SwiftUI

struct ContentView: View {
    
    
    @State var showyourname = false
    @State var showhome = false
    @State var showlastpage = false
    @State var score = 0
    @State var name = ""
    @State var showscore = false
    var body: some View {
        ZStack{
            firstpage(showhome: $showhome, showlastpage: $showlastpage)
            if (showhome && !showlastpage){
                HOME(showyourname: $showyourname, score : $score)
            }
            if(showyourname){
                yourname(showlastpage: $showlastpage,score : $score,name: $name, showscore: $showscore)
                }
            if(showlastpage){
                lastpage(showyourname: $showyourname, showhome: $showhome, showlastpage: $showlastpage, score: $score, name: $name, showscore: $showscore)
            }
            
            }
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
