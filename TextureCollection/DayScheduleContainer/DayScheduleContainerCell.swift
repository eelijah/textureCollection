//
//  DayScheduleContainerCell.swift
//  TextureCollection
//
//  Created by Elijah Ponkratenko on 03/05/2018.
//  Copyright © 2018 Eli Ponkratenko. All rights reserved.
//

final class DayScheduleContainerCell: ASCellNode {

    private let table: ASTableNode
    private let data: Int

    init(data: Int) {
        self.data = data
        table = DayScheduleTable(data: data)
        super.init()
        addSubnode(table)
    }

    override func layout() {
        super.layout()
        table.frame = bounds
    }

    override func didEnterVisibleState() {
        super.didEnterVisibleState()
        print("didEnterVisibleState:\(data)")
    }

    override func didEnterDisplayState() {
        super.didEnterDisplayState()
        print("didEnterDisplayState:\(data)")
    }

    override func didEnterPreloadState() {
        super.didEnterPreloadState()
        setNeedsLayout()
        print("didEnterPreloadState:\(data)")
    }

}
