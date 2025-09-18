class Solution:
    def minEatingSpeed(self, piles: List[int], h: int) -> int:
        l, r = 1, max(piles)
        res = r

        while l <= r:
            m = (l+r) // 2 
            totaltime = 0
            for p in piles:
                totaltime += math.ceil(float(p)/m)
            if totaltime <= h:
                res = m
                r = m - 1 
            else:
                l = m + 1

        return res

