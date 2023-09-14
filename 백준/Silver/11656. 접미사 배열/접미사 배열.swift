var input = readLine()!
var prefixList = [String]()

while !input.isEmpty {
    prefixList.append(input)
    input.removeFirst()
}

prefixList.sort()
prefixList.forEach {
    print($0)
}