class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        mini,maxi=min(strs),max(strs)

        for i in range(len(mini)):
            if mini[i]!=maxi[i]:
                return mini[:i]
        return mini

   


