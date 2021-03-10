//
//  ContentView.swift
//  HW2
//
//  Created by User05 on 2021/3/8.
//

import SwiftUI



struct FinalPage: View {
    var body: some View {
        VStack{
            Text("Hope you enjoyed in my first iOS App!")
            Text("Play Again?")
            NavigationLink(
                destination: ContentView(),
                label: {
                    Text("Alright.").padding().foregroundColor(.blue)
                })
        }
    }
    
}



struct Game: View {
    @State var count = 1
    //count the number of question that player have done
    @State var number = Int.random(in: 0...14)
    //determine which question to be showed
    var body: some View {
        //let page can be roll from top to buttom
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                VStack{
                    //10 questions
                    if(self.count <= 10){
                        Button(action: {
                            self.count += 1
                            number = Int.random(in: 0...14)
                        }, label: {
                            Text("Next one~").foregroundColor(.blue).padding()
                        })
                        Text("Question No.\(count):")
                        Image("AS_Unity made by Mohot416").resizable().scaledToFit().padding()
                        Text(Questions[number].question)
                        Text("Answer is down below...")
                        Text(" ").padding()
                        Text(" ").padding()
                        Text(" ").padding()
                        HStack{
                            Text("Answer is ")
                            Text(Questions[number].answer).background(Color.green)
                        }
                        Text("Press the link on the top to move next question, love U~").background(Color.yellow)
                    }
                    //jump to final page after 10 questions
                    else{
                        FinalPage()
                    }
                }
            }
        )
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("AS_Unity made by Mohot416").resizable().scaledToFit().padding()
                Text("Hello there! I'm Jack!").background(Color.yellow)
                Text("Let's get some fun~").background(Color.yellow)
                //link to next page
                NavigationLink(destination: Game()) {
                        Text("Tap here to start!").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).padding()
                    }
            }.navigationTitle("Come and Guess!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
