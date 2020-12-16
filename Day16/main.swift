
import Foundation

struct Field {
    let name: String
    let ranges: [ClosedRange<Int>]
    
    func isValid(value: Int) -> Bool {
        return ranges.reduce(false) { (foundMatch, range) in
            return foundMatch || range.contains(value)
        }
    }
}

let definitions = rawDefinitions.split(separator: "\n")
    .map { line -> Field in
        let components = line.components(separatedBy: ": ")
        let ranges = components[1].components(separatedBy: " or ")
        return Field(
            name: components[0],
            ranges: ranges.map {
                let bounds = $0.split(separator: "-").map { Int(String($0))! }
                return bounds[0]...bounds[1]
            })
    }

func validate(_ ticket: [Int]) -> [Int] {
    return ticket.filter { value in
        !definitions.contains { (field) -> Bool in
            field.isValid(value: value)
        }
    }
}

func part1() {
    let invalidValues = otherTickets.flatMap { validate($0) }
    print(invalidValues.reduce(0, { $0 + $1 }))
}

func part2() {
    let allFields = Set(definitions.map { $0.name })
    var possibleFields = Array<Set<String>>(repeating: allFields, count: myTicket.count)
    let allTickets = ([myTicket] + otherTickets).filter { validate($0).isEmpty }
    for ticket in allTickets {
        for (index, value) in ticket.enumerated() {
            let validFields = definitions.filter { $0.isValid(value: value) }.map { $0.name }
            possibleFields[index] = possibleFields[index].intersection(validFields)
//              print("\(index): \(validFields) -> \(possibleFields[index])")
        }
    }
    var determinedFields = [(String, Int)]()
    while determinedFields.count < allFields.count {
        guard let newFieldIndex = possibleFields.firstIndex(where: { (fields) -> Bool in
            fields.count == 1
        }) else { break }
        let newField = possibleFields[newFieldIndex].first!
        determinedFields.append((newField, newFieldIndex))
        for (index, field) in possibleFields.enumerated() {
            possibleFields[index] = field.subtracting([newField])
        }
    }
    print(determinedFields)
    
    var result = 1
    for (field, index) in determinedFields {
        if field.hasPrefix("departure") {
            result *= myTicket[index]
        }
    }
    print(result)
}

part2()
