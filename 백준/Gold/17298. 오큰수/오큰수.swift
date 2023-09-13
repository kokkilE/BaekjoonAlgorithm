var numberOfInput = Int(readLine()!)!
var input = readLine()!.split(separator: " ").compactMap({ Int($0) })
var stack = [Int]()

for index in 0..<input.count {
    
    while !stack.isEmpty && input[index] > input[stack.last!] {
        input[stack.popLast()!] = input[index]
    }
    
    stack.append(index)
}

while !stack.isEmpty {
    input[stack.popLast()!] = -1
}

print(input.map{ String($0) }.joined(separator: " "))