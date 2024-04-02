# 205. Isomorphic Strings
# Easy

# Given two strings s and t, determine if they are isomorphic.

# Two strings s and t are isomorphic if the characters in s can be replaced to get t.

# All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.


# Example 1:

# Input: s = "egg", t = "add"
# Output: true

# Example 2:

# Input: s = "foo", t = "bar"
# Output: false

# Example 3:

# Input: s = "paper", t = "title"
# Output: true

# Constraints:

# 1 <= s.length <= 5 * 104
# t.length == s.length
# s and t consist of any valid ascii character.

from collections import defaultdict


class Solution:
    # Fails for:
    # s = "bbbaaaba"
    # t = "aaabbbba"

    # Output
    # true

    # Expected
    # false
    def isIsomorphicFail(self, s: str, t: str) -> bool:
      sDict, sList, tDict, tList = defaultdict(int), [], defaultdict(int), []

      for letter in s:
          sDict[letter] += 1
          sList.append(letter)

      for letter in t:
          tDict[letter] += 1
          tList.append(letter)

      for indx, letter in enumerate(sList):
          if sDict[sList[indx]] != tDict[tList[indx]]:
              return False
      return True

    def isIsomorphicZip(self, s, t):
        setS = set(s)
        # print(setS)
        setT = set(t)
        # print(setT)
        setZip = set(zip(s,t))
        # print(setZip)

        return len(setZip) == len(setS) == len(setT)

    def isIsomorphic(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False

        mapS2T = {}
        mapT2S = {}

        for charS, charT in zip(s, t):
            # If the character in s already has a mapping, check if it maps to the correct character in t
            if charS in mapS2T:
                if mapS2T[charS] != charT:
                    return False
            else:
                # If the character in t is already mapped to a different character in s, return false
                if charT in mapT2S:
                    return False

                # Map the characters in s to t and vice versa
                mapS2T[charS] = charT
                mapT2S[charT] = charS

        return True

print("Input 1:", Solution().isIsomorphic("egg", "add"))
print("Input 2:", Solution().isIsomorphic("foo", "bar"))
print("Input 3:", Solution().isIsomorphic("paper", "title"))
