//
//  ContentView.swift
//  XC447 Code Reader
//
//  Created by Milosz Brzezinski on 23/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    let layout4x4 = [
        GridItem(.fixed(64)),
        GridItem(.fixed(64)),
        GridItem(.fixed(64)),
        GridItem(.fixed(64))
    ]
    
    let layout3x3 = [
        GridItem(.fixed(85)),
        GridItem(.fixed(85)),
        GridItem(.fixed(85))
    ]
    
    @ObservedObject var codeArray: CodeArray = CodeArray()
    @State var codeValue = 0
    @State var binValue = "0000 0000 0000 0000"
    @State var actLayout = [
        GridItem(.fixed(64)),
        GridItem(.fixed(64)),
        GridItem(.fixed(64)),
        GridItem(.fixed(64))
    ]
    
    @State var cameraView = false
    
    
    var body: some View {
        NavigationView{
            if cameraView {
                ScannerView()
            }else{
                ZStack {
                    Color.white
                        .ignoresSafeArea()
                    Color(.gray)
                        .ignoresSafeArea()
                        .opacity(0.5)
                    VStack{
                        Text("XC447 Code Reader")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        Text("\(codeValue)")
                            .font(.custom("result", size: 100))
                            .foregroundColor(.black)
                            .bold()
                        Text(binValue)
                            .font(.custom("result", size: 30))
                            .foregroundColor(.black)
                        Spacer()

                        ZStack{
                            Color(.white)
                                .opacity(0.50)
                                .ignoresSafeArea()
                                .frame(height: 350)
                                .cornerRadius(15)
                                .padding(10)
                            HStack{
                                VStack{
                                    Color(.black)
                                        .opacity(0.70)
                                        .ignoresSafeArea()
                                        .frame(width: 30, height: 30)
                                        .cornerRadius(10)
                                    Spacer()
                                    Color(.black)
                                        .opacity(0.70)
                                        .ignoresSafeArea()
                                        .frame(width: 30, height: 30)
                                        .cornerRadius(10)
                                }
                                .padding(5)
                                ZStack{
                                    Color(.black)
                                        .opacity(0.0)
                                        .frame(width: 280, height: 280)
                                        .padding(0)
                                    LazyVGrid(columns: layout4x4) {
                                        if let codeMatrix = codeArray.codeArray{
                                            ForEach(codeMatrix) { c in
                                                BitView(bitSet: c)
                                                    .onTapGesture {
                                                        if c.value {
                                                            c.value = false
                                                        }else{
                                                            c.value = true
                                                        }
                                                        codeValue = codeArray.getDecValue()
                                                        binValue = codeArray.getBinValue()
                                                    }
                                            }
                                        }
                                    }
                                }
                                
                                VStack{
                                    Color(.black)
                                        .opacity(0.70)
                                        .ignoresSafeArea()
                                        .frame(width: 30, height: 30)
                                        .cornerRadius(10)
                                    Spacer()
                                }
                                .padding(5)
                            }
                            .frame(height: 350)
                            .padding(10)
                        }
                        HStack{
                            NavigationLink(destination: {ScannerView()},label: {ZStack{
                                Color(red: 0.15, green: 0.15, blue: 0.55)
                                    .frame(height: 60)
                                    .cornerRadius(10)
                                HStack{
                                    Image(systemName: "camera.viewfinder")
                                        .foregroundColor(.white)
                                    Text("Scan")
                                        .foregroundColor(.white)
                                }
                                
                            }})
//                            Button(action: {
//                                cameraView = true
//                            }, label: {
//                                ZStack{
//                                    Color(red: 0.15, green: 0.15, blue: 0.55)
//                                        .frame(height: 60)
//                                        .cornerRadius(10)
//                                    HStack{
//                                        Image(systemName: "camera.viewfinder")
//                                            .foregroundColor(.white)
//                                        Text("Scan")
//                                            .foregroundColor(.white)
//                                    }
//
//                                }
//
//                            })
                            Button(action: {
                                codeArray.clearArray()
                                binValue = codeArray.getBinValue()
                                codeValue = codeArray.getDecValue()
                            }, label: {
                                ZStack{
                                    Color(red: 0.55, green: 0.15, blue: 0.15)
                                        .frame(height: 60)
                                        .cornerRadius(10)
                                    HStack{
                                        Image(systemName: "clear")
                                            .foregroundColor(.white)
                                        Text("Clear")
                                            .foregroundColor(.white)
                                    }
                                }
                            })
                        }
                        .padding(10)
                    }
                }
            }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
