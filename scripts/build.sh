#!/bin/sh

project="BM.ExampleGame"

echo ''
echo ''
echo '-------------[BrainModes]----------------- '
echo '| Starting Unity Compilation Phase'
echo '| '
echo '| Unity3d Version Unity-5.3.5f1'
echo '------------------------------------------ '
echo ''
echo ''



echo 'project name is:'
echo $project
echo ''
echo ''



# Build tartget is iOS
echo ''
echo '-------------[BrainModes]----------------- '
echo "Attempting to build for iOS"
echo '------------------------------------------ '
echo ''
echo ' activating Unity license '
echo ''

/Applications/Unity/Unity.app/Contents/MacOS/Unity  \ 
  -quit \
  -batchmode \
  -serial ${UNITY3D_SERIAL} 
  -username ${UNITY3D_USERNAME} 
  -password ${UNITY3D_PASSWORD}

echo 'done'
echo ''
echo 'building project ...'
echo ''
  
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -buildTarget iOS \
  -silent-crashes \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd)/$project \
  -executeMethod CommandLineBuild.iOSBuild
  
  
echo 'Logs from build'
cat $(pwd)/unity.log


echo ''
echo ''
echo '-------------[BrainModes]----------------- '
echo '| Finished Build Phase'
echo '------------------------------------------ '
echo ''
echo ''