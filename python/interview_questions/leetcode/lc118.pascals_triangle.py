# 118. Pascal's Triangle
# Easy

# Given an integer numRows, return the first numRows of Pascal's triangle.

# In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

# Example 1:

# Input: numRows = 5
# Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

# Example 2:

# Input: numRows = 1
# Output: [[1]]


# Constraints:

# 1 <= numRows <= 30

class Solution:
    def generate(self, numRows: int) -> list[list[int]]:
        if numRows == 0:
            return []
        if numRows == 1:
            return [[1]]

        previousRows = self.generate(numRows-1)
        # New run of 1s of the correct length
        newRow = [1] * numRows

        for indx in range(1, numRows-1):
            newRow[indx] = previousRows[-1][indx-1] + previousRows[-1][indx]

        previousRows.append(newRow)
        return previousRows


print("Input 1:", Solution().generate(5))
print("Input 2:", Solution().generate(1))
