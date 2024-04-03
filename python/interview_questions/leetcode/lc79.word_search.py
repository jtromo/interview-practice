# 79. Word Search
# Medium

# Given an m x n grid of characters board and a string word, return true if word exists in the grid.

# The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

# Example 1:

# Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
# Output: true

# Example 2:

# Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
# Output: true

# Example 3:

# Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
# Output: false


# Constraints:

# m == board.length
# n = board[i].length
# 1 <= m, n <= 6
# 1 <= word.length <= 15
# board and word consists of only lowercase and uppercase English letters.

# Follow up: Could you use search pruning to make your solution faster with a larger board?

class Solution:
    def exist(self, board: list[list[str]], word: str) -> bool:
        def dfs(board: list[list[str]], word :str, xIndx: int, yIndx: int, foundIndx: int) -> bool:
            # Bounds checks
            if xIndx < 0 or xIndx >= len(board) or yIndx < 0 or yIndx >= len(board[0]):
                return False

            # Letter doesn't match
            foundLetter = board[xIndx][yIndx]
            if word[foundIndx] != foundLetter:
                return False

            # Full word was found
            if foundIndx == len(word) - 1:
                return True

            # Mark board location as searched to avoid using it again
            board[xIndx][yIndx] = "!"

            # Search right, up, left, down
            result = dfs(board, word, xIndx + 1, yIndx, foundIndx+1) or dfs(board, word, xIndx, yIndx + 1, foundIndx+1) or dfs(board, word, xIndx - 1, yIndx, foundIndx+1) or dfs(board, word, xIndx, yIndx - 1, foundIndx+1)

            # Restore letter at location after search
            board[xIndx][yIndx] = foundLetter

            return result


        for xIndx in range(len(board)):
            for yIndx in range(len(board[0])): # since all columns are same height
                if dfs(board, word, xIndx, yIndx, 0):
                    return True
        return False

print("Input 1:", Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))
print("Input 2:", Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE"))
print("Input 3:", Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB"))

