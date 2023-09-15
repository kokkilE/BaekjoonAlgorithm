var input = Int(readLine()!)!
var result = [Int]()
if input == 0 {
    print(0)
}

while input != 0 {
    let rest = input % (-2)
    
    if rest != 0 {
        result.append(1)
        input = (input - 1) / (-2)
    } else {
        result.append(0)
        input /= (-2)
    }
}

print(result.map({$0.description}).reversed().joined())