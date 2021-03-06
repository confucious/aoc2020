//
//  main.swift
//  Day20
//
//  Created by Jerry Hsu on 12/20/20.
//

import Foundation

enum Orientation: CaseIterable {
    case original
    case mirrorV
    case mirrorH
    case rotate90
    case rotate180
    case rotate270
    case mirrorRotate90
    case mirrorRotate270

    func adjust(for orientation: Orientation) -> Orientation {
        switch (self, orientation) {
        case (.original, _): return orientation
        case (_, .original): return self
        case (.mirrorV, .mirrorV),
             (.mirrorH, .mirrorH),
             (.rotate90, .rotate270),
             (.rotate270, .rotate90),
             (.rotate180, .rotate180),
             (.mirrorRotate90, .mirrorRotate90),
             (.mirrorRotate270, .mirrorRotate270): return .original
        case (.mirrorV, .mirrorH),
             (.mirrorH, .mirrorV),
             (.rotate90, .rotate90),
             (.rotate270, .rotate270),
             (.mirrorRotate270, .mirrorRotate90),
             (.mirrorRotate90, .mirrorRotate270): return .rotate180
        case (.mirrorV, .rotate90),
             (.mirrorH, .rotate270),
             (.rotate90, .mirrorH),
             (.rotate270, .mirrorV),
             (.mirrorRotate270, .rotate180),
             (.rotate180, .mirrorRotate270): return .mirrorRotate90
        case (.mirrorV, .rotate180),
             (.rotate90, .mirrorRotate270),
             (.rotate180, .mirrorV),
             (.mirrorRotate90, .rotate90),
             (.mirrorRotate270, .rotate270),
             (.rotate270, .mirrorRotate90): return .mirrorH
        case (.mirrorV, .rotate270),
             (.mirrorH, .rotate90),
             (.rotate90, .mirrorV),
             (.rotate270, .mirrorH),
             (.mirrorRotate90, .rotate180),
             (.rotate180, .mirrorRotate90): return .mirrorRotate270
        case (.mirrorV, .mirrorRotate90),
             (.mirrorH, .mirrorRotate270),
             (.mirrorRotate270, .mirrorV),
             (.mirrorRotate90, .mirrorH),
             (.rotate270, .rotate180),
             (.rotate180, .rotate270): return .rotate90
        case (.mirrorV, .mirrorRotate270),
             (.rotate90, .rotate180),
             (.mirrorH, .mirrorRotate90),
             (.mirrorRotate90, .mirrorV),
             (.mirrorRotate270, .mirrorH),
             (.rotate180, .rotate90): return .rotate270
        case (.mirrorH, .rotate180),
             (.rotate90, .mirrorRotate90),
             (.rotate180, .mirrorH),
             (.mirrorRotate270, .rotate90),
             (.mirrorRotate90, .rotate270),
             (.rotate270, .mirrorRotate270): return .mirrorV
        }
    }
}

enum Edge {
    case top
    case left
    case right
    case bottom
}

struct Edges {
    let top, bottom, left, right: Int

    func convert(to orientation: Orientation) -> Edges {
        switch orientation {
        case .original: return self
        case .mirrorV: return Edges(top: bottom, bottom: top, left: flipMap[left], right: flipMap[right])
        case .mirrorH: return Edges(top: flipMap[top], bottom: flipMap[bottom], left: right, right: left)
        case .rotate90: return Edges(top: flipMap[left], bottom: flipMap[right], left: bottom, right: top)
        case .rotate180: return Edges(top: flipMap[bottom], bottom: flipMap[top], left: flipMap[right], right: flipMap[left])
        case .rotate270: return Edges(top: right, bottom: left, left: flipMap[top], right: flipMap[bottom])
        case .mirrorRotate90: return Edges(top: left, bottom: right, left: top, right: bottom)
        case .mirrorRotate270: return Edges(top: flipMap[right], bottom: flipMap[left], left: flipMap[bottom], right: flipMap[top])
        }
    }
}

