//
//  DayScheduleTable.swift
//  TextureCollection
//
//  Created by Elijah Ponkratenko on 02/05/2018.
//  Copyright © 2018 Eli Ponkratenko. All rights reserved.
//

import Foundation

final class DayScheduleTable: ASTableNode {

    private var data: Int

    init(data: Int) {
        self.data = data
        super.init(style: .plain)
        dataSource = self
        delegate = self
//        setupTunning()
    }

    private func setupTunning() {
        DispatchQueue.main.async { [weak self] in
            self?.setTuningParameters(
                ASRangeTuningParameters(
                    leadingBufferScreenfuls: 7,
                    trailingBufferScreenfuls: 0.5
                ),
                for: .minimum,
                rangeType: .preload
            )
            self?.setTuningParameters(
                ASRangeTuningParameters(
                    leadingBufferScreenfuls: 5,
                    trailingBufferScreenfuls: 0.5
                ),
                for: .full,
                rangeType: .display
            )
        }
    }

}

extension DayScheduleTable: ASTableDelegate {

}

extension DayScheduleTable: ASTableDataSource {

    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 24
    }

    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let data = indexPath.row
        return {
            let node = DayScheduleTableCell(data: data)
            return node
        }
    }

}
