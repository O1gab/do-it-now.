//
//  NoItemsView.swift
//  do it now.
//
//  Created by Olga Batiunia on 30.09.23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("It seems you should click on the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Add something🎯")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.brown : Color.mint)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 35 : 50)
                .shadow(
                    color: animate ? Color.pink.opacity(0.7) : Color.mint.opacity(0.7),
                
                    radius: animate ? 30 : 10,
                
                    x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, 
                    
                    y: animate ? 30 : 10)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .background(Color.mint)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
            withAnimation(Animation
                .easeInOut(duration: 1.7)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("do it now.")
        }
    }
}
