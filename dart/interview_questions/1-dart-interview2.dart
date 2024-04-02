void main() {
  String? s;

  bool isNumeric(String s) {
    try {
      double.parse(s);
      return true;
    } catch (e) {
      return false;
    }
  }

  s = '123.4';
  print('isNumeric: ${isNumeric(s)}');
  s = '123.4sfd';
  print('isNumeric: ${isNumeric(s)}');
  s = '-123';
  print('isNumeric: ${isNumeric(s)}');
  s = null;
  print('isNumeric: ${isNumeric(s ?? "")}');
  s = '2e10';
  print('isNumeric: ${isNumeric(s)}');

  bool validParentheses(String? s) {
    if (s == null || s.isEmpty) return true;
    int openCurly = 0;
    int openSquare = 0;
    int openParen = 0;

    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
        case '{':
          openCurly++;
          break;
        case '}':
          openCurly--;
          break;
        case '[':
          openSquare++;
          break;
        case ']':
          openSquare--;
          break;
        case '(':
          openParen++;
          break;
        case ')':
          openParen--;
          break;
        default:
          break;
      }

      if ((openCurly < 0) || (openSquare < 0) || (openParen < 0)) {
        return false;
      }
    }
    if ((openCurly != 0) || (openSquare != 0) || (openParen != 0)) {
      return false;
    }

    return true;
  }

  s = '';
  print('validParentheses: ${validParentheses(s)}');
  s = null;
  print('validParentheses: ${validParentheses(s)}');
  s = '{[({[}]])}';
  print('validParentheses: ${validParentheses(s)}');
  s = '}}}{{{';
  print('validParentheses: ${validParentheses(s)}');
  s = '[{({(]';
  print('validParentheses: ${validParentheses(s)}');
}
