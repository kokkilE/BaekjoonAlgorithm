var radix = readLine()!.split(separator: " ").compactMap({Int($0)})
readLine()
var input = readLine()!.split(separator: " ").compactMap({Int($0)})
var decimal = 0
var implement = 1

while !input.isEmpty {
    decimal += input.removeLast() * implement
    
    implement *= radix[0]
}

var result = [String]()
while decimal != 0 {
    if decimal % radix[1] != 0 {
        result.append(String(decimal % radix[1]))
    } else {
        result.append("0")
    }
    decimal /= radix[1]
}

print(result.reversed().joined(separator: " "))