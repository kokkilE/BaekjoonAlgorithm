var numberOfInput = Int(readLine()!)!
var input = readLine()!.split(separator: " ").compactMap({ Int($0) })
var F = [Int](repeating: 0, count: 1000001)
var stack = [Int]()

input.forEach { F[$0] += 1 }

for index in 0..<numberOfInput {
    while !stack.isEmpty && F[input[index]] > F[input[stack.last!]] {
        input[stack.removeLast()] = input[index]
    }
    
    stack.append(index)
}

while !stack.isEmpty {
    input[stack.removeLast()] = -1
}

print(input.map{String($0)}.joined(separator: " "))
