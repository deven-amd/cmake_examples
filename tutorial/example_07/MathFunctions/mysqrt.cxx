#include <stdlib.h>
#include <math.h>
#include "TutorialConfig.h"

double mysqrt(double num) {
  double result = 0;
// if we have both log and exp then use them
#if defined (HAVE_LOG) && defined (HAVE_EXP)
  result = exp(log(num)*0.5);
#else // otherwise use an iterative approach
  result = sqrt(num) + 1;
#endif
  return result;
}
