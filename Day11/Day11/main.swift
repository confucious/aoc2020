//
//  main.swift
//  Day11
//
//  Created by Jerry Hsu on 12/11/20.
//

import Foundation

enum LocationType {
    case floor
    case empty
    case occupied
}

struct Map: Equatable {
    let width: Int
    let height: Int

    var locations: [LocationType]

    init(input: String) {
        let lines = input.split(separator: "\n")
        self.width = lines[0].count
        self.height = lines.count
        self.locations = Array<LocationType>(repeating: .floor, count: width * height)
        for (rowIndex, line) in lines.enumerated() {
            for (colIndex, char) in line.enumerated() {
                switch char {
                case ".": set(col: colIndex, row: rowIndex, value: .floor)
                case "L": set(col: colIndex, row: rowIndex, value: .empty)
                case "#": set(col: colIndex, row: rowIndex, value: .occupied)
                default:
                    fatalError("Unknown \(char)")
                }
            }
        }
    }

    private func index(col: Int, row: Int) -> Int {
        return col + row * width
    }

    mutating func set(col: Int, row: Int, value: LocationType) {
        locations[index(col: col, row: row)] = value
    }

    func get(col: Int, row: Int) -> LocationType {
        if col < 0 || col >= width || row < 0 || row >= height {
            return .empty
        } else {
            return locations[index(col: col, row: row)]
        }
    }

    func countAround(col: Int, row: Int) -> Int {
        return (get(col: col - 1, row: row - 1) == .occupied ? 1 : 0)
            + (get(col: col - 1, row: row - 0) == .occupied ? 1 : 0)
            + (get(col: col - 1, row: row + 1) == .occupied ? 1 : 0)
            + (get(col: col - 0, row: row - 1) == .occupied ? 1 : 0)
            + (get(col: col - 0, row: row + 1) == .occupied ? 1 : 0)
            + (get(col: col + 1, row: row - 1) == .occupied ? 1 : 0)
            + (get(col: col + 1, row: row - 0) == .occupied ? 1 : 0)
            + (get(col: col + 1, row: row + 1) == .occupied ? 1 : 0)
    }

    func step() -> Map {
        var result = self
        for col in 0..<width {
            for row in 0..<height {
                switch get(col: col, row: row) {
                case .floor:
                    continue
                case .empty:
                    if countAround(col: col, row: row) == 0 {
                        result.set(col: col, row: row, value: .occupied)
                    }
                case .occupied:
                    if countAround(col: col, row: row) >= 4 {
                        result.set(col: col, row: row, value: .empty)
                    }
                }
            }
        }
        return result
    }

    func countOccupied() -> Int {
        return locations.filter { $0 == .occupied }.count
    }
}

func part1() {
    var map = Map(input: input)
    var changed = true
    while changed {
        let newMap = map.step()
        if map == newMap {
            changed = false
        }
        map = newMap
    }
    print(map.countOccupied())
}

part1()
