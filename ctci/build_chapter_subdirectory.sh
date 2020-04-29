#!/bin/bash

# Usage: build_chapter_subdirectory chptNumber exercise_1_name exercise_2_name ... exercise_n_name
if [ "$1" == "" ]; then
  echo "**Wrong number of arguments**";
  echo "Usage: ./build_chapter_subdirectory chptNumber exercise_1_name exercise_2_name ... exercise_n_name";
  exit 1;
fi

chptNum=$1
shift
chptFldr="ch$chptNum"
mkdir $chptFldr

count=1
# Loop until all parameters are used up
while [ "$1" != "" ]; do
  exerciseName=$1
  exerciseFldrPath="$chptFldr/ex"$count"_$exerciseName"
  mkdir $exerciseFldrPath

  IFS='_' read -ra ADDR <<< "$exerciseName"
  exerciseNameUpperCamel=""
  for i in "${ADDR[@]}"; do
      exerciseNameUpperCamel=${exerciseNameUpperCamel}${i^}
  done
  
  pyFilePath="$exerciseFldrPath/$exerciseName.py"
  touch $pyFilePath
  read -r -d '' skeletonPythonCode << EOM
import unittest

def $exerciseName():
    PASS


class Test$exerciseNameUpperCamel(unittest.TestCase):

    def test_fail(self):
        self.assertTrue(1 == 0)


if __name__== "__main__":
    unittest.main(verbosity=2)
EOM
  echo "$skeletonPythonCode" > $pyFilePath;
  
  readMeFilePath="$exerciseFldrPath/README.md"
  touch $readMeFilePath
  read -r -d '' skeletonReadMe << EOM
# $chptNum.$count - $exerciseNameUpperCamel

DESCRIPTION

### EXAMPLE
Input:   
Output:   
EOM
  echo "$skeletonReadMe" > $readMeFilePath;
  
  shift
  ((count+=1))
done