
var stringArray = ["string1", "string2", "string3"]
var intArray = [1, 2, 3, 4, 5, 6, 7, 8]
var doubleArray = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8]

func printStringArray(arr: [String]) {
    for str in arr {
        print(str)
    }
}

func printIntArray(arr: [Int]) {
    for int in arr {
        print(int)
    }
}

func printDoubleArray(arr: [Double]) {
    for dob in arr {
        print(dob)
    }
}

//printStringArray(arr: stringArray)
//printIntArray(arr: intArray)
//printDoubleArray(arr: doubleArray)

// GENERIC EX 1

func printElementFromArray<T>(elemArr: [T]) {  // T-Type
    for elem in elemArr {
        print(elem, "\n")
    }
}

printElementFromArray(elemArr: stringArray)
printElementFromArray(elemArr: intArray)
printElementFromArray(elemArr: doubleArray)
printElementFromArray(elemArr: [stringArray,intArray,doubleArray])

// GENERIC EX 2

func doSomething<T>(x: T) -> T {
    // todo something
    return x
}

doSomething(x: "123")
doSomething(x: 123)
doSomething(x: false)

// GENERIC EX 3

struct GenericArray<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
}

var stringArrayNew = ["string1", "string2", "string3"]
var arrays = GenericArray(items: stringArrayNew)
arrays.push(item: "123")

var arrays2 = GenericArray(items: [1,2,3,4])
arrays2.push(item: 123)


