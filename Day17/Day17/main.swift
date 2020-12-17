//
//  main.swift
//  Day17
//
//  Created by Jerry Hsu on 12/17/20.
//

import Foundation

struct Point: Equatable, Hashable {
    let x, y, z: Int

    func offset(x deltaX: Int, y deltaY: Int, z deltaZ: Int) -> Point {
        return Point(x: self.x + deltaX, y: self.y + deltaY, z: self.z + deltaZ)
    }

    static let neighborOffsets: [(Int, Int, Int)] = (-1...1).flatMap { x in
        (-1...1).flatMap { y in
            (-1...1).compactMap { z in
                if x == 0 && y == 0 && z == 0 {
                    return nil
                }
                return (x, y, z)
            }
        }
    }

    var neighbors: [Point] {
        return Point.neighborOffsets.map {
            offset(x: $0, y: $1, z: $2)
        }
    }
}

struct Map {
    var minX, maxX, minY, maxY, minZ, maxZ: Int
    var points: Set<Point>

    init(input: String) {
        minX = 0
        maxX = 0
        minY = 0
        maxY = 0
        minZ = 0
        maxZ = 0
        points = Set()
        let lines = input.split(separator: "\n")
        maxY = lines.count - 1
        maxX = lines[0].count - 1
        for (y, line) in lines.enumerated() {
            for (x, char) in line.enumerated() {
                if char == "#" {
                    points.insert(Point(x: x, y: y, z: 0))
                }
            }
        }
    }

    func neighborCount(_ point: Point) -> Int {
        let activeNeighbors = point.neighbors.filter { points.contains($0) }
//        print("\(point): \(activeNeighbors)")
        return activeNeighbors.count
    }

    func step() -> Map {
        var result = self
        for xIndex in (minX - 1)...(maxX + 1) {
            for yIndex in (minY - 1)...(maxY + 1) {
                for zIndex in (minZ - 1)...(maxZ + 1) {
                    let test = Point(x: xIndex, y: yIndex, z: zIndex)
                    if points.contains(test) {
                        // active
                        if (2...3).contains(neighborCount(test)) {
                            result.points.insert(test)
                        } else {
                            result.points.remove(test)
                        }
                    } else {
                        // inactive
                        if neighborCount(test) == 3 {
                            result.points.insert(test)
                            result.minX = min(result.minX, test.x)
                            result.minY = min(result.minY, test.y)
                            result.minZ = min(result.minZ, test.z)
                            result.maxX = max(result.maxX, test.x)
                            result.maxY = max(result.maxY, test.y)
                            result.maxZ = max(result.maxZ, test.z)
                        } else {
                            result.points.remove(test)
                        }
                    }
                }
            }
        }
        return result
    }

    func display() {
        print("\(minX)-\(maxX), \(minY)-\(maxY), \(minZ)-\(maxZ)")
        for zIndex in (minZ)...(maxZ) {
            print("z=\(zIndex)")
            for yIndex in (minY)...(maxY) {
                print((minX...maxX).map { points.contains(Point(x: $0, y: yIndex, z: zIndex)) ? "#" : "." }.joined())
            }
        }

    }
}

let input = """
######.#
#.###.#.
###.....
#.####..
##.#.###
.######.
###.####
######.#
"""

let sampleInput = """
            .#.
            ..#
            ###
            """
func part1() {
    var map = Map(input: input)
    map.display()
    for _ in 0..<6 {
        map = map.step()
        map.display()
    }
    print(map.points.count)
}

part1()

