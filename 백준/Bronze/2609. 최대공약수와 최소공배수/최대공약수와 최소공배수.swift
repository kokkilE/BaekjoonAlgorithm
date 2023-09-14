var input = readLine()!.split(separator: " ").map({Int($0)!})

var minimumNumber = input[0] > input[1] ? input[1] : input[0]
var maximumNumber = input[0] > input[1] ? input[0] : input[1]

for number in 0...minimumNumber {
    if maximumNumber % (minimumNumber - number) == 0, minimumNumber % (minimumNumber - number) == 0 {
        print((minimumNumber - number))
        break
    }
}

for number in maximumNumber...(maximumNumber * minimumNumber) {
    if number % maximumNumber == 0, number % minimumNumber == 0 {
        print(number)
        break
    }
}