//
//  DayGroupCollectionNode.swift
//  TextureCollection
//
//  Created by Elijah Ponkratenko on 05/05/2018.
//  Copyright © 2018 Eli Ponkratenko. All rights reserved.
//

import Foundation

final class DayGroupCollectionNode: ASCellNode {

    private let imageNode: ASImageNode

    init(image: UIImage) {
        imageNode = ASImageNode()
        super.init()
        imageNode.image = image
        enableSubtreeRasterization()
        addSubnode(imageNode)
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASWrapperLayoutSpec(layoutElement: imageNode)
    }

}
