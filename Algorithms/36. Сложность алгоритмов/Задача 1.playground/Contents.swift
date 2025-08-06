
class MathService {
    
    func findTwoElementsForSumValue(array: [Int], sumValue: Int) -> (firsIndex: Int, secondIndex: Int)? {
        
        var dictionary: [Int : Int] = [:]
        
        for (i, j) in array.enumerated() {
            if let index = dictionary[sumValue - j] {
                return (index, i)
            }
            dictionary[j] = i
        }
        return nil
    }
}

let example = MathService()
let indexes = example.findTwoElementsForSumValue(array: [4,6,8,3,5,24,3,12], sumValue: 133)
print(indexes ?? "not found")




































