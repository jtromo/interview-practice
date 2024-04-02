# 121. Best Time to Buy and Sell Stock
# Easy

# You are given an array prices where prices[i] is the price of a given stock on the ith day.

# You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

# Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

# Example 1:

# Input: prices = [7,1,5,3,6,4]
# Output: 5
# Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
# Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.

# Example 2:

# Input: prices = [7,6,4,3,1]
# Output: 0
# Explanation: In this case, no transactions are done and the max profit = 0.


# Constraints:

# 1 <= prices.length <= 105
# 0 <= prices[i] <= 104

# Solution

# Two Pointer Solution

# Memory: O(1) - only pointers
# Time: O(n) - only scan through once

class Solution:
    def maxProfit(self, prices: list[int]) -> int:
        maxP = 0
        left = prices[0] # left=buy, right=sell
        for price in prices:
            right = price
            if left > right:
                left = right
            else:
                profit = right - left
                maxP = max(profit, maxP)
        return maxP

print("Input 1:", Solution().maxProfit([7,1,5,3,6,4]))
print("Input 2:", Solution().maxProfit([7,6,4,3,1]))
