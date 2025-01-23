# Your code must be written in Python (preferred) or JavaScript.

# You may use external libraries.

# You may write helper functions, but there should be one function that:

# 1. Takes in one argument, which is a string containing the URL for the Google Doc with the input data, AND

# 2. When called, prints the grid of characters specified by the input data, displaying a graphic of correctly oriented uppercase letters.

# Create a dictionary to represent a grid with values defaulting to a space representing a pace in the grid
# grid1 = defaultdict(defaultdict(lambda: " ").copy)
# grid1[0][0] = "|"
# grid1[0][1] = "|"
# grid1[0][2] = "|"
# grid1[1][1] = "'"
# grid1[1][2] = "'"
# grid1[2][1] = "'"
# grid1[2][2] = "'"
# grid1[3][2] = "'"
# grid1[9][0] = "Test"

# print("test1")
# print(grid1[5][4])
# print("test2")

# maxX = 9
# # maxX = 9
# maxY = 2

import requests
from bs4 import BeautifulSoup
from collections import defaultdict

def printGrid(twoDgrid: dict[dict], maxX:int, maxY:int):
    # Print y axis from bottom up to represent a grid
    for y in reversed(range(maxY+1)):
        # Print each line in grid
        for x in range(maxX+1):
            # Prints either the character or a space
            print(twoDgrid[x][y], end='')
        # Move to next line
        print()

def solution(url: str):
  response = requests.get(url)

  # Create a dictionary to represent a grid with values defaulting to a space representing a pace in the grid
  grid = defaultdict(defaultdict(lambda: " ").copy)

  # Track max x and y coordinates for the grid size
  maxX = 0
  maxY = 0

  # Parse the HTML to retrieve the table containing the grid data
  soup = BeautifulSoup(response.content, "html.parser")
  tables = soup.find_all("table")
  for table in tables:
    rows = table.find_all("tr")
    for row in rows:
      # Parse teh rows to get the x and y coordinates and the character

      columns = row.find_all("td")

      # Skip the title row and any other that is not a number for the first column
      if (columns[0].text.isnumeric() == False):
        continue

      xCoordinate = int(columns[0].text)
      if xCoordinate > maxX:
        maxX = xCoordinate

      yCoordinate = int(columns[2].text)
      if yCoordinate > maxY:
        maxY = yCoordinate

      character = columns[1].text

      # Add the character to the grid
      grid[xCoordinate][yCoordinate] = character

  # Print the grid
  printGrid(grid, maxX, maxY)


# Test Cases

# Sample Test Case:
print("\nSample Test Case:")
solution("https://docs.google.com/document/d/e/2PACX-1vRMx5YQlZNa3ra8dYYxmv-QIQ3YJe8tbI3kqcuC7lQiZm-CSEznKfN_HYNSpoXcZIV3Y_O3YoUB1ecq/pub")

# Verification Test Case:
print("\nVerification Test Case:")
solution("https://docs.google.com/document/d/e/2PACX-1vSHesOf9hv2sPOntssYrEdubmMQm8lwjfwv6NPjjmIRYs_FOYXtqrYgjh85jBUebK9swPXh_a5TJ5Kl/pub")
