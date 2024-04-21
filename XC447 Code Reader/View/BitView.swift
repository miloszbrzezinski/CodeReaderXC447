//
//  BitView.swift
//  XC447 Code Reader
//
//  Created by Milosz Brzezinski on 23/11/2022.
//

import SwiftUI

struct BitView: View {
    @ObservedObject var bitSet: CodeBit
    
    var body: some View {
        
        ZStack{
            Color(.white)
                .frame(width: 64, height: 64)
                .opacity(0.0)
            if (bitSet.value){
                Color(.black)
                    .opacity(0.80)
                    .ignoresSafeArea()
                    .frame(width: 50, height: 50)
                    .cornerRadius(40)
            }else{
                Color(.black)
                    .opacity(0.30)
                    .ignoresSafeArea()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
            }
        }
        .padding(0)
        
        
    }
}

struct BitView_Previews: PreviewProvider {
    static var previews: some View {
        BitView(bitSet: CodeBit(value: true))
    }
}
