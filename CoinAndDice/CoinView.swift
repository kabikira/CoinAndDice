//
//  CoinView.swift
//  CoinAndDice
//
//  Created by koala panda on 2022/11/24.
//

import SwiftUI

struct CoinView: View {
    let reverse = [true, false]
    @State var turn = true
    @State var animationAmount = 0.0
    @State var timer :Timer?
    @State var isButton = false
    
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .foregroundColor(self.turn ? Color("CoinA"): Color("CoinB"))
                .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2)
                .padding()
                .rotation3DEffect(Angle(degrees: animationAmount), axis: (x: CGFloat(10), y: CGFloat(0), z: CGFloat(0)))
            Spacer()

            Button (action:{
                isButton = true
                for _ in 1...5 {
                coinAnime()
                }
                timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) {_ in
                    turn.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                    turn = reverse.randomElement()!
                    timer?.invalidate()
                    timer = nil
                    isButton = false
                }
            } ) {
                Text("START")
                    .font(.title2)
                    .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.width * 0.1)
                    .padding(.all, 30.0)
                    .background(Color("Button"))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding()
            .disabled(isButton)
    
        }
        
       
    }
    func coinAnime() {
        withAnimation(.linear(duration: 2)) {
            turn.toggle()
            self.animationAmount += 1080
        }
        
    
    }}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView()
    }
}

