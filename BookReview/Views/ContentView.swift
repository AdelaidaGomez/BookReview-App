//
//  ContentView.swift
//  BookReview
//
//  Created by Adelaida Gomez Vieco on 30/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.blueLight1
                    .ignoresSafeArea(.all)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.grey1)
                        .frame(width: 450, height: 550)
                        .position(x: 340, y: 80)
                    
                    VStack(alignment: .center, spacing: 10) {
                        
                        Image("BookPhoto")
                            .resizable()
                            .frame(width: 650, height: 650)
                            .padding(.horizontal)
                            .padding(.top, -85)

                            Text("Keep Your Books Organized")
                                .frame(width: 270)
                                .font(.largeTitle.bold())
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(.top, -160)
                            
                            Text("This is the app to keep your books orginized and keep track of your reviews")
                                .frame(width: 290)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(.top, -50)
                    
                            NavigationLink {
                                ListView()
                            } label: {
                                Text("Next")
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 20)
                                    .foregroundColor(.black)
                                    .background(Color.pinkLight1)
                                    .cornerRadius(8)
                                    .position(x: 450, y: 155)
                            }
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
