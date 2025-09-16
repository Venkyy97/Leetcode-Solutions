class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        nums.sort()
        ans = []
        n =len(nums)
        for i in range(n):
            if nums[i] > 0:
                break
            elif i > 0 and nums[i] == nums[i-1]:
                continue

            
            lo = i + 1
            hi = n - 1 
            while lo < hi:
                summ = nums[lo] + nums[hi] + nums[i]
                if summ == 0:
                    ans.append([nums[i], nums[lo], nums[hi]])
                    lo += 1 
                    hi -= 1
                    while lo < hi and nums[lo] == nums[lo - 1 ]:
                        lo += 1 
                    while lo < hi and nums[hi] == nums[hi + 1 ]:
                        hi -= 1
                elif summ < 0:
                    lo += 1
                else:
                    hi -= 1
        return ans
