#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
CharacterVector specialcharacter(CharacterVector x) {
  int n = x.size();
  CharacterVector out(n);

  for (int i = 0; i < n; i++) {
    if (CharacterVector::is_na(x[i])) {
      out[i] = NA_STRING;
      continue;
    }

    std::string s = as<std::string>(x[i]);
    std::string result;
    result.reserve(s.size() * 2);

    for (size_t j = 0; j < s.size(); j++) {
      char c = s[j];
      switch (c) {
      case '&':  result += "\\&";  break;
      case '%':  result += "\\%";  break;
      case '$':  result += "\\$";  break;
      case '#':  result += "\\#";  break;
      case '_':  result += "\\_";  break;
      case '{':  result += "\\{";  break;
      case '}':  result += "\\}";  break;
      case '~':  result += "\\textasciitilde{}"; break;
      case '^':  result += "\\textasciicircum{}"; break;
      case '\\': result += "\\textbackslash{}";  break;
      default:   result += c;      break;
      }
    }
    out[i] = result;
  }
  return out;
}
