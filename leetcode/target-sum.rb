# @param {Integer[]} nums
# @param {Integer} s
# @return {Integer}
def find_target_sum_ways(nums, s)
    memo = {}
    sub(0, nums, s, memo)
end

def sub(index, nums, s, memo)
    if index < nums.length
        return memo[[index, s]] if memo[[index, s]]
        res = sub(index+1, nums, s-nums[index], memo) + sub(index+1, nums, s+nums[index], memo)
        memo[[index, s]] = res
        res
    else
       s.zero? ? 1 : 0
    end
end