//
//  tabView.swift
//  launch_screen
//
//  Created by Alex Honcharuk on 23.06.2021.
//

import SwiftUI

struct tabView: View {
    var body: some View {
            
        TabView {
            homeFirstView()
                .tabItem {
                    Image(systemName: "house")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color(red: 0.57, green: 1.0, blue: 0.64))
                    Text("Home")
                }
            fieldSecondView()
                .tabItem {
                    Image(systemName: "leaf")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color(red: 0.57, green: 1.0, blue: 0.64))
                    Text("Field")
                }
            staffThreadView()
                .tabItem {
                    Image(systemName: "person.2")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color(red: 0.57, green: 1.0, blue: 0.64))
                    Text("Staff")
                }
        }
        .animation(.easeIn(duration: 0.5))
        .accentColor(.red)
        }
    }


struct tabView_Previews: PreviewProvider {
    static var previews: some View {
        tabView()
    }
}
