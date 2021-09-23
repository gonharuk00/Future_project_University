import SwiftUI

struct fieldSecondView: View {
    var body: some View {
        
        Launch()
    }
}

struct fieldSecondView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Launch : View {
    
    @State var data = [
        
        Card(id: 0, image: "p2", title: "USA", details: "info", expand: false),
        Card(id: 1, image: "p3", title: "Canada", details: "info", expand: false),
        Card(id: 2, image: "p4", title: "Australia", details: "info", expand: false),
        Card(id: 3, image: "p5", title: "Germany", details: "info", expand: false),
        Card(id: 4, image: "p6", title: "Dubai", details: "info", expand: false),
        Card(id: 5, image: "p1", title: "London", details: "info", expand: false)
    ]
    
    @State var hero = false
    
    var body: some View{
        
        VStack{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Field")
                                .font(.custom("Limelight", size: 30))
                                .fontWeight(.heavy)
                                .foregroundColor(.green)
                        }
                        
                        Spacer()
                        
                        
                    }
                    .padding()
                    
                    VStack(spacing: 15){
                        
                        // going to implement hero animation...
                        // were going to use geometry reader to get the postiton of the card...
                        
                        ForEach(0..<self.data.count){i in
                            
                            GeometryReader{g in
                                
                                CardView(data: self.$data[i], hero: self.$hero)
                                    
                                    // going to move view up how its down from top...
                                    .offset(y: self.data[i].expand ? -g.frame(in: .global).minY : 0)
                                    
                                    // going to hide all other views when a view is expanded...
                                    .opacity(self.hero ? (self.data[i].expand ? 1 : 0) : 1)
                                    // you can see still scrollview is working so were going to disable it...
                                    // follow me...
                                    
                                    .onTapGesture {
                                        
                                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                            
                                            if !self.data[i].expand{
                                                
                                                // opening only one time then close button will work...
                                                self.hero.toggle()
                                                self.data[i].expand.toggle()
                                            }
                                        }
                                        
                                    }
                                
                            }
                            // going to increase height based on expand...
                            .frame(height: self.data[i].expand ? UIScreen.main.bounds.height : 250)
                            
                            // 500 for disabling the drag for scrollview...
                            .simultaneousGesture(DragGesture(minimumDistance: self.data[i].expand ? 0 : 100).onChanged({ (_) in
                                
                                
                            }))
                        }
                    }
                }
                
            }
        }
    }
}

// card View...

struct CardView : View {
    
    @Binding var data : Card
    @Binding var hero : Bool
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {

            
            ZStack(alignment: .topTrailing){
                
                VStack{
                    
                    Image(self.data.image)
                        .resizable()
                        .frame(height: self.data.expand ? 350 : 250)
                        .cornerRadius(self.data.expand ? 0 : 25)
                    
                    if self.data.expand{
                        
                        HStack{
                            
                            Text(self.data.title)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .padding()
                        
                        Text(self.data.details)
                            .padding(.horizontal)
                        
                        HStack{
                            
                            Text("Details")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .padding()
                        
                        HStack(spacing: 0){
                            
                            Button(action: {
                            
                            }) {
                                
                                Image("mcard1")
                            }
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("mcard2")
                            }
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("mcard3")
                            }
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("mcard4")
                            }
                        }
                        .padding(.horizontal, 25)
                        
                        Spacer(minLength: 0)
                        
                        
                    }
                }
                .padding(.horizontal, self.data.expand ? 0 : 20)
                // to ignore spacer scroll....
                .contentShape(Rectangle())
                
                // showing only when its expanded...
                
                if self.data.expand{
                    
                    Button(action: {
                        
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                            
                            self.data.expand.toggle()
                            self.hero.toggle()
                        }
                        
                    }) {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .clipShape(Circle())
                        
                    }
                    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding(.trailing,10)
                }
                
            }
        }
    }
}

// sample Data..

struct Card : Identifiable {
    
    var id : Int
    var image : String
    var title : String
    var details : String
    var expand : Bool
}


