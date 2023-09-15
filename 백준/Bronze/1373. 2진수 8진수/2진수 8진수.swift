var binary = readLine()!.compactMap({Int($0.description)})
var octal = [Int]()

while !binary.isEmpty {
    let decimal = (binary.last != nil ? binary.removeLast() : 0) * 1
    + (binary.last != nil ? binary.removeLast() : 0) * 2
    + (binary.last != nil ? binary.removeLast() : 0) * 4
    
    octal.append(decimal)
}

print(octal.reversed().compactMap({$0.description}).joined())