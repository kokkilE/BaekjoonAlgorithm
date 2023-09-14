var input = Int(readLine()!)!
var result = 1
var count = 0

while input > 0 {
    result = (result * input) % 100000
    input -= 1
    
    if result % 10 == 0 {
        result /= 10
        count += 1
    }
}

print(count)