class Solution:
    def isValid(self, s: str) -> bool:
        stk = []
        hmap = {')':'(', ']':'[', '}': '{'}

        for c in s:
            if not c in hmap:
                stk.append(c)
            else:
                if not stk:
                    return False
                else:
                    popped = stk.pop()
                    if popped != hmap[c]:
                        return False
        return True if not stk else False