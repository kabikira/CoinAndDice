//
//  DiceView.swift
//  CoinAndDice
//
//  Created by koala panda on 2022/11/24.
//

import SwiftUI

struct DiceView: View {
    @State private var randomNumber = 1
    @State private var timer: Timer?
    @State private var isRolling = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "die.face.\(randomNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
                .padding()
            Spacer()
            Button(action: {
                playDice()
            }) {
                Text("START")
                    .font(.title2)
                    .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.width * 0.1)
                    .padding(30)
                    .background(Color("Button"))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding()
            .disabled(isRolling)
        }
    }
        private func playDice() {
            isRolling = true
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            randomNumber = Int.random(in: 1...6)
        }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                timer?.invalidate()
                timer = nil
                isRolling = false
            }
        }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
