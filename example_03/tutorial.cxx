// A simple program that computes the square root of a number
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "TutorialConfig.h"
#include "MathFunctions.h"

int main (int argc, char *argv[])
{
  fprintf(stdout,"%s Version %d.%d\n",
	  argv[0],
	  Tutorial_VERSION_MAJOR,
	  Tutorial_VERSION_MINOR);
  if (argc < 2)
    {
    fprintf(stdout,"Usage: %s number\n",argv[0]);
    return 1;
    }
  double inputValue = atof(argv[1]);
  double outputValue = mysqrt(inputValue);
  fprintf(stdout,"The square root of %g is %g\n",
          inputValue, outputValue);
  return 0;
}