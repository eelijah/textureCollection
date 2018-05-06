//
//  DayGroupCollectionFlowLayout.swift
//  TextureCollection
//
//  Created by Elijah Ponkratenko on 05/05/2018.
//  Copyright © 2018 Eli Ponkratenko. All rights reserved.
//

import Foundation

final class DayGroupCollectionFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        itemSize = CGSize(width: 40, height: 40)
        estimatedItemSize = CGSize(width: 40, height: 40)
        minimumInteritemSpacing = 10
        minimumLineSpacing = 10
        scrollDirection = .vertical
        sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
