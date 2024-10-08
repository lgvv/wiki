//
//  1768.swift
//  Algorithm
//
//  Created by Geon Woo lee on 10/7/24.
//

class Solution_LC1768 {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        let len1 = word1.count
        let len2 = word2.count
        
        var result: String = ""
        // 1. 두 단어의 교차된 부분을 먼저 처리
        zip(word1, word2).forEach { w1, w2 in
            result += "\(w1)\(w2)"
        }
        
        // 2. 두 단어의 남은 부분 처리
        if len1 > len2 {
            let remainingPart = word1.dropFirst(len2)
            result += remainingPart
        } else if len2 > len1 {
            let remainingPart = word2.dropFirst(len1)
            result += remainingPart
        }
        
        return result
    }
}

class Solution_LC1071 {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        // 최대 공약수 구하는 함수
        func gcd(_ a: Int, _ b: Int) -> Int {
//            print("a: \(a) b: \(b)")
            return b == 0 ? a : gcd(b, a % b)
        }
        
        // 두 문자열을 이어붙인 값이 서로 다르면 공통된 패턴이 없음
        if str1 + str2 != str2 + str1 {
            return ""
        }
        
        // 두 문자열 길이의 최대 공약수를 구하고, 그 길이만큼 자른 문자열이 답
        let gcdLength = gcd(str1.count, str2.count)
        return String(str1.prefix(gcdLength))
    }
}


class Solution_LC1431 {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let max = candies.max() ?? 100
        
        var results: [Bool] = []
        candies.forEach { candy in
            let result = candy + extraCandies >= max
            results.append(result)
        }
        
        return results
    }
}

class Solution_LC605 {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var flowerbed = flowerbed
        var n = n
        
        if n == 0 { return true }
        
        for i in flowerbed.indices {
            if flowerbed[i] == 0 {
                let prevIndex = max(i-1, 0)
                let nextIndex = min(i+1, flowerbed.count-1)
                
                let prev = flowerbed[prevIndex] == 0
                let next = flowerbed[nextIndex] == 0
                
                if prev && next {
                    flowerbed[i] = 1
                    n -= 1
                }
            }
            
            if n == 0 { return true }
            
        }
        
        return false
    }
}

class Solution_LC345 {
    func reverseVowels(_ s: String) -> String {
        let vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        
        var finds = [Character]()
        
        s.forEach { c in
            if vowels.contains("\(c)") {
                finds.append(c)
            }
        }
        
        var answer = ""
        var lastIndex = finds.count - 1
        
        s.forEach { c in
            if vowels.contains("\(c)") {
                answer += "\(finds[lastIndex])"
                lastIndex -= 1
            } else {
                answer += "\(c)"
            }
        }
        
        return answer
    }
}

class Solution_LC151 {
    func reverseWords(_ s: String) -> String {
        let arr = s.split(separator: " ").reversed().joined(separator: " ")
//        print(arr)
        return arr
    }
}

class Solution_LC238 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var nums = nums
        
        var zeroCount = 0
        var total = 1
        
//        var num = 0
        for i in nums.indices {
            var num = nums[i]
            if num == 0 {
                zeroCount += 1
                total *= 1
                
                if zeroCount >= 2 {
                    nums = nums.map { num in
                        return 0
                    }
                    return nums
                }
            } else {
                total *= num
            }
        }
        
        
        if zeroCount >= 2 {
            nums = nums.map { num in
                return 0
            }
            return nums
        } else if zeroCount == 1 {
            nums = nums.map { num in
                if num == 0 { return total }
                else { return 0 }
            }
        } else {
            nums = nums.map { num in
                if num == 0 { return total }
                else { return total / num }
            }
        }
        
        return nums
    }
}

