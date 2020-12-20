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
    case mirrorRotate180
    case mirrorRotate270
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
        case .mirrorRotate90: return Edges(top: left, bottom: right, left: flipMap[bottom], right: flipMap[top])
        case .mirrorRotate180: return Edges(top: bottom, bottom: top, left: right, right: left)
        case .mirrorRotate270: return Edges(top: flipMap[right], bottom: flipMap[left], left: top, right: bottom)
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
    let rawData: String
    let edges: Edges
    var possibleMatches: [Edge:[(Id, Orientation)]] = [:]

    init(input: String) {
        let lines = input.components(separatedBy: "\n")
        self.id = Int(lines[0].dropFirst(5).dropLast())!
        self.rawData = lines[1...].joined(separator: "\n")
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
                if edges.top == testEdges.bottom { possibleMatches[.top, default: []].append(matchType) }
                if edges.bottom == testEdges.top { possibleMatches[.bottom, default: []].append(matchType) }
                if edges.left == testEdges.right { possibleMatches[.left, default: []].append(matchType) }
                if edges.right == testEdges.left { possibleMatches[.right, default: []].append(matchType) }
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

    let corners = tiles.values.filter { $0.possibleMatches.count == 2 }.map { $0.id }
    print("\(corners) = \(corners.reduce(1, *))")

}

part1()
