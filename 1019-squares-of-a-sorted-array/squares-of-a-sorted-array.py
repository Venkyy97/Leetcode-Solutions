class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        left = 0
        right = len(nums) - 1 
        arr = []

        while left <= right:
            if abs(nums[left]) > abs(nums[right]):
                arr.append(nums[left] ** 2)
                left += 1
            else:
                arr.append(nums[right]** 2)
                right -= 1
        arr.reverse()
        return arr