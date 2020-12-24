//
//  main.swift
//  Day24
//
//  Created by Jerry Hsu on 12/24/20.
//

import Foundation

enum Direction: CaseIterable {
    case e
    case w
    case nw
    case ne
    case sw
    case se
}

func parse(line: String) -> [Direction] {
    var result = [Direction]()
    var cached: Character? = nil
    for char in line {
        switch (cached, char) {
        case (.none, "s"),
             (.none, "n"):
            cached = char
        case ("s", "e"):
            result.append(.se)
            cached = nil
        case ("s", "w"):
            result.append(.sw)
            cached = nil
        case ("n", "e"):
            result.append(.ne)
            cached = nil
        case ("n", "w"):
            result.append(.nw)
            cached = nil
        case (.none, "e"):
            result.append(.e)
        case (.none, "w"):
            result.append(.w)
        default:
            fatalError("Bad parse \(String(describing: cached)) \(char)")
        }
    }
    return result
}

struct HexPoint: Equatable, Hashable {
    let row, col: Int

    func point(to direction: Direction) -> HexPoint {
        switch direction {
        case .e:
            return HexPoint(row: row, col: col + 2)
        case .w:
            return HexPoint(row: row, col: col - 2)
        case .nw:
            return HexPoint(row: row - 1, col: col - 1)
        case .ne:
            return HexPoint(row: row - 1, col: col + 1)
        case .sw:
            return HexPoint(row: row + 1, col: col - 1)
        case .se:
            return HexPoint(row: row + 1, col: col + 1)
        }
    }
}

func part1() {
    var blackTiles = Set<HexPoint>()

    let points = input.components(separatedBy: "\n")
        .map(parse)
        .map {
            $0.reduce(HexPoint(row: 0, col: 0), { (previous, direction) in
                previous.point(to: direction)
            })
        }
    points.forEach { (point) in
        if blackTiles.contains(point) {
            blackTiles.remove(point)
        } else {
            blackTiles.insert(point)
        }
    }
    print(blackTiles.count)
}

part1()

func part2() {
    var blackTiles = Set<HexPoint>()
    var minRow = 0
    var maxRow = 0
    var minCol = 0
    var maxCol = 0

    let points = input.components(separatedBy: "\n")
        .map(parse)
        .map {
            $0.reduce(HexPoint(row: 0, col: 0), { (previous, direction) in
                previous.point(to: direction)
            })
        }

    points.forEach { (point) in
        minRow = min(point.row, minRow)
        maxRow = max(point.row, maxRow)
        minCol = min(point.col, minCol)
        maxCol = max(point.col, maxCol)
        if blackTiles.contains(point) {
            blackTiles.remove(point)
        } else {
            blackTiles.insert(point)
        }
    }

    print("Start \(blackTiles.count)")

    for iteration in 1...100 {
        let previousState = blackTiles
        for row in (minRow - 1)...(maxRow + 1) {
            for col in (minCol - 1)...(maxCol + 1) {
                let point = HexPoint(row: row, col: col)
                let count = Direction.allCases.reduce(0, { (sum, direction) in
                    sum + (previousState.contains(point.point(to: direction)) ? 1 : 0)
                })
                if previousState.contains(point) {
                    if count == 0 || count > 2 {
                        blackTiles.remove(point)
                    }
                } else {
                    if count == 2 {
                        blackTiles.insert(point)
                        minRow = min(point.row, minRow)
                        maxRow = max(point.row, maxRow)
                        minCol = min(point.col, minCol)
                        maxCol = max(point.col, maxCol)
                    }
                }
            }
        }
        print("\(iteration) \(blackTiles.count)")
    }
}

part2()
