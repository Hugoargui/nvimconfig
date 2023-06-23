// Your First C++ Program

#include <cstdio>
#include <cstdlib>
#include <functional>
#include <iostream>
#include <type_traits>

int foo(int input) {
  if (input > 0) {
    return 100;
  } else {
    return 0;
  }
}
int bar(int year, int day, int hour, int minute, std::string name) { return 0; }
int main() {
  for (int i = 0; i < 5; ++i) {
    if (i != 3) {
      int a = foo(i);
      std::cout << " Hello World " << i << std::endl;
    }
  }
  return 0;
}
