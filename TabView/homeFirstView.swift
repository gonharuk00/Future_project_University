//
//  fieldSecondView.swift
//  launch_screen
//
//  Created by Alex Honcharuk on 23.06.2021.
//

import SwiftUI

struct homeFirstView: View {
    var body: some View {
        ZStack{
            
            Home()
            
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
            Text("\(1)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold))
        }
    }
}

struct homeFirstView_Previews: PreviewProvider {
    static var previews: some View {
        homeFirstView()
    }
}
