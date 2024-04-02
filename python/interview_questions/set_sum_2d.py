def main():

  chart: list[list[int]] = [[0 for x in range(5)] for x in range(5)]
  print(chart)


  def setValue(chart: list[list[int]], location: list[int], value: int):
    x, y = location
    if not x < len(chart):
      print(f"Error: index {x} is out of bound for chart width {len(chart)}")
      return
    yAxis = chart[x]
    if not y < len(yAxis):
      print(f"Error: index {y} is out of bound for chart width {len(yAxis)}")
      return

    chart[x][y] = value

  setValue(chart, [1,1], 2)
  setValue(chart, [1,2], 5)
  setValue(chart, [2,1], 1)
  setValue(chart, [2,2], 3)
  setValue(chart, [2,3], 10)
  setValue(chart, [3,2], 10)
  print(chart)

  def sum(chart: list[list[int]], location1: list[int], location2: list[int]) -> int:
    x1,y1 = location1
    x2,y2 = location2

    leftX = min(x1, x2)
    rightX = max(x1, x2)

    leftY = min(y1, y2)
    rightY = max(y1, y2)

    total = 0
    for x in range(leftX, rightX+1):
      for y in range(leftY, rightY+1):
        total += chart[x][y]
    return total

  print(sum(chart, [1,1], [2,2]))
  print(sum(chart, [2,2], [1,1]))


main()
