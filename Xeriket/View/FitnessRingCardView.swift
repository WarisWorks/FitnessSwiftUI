//
//  FitnessRingCardView.swift
//  Xeriket
//
//  Created by Waris Ruzi on 2022/11/01.
//

import SwiftUI

struct FitnessRingCardView: View {
    var body: some View {
        VStack(spacing: 15){
            Text("ئىلگىرىلەش ")
                .font(.custom(Uyghur, size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 20){
                
                //Progress Ring
                ZStack{
                    ForEach(rings.indices,id: \.self){index in
                        AnimatedRingView(ring: rings[index], index: index)
                    }
                }
                .frame(width: 130, height: 130)
                
                VStack(alignment: .leading, spacing: 12){
                    ForEach(rings){ring in
                        Label {
                            HStack(alignment: .bottom, spacing: 6){
                                Text("\(Int(ring.progress)) %" )
                                    .font(.title3.bold())
                                
                                Text(ring.value)
                                    .font(.custom(Uyghur, size: 18))
                            }
                        } icon: {
                            Group{
                                if ring.isText{
                                    Text(.init(systemName: ring.keyIcon))
                                        .font(.title2)
                                    
                                }
                                else {
                                    Image(systemName: ring.keyIcon)
                                        .font(.title2)
                                }
                            }
                            .frame(width: 30)

                        }

                    }
                }
                .padding(.leading,10)
            }
            .padding(.top, 10)
                    
       }
        .padding(.vertical,20)
       // .padding(.horizontal,15)
        .background{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.ultraThinMaterial)
        }
    }
}

struct FitnessRingCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Animating RIngs
struct AnimatedRingView: View{
    var ring: Ring
    var index: Int
    @State var showRing: Bool = false
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(.gray.opacity(0.3), lineWidth: 10)
            
            Circle()
                .trim(from: 0, to: showRing ?  rings[index].progress / 100 : 0)
                .stroke(rings[index].keyColor,style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .rotationEffect(.init(degrees: -90))
        }
        .padding(CGFloat(index) * 16)
        .onAppear{
            //MARK: Show After intial animation finished
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                withAnimation(.interactiveSpring(response: 1, dampingFraction: 1,blendDuration: 1).delay(Double(index) * 0.1)) {
                    showRing = true
                    
                }
            }
        }
    }
}
