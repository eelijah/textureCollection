//
//  DayScheduleContainer.swift
//  TextureCollection
//
//  Created by Elijah Ponkratenko on 02/05/2018.
//  Copyright © 2018 Eli Ponkratenko. All rights reserved.
//

import UIKit

final class DayScheduleContainer: ASViewController<ASPagerNode> {

    private let pagerNode: ASPagerNode
    private let dataModel: [Int]

    init(datas: [Int]) {
        self.dataModel = datas
        pagerNode = ASPagerNode()
        super.init(node: pagerNode)
        setupTunning()
        setupPagerNode()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTunning() {
//        pagerNode.setTuningParameters(
//            ASRangeTuningParameters(
//                leadingBufferScreenfuls: 2,
//                trailingBufferScreenfuls: 1
//            ),
//            for: .minimum,
//            rangeType: .preload
//        )
        pagerNode.setTuningParameters(
            ASRangeTuningParameters(
                leadingBufferScreenfuls: 5,
                trailingBufferScreenfuls: 1
            ),
            for: .full,
            rangeType: .display
        )
    }

    private func setupPagerNode() {
        pagerNode.allowsAutomaticInsetsAdjustment = false
        pagerNode.setDataSource(self)
        pagerNode.setDelegate(self)
    }

}

extension DayScheduleContainer: ASPagerDelegate {

}

extension DayScheduleContainer: ASPagerDataSource {

    func shouldBatchFetch(for collectionNode: ASCollectionNode) -> Bool {
        return true
    }

    func numberOfPages(in pagerNode: ASPagerNode) -> Int {
        return dataModel.count
    }

//    func pagerNode(_ pagerNode: ASPagerNode, nodeAt index: Int) -> ASCellNode {
//        return DayScheduleContainerCell(data: dataModel[index])
//    }

    func pagerNode(_ pagerNode: ASPagerNode, nodeBlockAt index: Int) -> ASCellNodeBlock {
        let data = dataModel[index]
        return {
            return DayScheduleContainerCell(data: data)
        }
    }

}
