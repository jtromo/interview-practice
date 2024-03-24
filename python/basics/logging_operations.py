import logging

def test_logging():
  logging.debug("debug log")
  logging.info("info log")
  logging.error("error log")

def main():
  level = logging.DEBUG
  fmt = "[%(levelname)s] %(asctime)s - %(message)s"
  logging.basicConfig(level=level , format=fmt)

  test_logging()

main()
