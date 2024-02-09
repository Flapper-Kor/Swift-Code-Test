//
//  UsingSprite.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/02.
//

import SwiftUI
import SpriteKit

enum SKSpriteNodeShape : String, CaseIterable {
    case rect = "rectangle"
    case star = "star"
}

// A simple game scene with falling boxes
class GameScene: SKScene {
    var nodeSize : CGSize = CGSize(width: 50, height: 50)
    private var _nodeShape : SKSpriteNodeShape = .rect
    var nodeShape : SKSpriteNodeShape {
        set {
            _nodeShape = newValue
        }
        get { _nodeShape }
    }
    
    func setNodeShape(nodeShape : SKSpriteNodeShape){
        self._nodeShape = nodeShape
    }
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        let location = touch.location(in: self)

        var node : SKSpriteNode
            
        if(_nodeShape == .star){
            let texture = SKTexture(image: UIImage(systemName: "star.fill") ?? UIImage())
            let star = SKSpriteNode(texture: texture, color: .yellow, size: nodeSize)
            node = star
        }
        else if(_nodeShape == .rect){
            let box = SKSpriteNode(color: .red, size: nodeSize)
            node = box
        }
        else {
            let box = SKSpriteNode(color: .red, size: nodeSize)
            node = box
        }
        node.position = location
        node.physicsBody = SKPhysicsBody(rectangleOf: nodeSize)
        addChild(node)
    }
}

struct nodeshape {
    @Binding var value : SKSpriteNodeShape
}

// A sample SwiftUI creating a GameScene and sizing it
// at 300x400 points
struct UsingSprite: View {
    @State var nodeShape : SKSpriteNodeShape = .rect
    @State var gscene: GameScene = GameScene()
    @State var int : Int = 0
    
    var scene: SKScene {
        gscene.size = CGSize(width: 300, height: 400)
        gscene.scaleMode = .fill
        return gscene
    }

    var body: some View {
        VStack{
            Picker("choose shape", selection: $nodeShape) {
                ForEach(SKSpriteNodeShape.allCases, id: \.self) { shape in
                    Text(shape.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
            .cornerRadius(15)
            .padding()
            .onChange(of: nodeShape) { newValue in
                gscene.nodeShape = self.nodeShape
            }
            
            SpriteView(scene: scene)
                .frame(width: 300, height: 400)
                .ignoresSafeArea()
                .border(.red)
            
            Button {
                self.scene.removeAllChildren()
            } label: {
                Text("Clear")
            }
        }
    }
}

struct UsingSprite_Previews: PreviewProvider {
    static var previews: some View {
        UsingSprite()
    }
}
