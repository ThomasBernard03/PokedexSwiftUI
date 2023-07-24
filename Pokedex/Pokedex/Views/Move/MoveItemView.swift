//
//  MoveItemView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 23/07/2023.
//

import SwiftUI

struct MoveItemView: View {
    let move : Move
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(move.name)
                    .padding(.all, 10)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(move.type.color())
                    .cornerRadius(10)
                    
                
                Spacer()
            }
            
            HStack {
                Text(move.description)
                Spacer()
            }
            
            HStack {
                VStack {
                    if move.power != nil {
                        HStack {
                            MoveStatItemView(name: "Power", value: "\(move.power!)")
                            Spacer()
                        }
                        
                    }
                    
                    if move.accuracy != nil {
                        HStack {
                            MoveStatItemView(name: "Accuracy", value: "\(move.accuracy!)")
                            Spacer()
                        }
                        
                    }
                    
                    HStack {
                        MoveStatItemView(name: "PP", value: "\(move.pp)")
                        Spacer()
                    }
                    
                    HStack {
                        MoveStatItemView(name: "Priority", value: "\(move.priority)")
                        Spacer()
                    }
                   
                    HStack {
                        MoveStatItemView(name: "Type", value: move.type.rawValue)
                        Spacer()
                    }
                    
                    HStack {
                        MoveStatItemView(name: "Target", value: move.target)
                        Spacer()
                    }
                    
                    
                    
                    
                    
                    Spacer()
                }
                
                Spacer()
                
                VStack {
                    Spacer()
                    move.type.image()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    
                }
            }
            

        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).stroke(move.type.color(), lineWidth: 4))
        .cornerRadius(8)
    }
}

struct MoveItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        let tackle = Move(id: 1, name: "tackle", type: .normal, description: "A full-body charge attack.", power: 40, accuracy: 100, pp: 35, priority: 0, damageClass: "physical", target: "Selected pokemon")
        
        let leechSeed = Move(id: 2, name: "Leech-seed", type: .grass, description: "Steals HP from the foe on every turn.", power: nil, accuracy: 90, pp: 10, priority: 0, damageClass: "status", target: "Selected pokemon")
        
        let firePunch = Move(id: 2, name: "fire-punch", type: .fire, description: "A fiery punch. May cause a burn.", power: 75, accuracy: 100, pp: 15, priority: 0, damageClass: "attack", target: "Selected pokemon")
        
        ScrollView {
            VStack {
                MoveItemView(move: tackle)
                MoveItemView(move: leechSeed)
                MoveItemView(move: firePunch)
            }
        }
        .padding()
        
    }
}
