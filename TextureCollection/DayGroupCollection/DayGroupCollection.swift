//
//  DayGroupCollection.swift
//  TextureCollection
//
//  Created by Elijah Ponkratenko on 05/05/2018.
//  Copyright © 2018 Eli Ponkratenko. All rights reserved.
//

final class DayGroupCollection: ASCollectionNode {

    private let images: [UIImage]

    init(collectionViewLayout layout: UICollectionViewLayout, images: [UIImage]) {
        self.images = images
        super.init(collectionViewLayout: layout)
        delegate = self
        dataSource = self
    }

}

extension DayGroupCollection: ASCollectionDelegate {

    func collectionNode(_ collectionNode: ASCollectionNode,
                        constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRangeMake(CGSize(width: 40, height: 40))
    }

}

extension DayGroupCollection: ASCollectionDataSource {

    func collectionNode(_ collectionNode: ASCollectionNode,
                        numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionNode(_ collectionNode: ASCollectionNode,
                        nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let image = images[indexPath.row]
        return {
            return DayGroupCollectionNode(image: image)
        }
    }

}

