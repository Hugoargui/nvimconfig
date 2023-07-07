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
 * @brief Does nothing
 *
 * This function is stupid and does nothing.
 *
 * @param input THe first input.
 * @param dummy SOme useless data.
 * @return Nothing useful
 */
int faa(int input, int dummy) {
  if (input > 0) {
    return 100;
  } else {
    return 0;
  }
}

int bar(int year, int day, int hour, int minute, std::string name) {
  const int unused = 0;
  return 0;
}

int main() {
  for (int i = 0; i < 5; ++i) {
    if (i != 3) {
      int a = foo(i);
      int b = foo(i);
      int c = faa(i, 0);
      int d = faa(i, 0);
      std::cout << " Hello World " << i << std::endl;
    }
  }
  return 0;
}
