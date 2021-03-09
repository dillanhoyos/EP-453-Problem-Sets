




func getAverage(nums: Double...) -> Double {
    var temp = 0.0
        for num in nums
        {
            temp+=num
        }
       
    return temp/Double(nums.count)
    }


getAverage (nums: 10,10,10,6,5,4)



