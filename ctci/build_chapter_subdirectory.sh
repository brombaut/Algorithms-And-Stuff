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
  
  pyFilePath="$exerciseFldrPath/$exerciseName.py"
  touch $pyFilePath
  read -r -d '' skeletonPythonCode << EOM
def $exerciseName():
    PASS

if __name__== "__main__":
    $exerciseName()
EOM
  echo "$skeletonPythonCode" > $pyFilePath;
  
  readMeFilePath="$exerciseFldrPath/README.md"
  touch $readMeFilePath
  read -r -d '' skeletonReadMe << EOM
# $chptNum.$count - $exerciseName

DESCRIPTION

### EXAMPLE
Input:   
Output:   
EOM
  echo "$skeletonReadMe" > $readMeFilePath;
  
  shift
  ((count+=1))
done