func isPrimeNumber(_ number: Int) -> Bool {
    if number == 2 || number == 3 { return true }
    if number <= 1 { return false }
    
    for divisor in 2...(number / 2) {
        if number % divisor == 0 { return false }
    }
    
    return true
}

let _ = readLine()
var input = readLine()!.split(separator: " ").map({Int($0)!})
var count = 0

input.forEach {
    if isPrimeNumber($0) { count += 1 }
}

print(count)