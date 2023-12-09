// Your First C++ Program

#include <cstdio>
#include <cstdlib>
#include <ctime>
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

/**
 * @brief Does nothing but has a typo dadadfa
 *
 * This function is stupid and does nothing.
 *
 * @param input The first input.
 * @param dummy Some useless data.
 * @return Nothing useful

 */

int faaaa(int input, int dummy) {
  if (input > 0) {
    return 100;
  } else {
    return 0;
  }
}
uint32_t num = 0xb3;
const bool b = true;

int myBarFunction(int year, int day, int hour, int minute, std::string name) {
  const int unused = 0;
  return 0;
}

int main() {
  for (int i = 0; i < 5; ++i) {
    if (i != 3) {
      int a = foo(i);
      int b = foo(i);
      int c = faaaa(i, 0);
      int d = faaaa(i, 0);
      int f = faaaa(4, 0);
      int x = myBarFunction(0, 0, 0, 0, "Nameee");
      std::cout << " Hello World " << i << std::endl;
    }
  }
  return 0;
}
