//
//  DayScheduleTableCell.swift
//  TextureCollection
//
//  Created by Elijah Ponkratenko on 03/05/2018.
//  Copyright © 2018 Eli Ponkratenko. All rights reserved.
//

final class DayScheduleTableCell: ASCellNode {

    private let timeTextNode: ASTextNode
    let collapseArrowIcon = ASImageNode()
    let moreIcon = ASImageNode()
    let collection: DayGroupCollection
    let backgroundNode = ASDisplayNode()

    private let data: Int

    private let images: [UIImage] = [
            .medicine1,
            .medicine2,
            .medicine3
        ]

    init(data: Int) {
        self.data = data
        timeTextNode = ASTextNode()
        collection = DayGroupCollection(
                collectionViewLayout: DayGroupCollectionFlowLayout(),
                images: images
        )
        super.init()
        backgroundColor = .random
        setupNodes()
        setupHierarchy()
    }

    private func setupNodes() {
        setupCollapseArrowIcon()
        setupTimeTextNode()
        setupMoreIcon()
        setupCollection()

        backgroundNode.backgroundColor = .white
    }

    private func setupTimeTextNode() {
        timeTextNode.attributedText = NSAttributedString(
                string: String(data),
                attributes: [
                    .font: UIFont.boldSystemFont(ofSize: 22),
                    .foregroundColor: UIColor.black
                ]
        )
        timeTextNode.backgroundColor = .yellow
        timeTextNode.isOpaque = true
    }


    private func setupCollapseArrowIcon() {
        collapseArrowIcon.style.preferredSize = CGSize(width: 15, height: 15)
        collapseArrowIcon.image = .collapseArrowIcon
        collapseArrowIcon.backgroundColor = .green
        collapseArrowIcon.isOpaque = true
    }

    private func setupMoreIcon() {
        moreIcon.style.preferredSize = CGSize(width: 15, height: 15)
        moreIcon.backgroundColor = .red
        moreIcon.image = .moreDots
        moreIcon.isOpaque = true
    }

    private func setupCollection() {
        collection.backgroundColor = .blue
        collection.style.flexGrow = 1
        collection.style.preferredSize = CGSize(width: 300, height: 100)
    }

    private func setupHierarchy() {
        addSubnode(backgroundNode)
        addSubnode(collapseArrowIcon)
        addSubnode(timeTextNode)
        addSubnode(moreIcon)
        addSubnode(collection)
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let headerSpec = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 10,
            justifyContent: .spaceBetween,
            alignItems: .center,
            children: [
                collapseArrowIcon,
                timeTextNode,
                moreIcon
            ]
        )
        headerSpec.style.alignSelf = .stretch
        let contentSpec = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 5,
            justifyContent: .spaceBetween,
            alignItems: .center,
            children: [
                headerSpec,
                collection
            ]
        )
        contentSpec.style.alignSelf = .stretch
        let insets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        let backgroundSpec =  ASBackgroundLayoutSpec(child: contentSpec, background: backgroundNode)
        let insetSpec = ASInsetLayoutSpec(insets: insets, child: backgroundSpec)
        return insetSpec
    }

}
