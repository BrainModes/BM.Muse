#!/bin/sh

project="BM.ExampleGame"

echo ''
echo ''
echo '#-------------------------=== BrainModes Berlin ===-----------------------------#'
echo '                                 `..``::++/-  `                                 '
echo '                          `:/+/:+o++o+oyooydyhhys--`                            '
echo '                     `./osooso+ooossoosyo++oosymdhyhh+-`                        '
echo '                   `:syoshsssssssoosyssssysoosssoshmhyhy+`                      '
echo '                 .+sso++ssssoo+/::oho/oyo//+syysomdsoooyhy-`                    '
echo '                -soyoosyo++so///+:/+:/ys/:+ho////yo+++oyyyso.                   '
echo '               .ssho/oyh//os//+ss:/s/+////oh//yo:/ohsyo+shhys`                  '
echo '               syooy//oh+::ss+/:os/shooosshy/+hs:ods:oh+oyoyy:                  '
echo '               oydyyysooys//yo++ohyyssho+odo:yhs/ss:/yo+s+oyhy                  '
echo '               -sdshhsyhhhhssoyhsooo/:+y+so/yy++yo/+yo+y+/oyyh                  '
echo '                `//ooosyhhhhdhyy+syo/:+ds/:yydys//oyo+yo/+ooyh                  '
echo '                   ``.-:/+sydhsssosydhyhhs+y+oys+/+/+hh/:+ysyy                  '
echo '                          ::ohooshdhyo+/+ooshsosdyyshyss//yysy                  '
echo '                          `.-syyyhso+osoyyysoooyo+o+o++y++shy+                  '
echo '                             `:osyyyhhhyhhsssyyysssyhyysoyhdy`                  '
echo '                                `./oosyo+hdhhysyhdhyhysyhhds.                   '
echo '                                     .ossshdhysssyhdmmoyhy/                     '
echo '                                       .ssodddyyo+ohhm+ ``                      '
echo '                                        /sso.sddhyyydy.                         '
echo '                                        /ss-  ``.-::.                           '
echo '                                        oss.                                    '
echo '                                        .::                                     '
echo '#-------------------------=== \_______________/ ===-----------------------------#'
echo ''
echo ''


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
  -serial ${UNITY3D_SERIAL} \
  -username ${UNITY3D_USERNAME} \
  -password ${UNITY3D_PASSWORD} \
  -logFile $(pwd)/unity-activation.log
  
echo 'Logs from build'
cat $(pwd)/unity-activation.log

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