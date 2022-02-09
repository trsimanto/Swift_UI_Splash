//
//  ContentView.swift
//  Swift_UI_Splash
//
//  Created by MacBook Pro on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack{
            Home()
            
            ZStack{
                Color("Blue")
                Image("twitter")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                   // .frame(width:animate ? 85 : 85, height: animate ? 85 : 85)
                    .scaleEffect(animate ? 4 : 0.4)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        }
    }
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15 ){
            withAnimation(Animation.easeOut(duration: 0.55)){
                animate.toggle()
            }
            withAnimation(Animation.linear(duration: 0.45)){
                endSplash.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View{
    
    var body: some View{
        VStack{
            HStack{
                Spacer()
                Text("Swift UI Splash")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Blue"))
                Spacer()
                
            }
        }
    }
}
