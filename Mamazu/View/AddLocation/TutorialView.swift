//
//  TutorialView.swift
//  Mamazu
//
//  Created by Sercan Burak AĞIR on 4.04.2021.
//

import SwiftUI

struct TutorialView: View {
    
    var size = UIScreen.main.bounds
    var warningText: String = WarningView().Mamazu
    @Binding var isShowing: Bool
    
    var body: some View {
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8) {
            Image("Tutorialimage")
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.mamazuCardShadow.opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)
            VStack(alignment: .leading) {
                Text(LocalizedString.Tutorial.title)
                    .foregroundColor(.mamazuTextColor)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .lineLimit(3)
                ScrollView{
                    Text(warningText)
                        .foregroundColor(.mamazuTextCaption)
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 5)
                }
                .frame(height: UIDevice.current.iPhones_5_5s_5c_SE ? 100 : 280)
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                    RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .fill(LinearGradient(gradient: Gradient(colors: [.mamazuCardGradientLeft, .mamazuCardGradientRight]),
                                             startPoint: .topLeading, endPoint: .bottomTrailing))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                    Text(LocalizedString.ok.uppercased()).font(.system(size: 14, weight: .medium, design: .rounded)).foregroundColor(.white)
                }
                .shadow(color: Color.mamazuCardGradientLeft.opacity(0.3), radius: 5, x: 0, y: 5)
                .frame(height: 44)
                .padding(.vertical, 20)
                .padding(.horizontal, UIDevice.current.iPad ? 70 : 0)
                .onTapGesture {
                    self.isShowing.toggle()
                }
                
            }
            .padding(.horizontal, 50)
            .padding(.top, 20)
        }
        .frame(maxWidth: UIDevice.current.iPad ? 500 : size.width)
        .padding(.horizontal, -30)
        .padding(.vertical, 30)
        .background(Color.mamazuCardBackground)
        .cornerRadius(45)
        .shadow(color: Color.mamazuCardShadow.opacity(1), radius: 20, x: 0, y: 10)
        
        //Background
        .frame(maxWidth: size.width, maxHeight: size.height)
        .background(Color.mamazuBackground.opacity(0.8))
        .ignoresSafeArea()
        .opacity(isShowing ? 1 : 0)
        .animation(.easeInOut(duration: 0.5), value: isShowing)
        
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(isShowing: .constant(true))
    }
}

struct WarningView {
    let Lost: String = LocalizedString.Warning.lostString
    let Mamazu: String = LocalizedString.Warning.mamazuString
}