func getInt(from bitmap: String) -> Int {
    return bitmap.reduce(0) { (result, character) in
        result << 1 | (character == "#" ? 1 : 0)
    }
}

struct Tile {
    typealias Id = Int
    let id: Id
    let rawData: [String]
    let cleanData: [String]
    let r90Data: [String]
    let edges: Edges
    var matches: [Edge:(Id, Orientation)] = [:]

    static func rotate(_ data: [String]) -> [String] {
        return (0..<8).map { (index) in String(data.map { $0.prefix(index + 1).suffix(1) }.joined().reversed()) }
    }
    init(input: String) {
        let lines = input.components(separatedBy: "\n")
        self.id = Int(lines[0].dropFirst(5).dropLast())!
        self.rawData = Array(lines[1...])
        self.cleanData = rawData[1...8].map { String($0.dropFirst().dropLast()) }
        self.r90Data = Tile.rotate(cleanData)
        let topEdge = getInt(from: lines[1])
        let bottomEdge = getInt(from: lines[10])
        let leftEdge = getInt(from: lines[1...].map { String($0.first!) }.joined())
        let rightEdge = getInt(from: lines[1...].map { String($0.last!) }.joined())
        self.edges = Edges(top: topEdge, bottom: bottomEdge, left: leftEdge, right: rightEdge)
    }

    mutating func recordMatches(against otherTile: Tile) {
        Orientation.allCases
            .map { (otherTile.edges.convert(to: $0), $0) }
            .forEach { (testEdges, orientation) in
                let matchType = (otherTile.id, orientation)
                if edges.top == testEdges.bottom { matches[.top] = matchType }
                if edges.bottom == testEdges.top { matches[.bottom] = matchType }
                if edges.left == testEdges.right { matches[.left] = matchType }
                if edges.right == testEdges.left { matches[.right] = matchType }
            }
    }

    func row(_ index: Int, oriented: Orientation) -> String {
        switch oriented {
        case .original: return cleanData[index]
        case .mirrorV: return cleanData[7 - index]
        case .mirrorH: return String(cleanData[index].reversed())
        case .rotate180: return String(cleanData[7 - index].reversed())
        case .rotate90: return r90Data[index]
        case .rotate270: return String(r90Data[7 - index].reversed())
        case .mirrorRotate90: return String(r90Data[index].reversed())
        case .mirrorRotate270: return r90Data[7 - index]
        }
    }

    func tileToRight(oriented: Orientation) -> (Tile.Id, Orientation)? {
        switch oriented {
        case .original: return matches[.right].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .mirrorH: return matches[.left].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .mirrorV: return matches[.right].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .rotate90: return matches[.top].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .rotate180: return matches[.left].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .rotate270: return matches[.bottom].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .mirrorRotate90: return matches[.bottom].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .mirrorRotate270: return matches[.top].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        }
    }

    func tileToBottom(oriented: Orientation) -> (Tile.Id, Orientation)? {
        switch oriented {
        case .original: return matches[.bottom].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .mirrorH: return matches[.bottom].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .mirrorV: return matches[.top].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .rotate90: return matches[.right].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .rotate180: return matches[.top].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .rotate270: return matches[.left].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .mirrorRotate90: return matches[.right].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        case .mirrorRotate270: return matches[.left].flatMap { ($0.0, $0.1.adjust(for: oriented)) }
        }
    }

}

let flipMap: [Int] = (0..<0x400).map { (value) in
    var flipped = 0
    for index in 0..<10 {
        let bit = (value & 1 << index == 0) ? 0 : 1
        flipped = flipped << 1 | bit
    }
    return flipped
}

func part1() {
    var tiles: [Tile.Id:Tile] = input.components(separatedBy: "\n\n").reduce(into: [:], { (map, input) in
        let tile = Tile(input: input)
        map[tile.id] = tile
    })

    for index in tiles.keys {
        for testIndex in tiles.keys {
            if index != testIndex {
                var tile = tiles[index]!
                tile.recordMatches(against: tiles[testIndex]!)
                tiles[index] = tile
            }
        }
    }

    let corners = tiles.values.filter { $0.matches.count == 2 }.map { $0.id }
    print("\(corners) = \(corners.reduce(1, *))")
}

