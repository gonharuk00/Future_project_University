//
//  staffThreadView.swift
//  launch_screen
//
//  Created by Alex Honcharuk on 23.06.2021.
//

import SwiftUI

struct staffThreadView: View {
    var body: some View {
        ZStack{
            
            Screnn()
            
        }
    }
}

struct staffThreadView_Previews: PreviewProvider {
    static var previews: some View {
        staffThreadView()
    }
}

struct Screnn : View {
    @State var search = ""
    @State var index = 0
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    var body: some View{
        ScrollView(.vertical, showsIndicators: false){
            LazyVStack{
                HStack{
                    Text("Staff")
                        .font(.custom("Limelight", size: 30))
                        .fontWeight(.heavy)
                        .foregroundColor(.green)
                    Spacer()
                    Divider()
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: self.columns, spacing: 25){
                    ForEach(info){game in
                        GridView(game: game, columns: self.$columns)
                    }
                }
                .padding([.horizontal,.top])
            }
            .padding(.vertical)
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
    }
}

struct GridView : View {
    
    var game : Game
    @Binding var columns : [GridItem]
    @Namespace var namespace
    
    var body: some View{
        VStack{
            if self.columns.count == 2{
                VStack(spacing: 15){
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                        
                        Image(game.image)
                            .resizable()
                            .frame(height: 100)
                            .cornerRadius(15)
                        
                        
                    }
                    .matchedGeometryEffect(id: "image", in: self.namespace)
                    
                    Text(game.name)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "title", in: self.namespace)
                    Button(action: {
                        
                    }, label: {
                        Text("Info")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(Color.red)
                            .cornerRadius(10)
                    })
                    .matchedGeometryEffect(id: "info", in: self.namespace)
                }
                Spacer()
            }
            else{
                HStack(spacing: 15){
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                        Image(game.image)
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 250)
                            .cornerRadius(15)
                    }
                    .matchedGeometryEffect(id: "image", in: self.namespace)
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text(game.name)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "title", in: self.namespace)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Info")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 25)
                                .background(Color.red)
                                .cornerRadius(10)
                        })
                        .padding(.top, 10)
                        .matchedGeometryEffect(id: "info", in: self.namespace)
                    }
                }
                .padding(.trailing)
                .background(Color.white)
                .cornerRadius(15)
            }
        }
    }
}
    
    
    
    struct Game: Identifiable {
        var id : Int
        var name : String
        var image: String
        var rating : Int
    }
    var info = [
        Game(id: 0, name: "Resident Evil 3", image: "g1", rating: 3),
        Game(id: 1, name: "GTA 5", image: "g2", rating: 5),
        Game(id: 2, name: "Assaisan Creed Odesey", image: "g3", rating: 3),
        Game(id: 3, name: "Resident Evil 7", image: "g4", rating: 3),
        Game(id: 4, name: "Watch Dogs 2", image: "g5", rating: 2),
        Game(id: 5, name: "The Evil Within 2", image: "g7", rating: 1),
        Game(id: 6, name: "Tomb Raider 2014", image: "g8", rating: 2),
        Game(id: 7, name: "Shadow Of The Tomb Raider", image: "g9", rating: 4)
    ]