func order(tiles: [Tile.Id:Tile]) -> [[(Tile.Id, Orientation)]] {
    var firstTile = tiles.values.filter { $0.matches.count == 2 }.first!
    var firstOrientation: Orientation
    switch Set(firstTile.matches.keys) {
    case [.right, .bottom]: firstOrientation = .original
    case [.right, .top]: firstOrientation = .rotate90
    case [.left, .bottom]: firstOrientation = .rotate270
    case [.left, .top]: firstOrientation = .rotate180
    default: fatalError("Orientations are weird \(firstTile)")
    }

    var result = [[(Tile.Id, Orientation)]]()
    result.append([(firstTile.id, firstOrientation)])

    var done = false
    while !done {
        var currentTileIdAndOrientation = result.last![0]
        while let nextTileIdAndOrientation = tiles[currentTileIdAndOrientation.0]!.tileToRight(oriented: currentTileIdAndOrientation.1) {
            result[result.count - 1].append(nextTileIdAndOrientation)
            currentTileIdAndOrientation = nextTileIdAndOrientation
        }
        if let nextTileIdAndOrientation = firstTile.tileToBottom(oriented: firstOrientation) {
            firstTile = tiles[nextTileIdAndOrientation.0]!
            firstOrientation = nextTileIdAndOrientation.1
            result.append([(firstTile.id, firstOrientation)])
        } else {
            done = true
        }
    }
    return result
}

func arrange(tiles: [Tile.Id:Tile], order: [[(Tile.Id, Orientation)]]) -> [String] {
    var result: [String] = []
    for row in order {
        for line in 0..<8 {
            var rowResult = ""
            for tile in row {
                rowResult.append(tiles[tile.0]!.row(line, oriented: tile.1))
            }
            result.append(rowResult)
        }
    }
    return result
}

let monster = """
                  #
#    ##    ##    ###
 #  #  #  #  #  #
"""

struct Point: Hashable & Equatable {
    let x, y: Int

    func offset(x deltaX: Int, y deltaY: Int) -> Point {
        return Point(x: x + deltaX, y: y + deltaY)
    }
}

func search(monster: String, map: [String]) -> Int {
    let monsterPoints: [Point] = monster.components(separatedBy: "\n").enumerated().flatMap { (row, line) in
        return line.enumerated().filter { $0.1 == "#" }.map { Point(x: $0.0, y: row) }
    }

    var marks: Set<Point> = []
    let maxX = map[0].count - 20
    let maxY = map.count - 3
    for (rowIndex, line) in map.enumerated() {
        for (colIndex, char) in line.enumerated() {
            if char == "#" {
                marks.insert(Point(x: colIndex, y: rowIndex))
            }
        }
    }

    var count = 0
    for x in 0...maxX {
        for y in 0...maxY {
            let offsetMonsterPoints = monsterPoints.map { $0.offset(x: x, y: y) }
            if marks.isSuperset(of: offsetMonsterPoints) {
                count += 1
                marks.subtract(offsetMonsterPoints)
            }
        }
    }
    print("\(count) found \(marks.count) # remaining")
    return count
}

func part2() {
    var tiles: [Tile.Id:Tile] = input.components(separatedBy: "\n\n").reduce(into: [:], { (map, input) in
        let tile = Tile(input: input)
        map[tile.id] = tile
    })

    for index in tiles.keys {
        for testIndex in tiles.keys {
            if index != testIndex {
                var tile = tiles[index]!
                tile.recordMatches(against: tiles[testIndex]!)
                tiles[index] = tile
            }
        }
    }

    let ordered = order(tiles: tiles)
    print(ordered)
    let combined = arrange(tiles: tiles, order: ordered)

    print(combined.joined(separator: "\n"))

    // The stitching orientation is random on each run through so just re-run the program until
    // search comes up with any number of monster.
    search(monster: monster, map: combined)

}

part2()
