#! /usr/bash

# APPNAME="铁塔换电"
# BUNDLE_ID="com.chinatower.towerEle"
# CONFIGURATION="Release"
# PROFILE_NAME="hoc-铁塔换电"
# SING_IDENTITY="iPhone Distribution: China Tower Corporation Co., Ltd. (UF473927C9)"

# PLIST_FILE_PATH=./AutoBuild/Info.plist
# BUILD_DIR_PATH="./dist" #编译目标文件夹
# OPTIONS_PLIST_PATH="$BUILD_DIR_PATH/hoc.plist"

# SCHEME="AutoBuild"
# TARGET="AutoBuild"
# WORK_SPACE="$SCHEME.xcworkspace"
# XCODE_PROJECT="$SCHEME.xcodeproj"
# PBXPROJ_FILE = "./AutoBuild.xcodeproj/project.plist"

# echo "脚本开始执行:" $(date +"%Y-%m-%d %H:%M:%S")

# # echo "~~~~~~~~~~~~选择打包方式(输入序号)~~~~~~~~~~~~~~~"
# # echo "  1 appstore"
# # echo "  2 adhoc"
# # echo "  3 enterprise"

# # read parameter

# # 睡眠2s，为了让操作员在输错时尽快取消操作。避免出错
# # sleep 2

# # if [ $parameter == "1" ]; then
# #     echo "appstore"

# # elif
# #     [ $parameter == "2" ]
# # then
# #     echo "adhoc"
# # elif [ $parameter == "3" ]; then
# #     echo "enterprise"
# # else
# #     echo "选择错误"
# #     exit
# # fi

# if ! command -v git >/dev/null; then
#     echo "存在git命令"
#     exit
# fi

# # 判断是否安装pod命令
# if ! command -v pod >/dev/null 2>&1; then
#     echo "请在内置环境安装pod命令"
#     exit
# fi

# if [ ! -d $BUILD_DIR_PATH ]; then
#     mkdir $BUILD_DIR_PATH
# fi

# # /usr/libexec/PlistBuddy -c "print PROVISIONING_PROFILE_SPECIFIER" "${PBXPROJ_FILE}"

# # 多target无法同时设置多个描述文件
# xcodebuild clean archive \
#     -configuration $CONFIGURATION \
#     -archivePath ./dist/$SCHEME.xcarchive \
#     -workspace $WORK_SPACE \
#     -scheme $SCHEME \
#     PRODUCT_BUNDLE_IDENTIFIER="${BUNDLE_ID}" \
#     CODE_SIGN_IDENTITY="${SING_IDENTITY}" \
#     PROVISIONING_PROFILE="${PROFILE_NAME}" || exit
# # PROVISIONING_PROFILE_SPECIFIER="Automatic"

# xcodebuild -exportArchive -archivePath ./dist/$SCHEME.xcarchive -exportPath ./dist -exportOptionsPlist $OPTIONS_PLIST_PATH || exit

# # 上传蒲公英
# curl -F "_api_key=f2299fc41f187c104c399b04577a6095" -F "file=@./dist/AutoBuild.ipa" https://www.pgyer.com/apiv2/app/upload >./dist/pgyer.text

APP_NAME=$(jq -r '.data.buildName' ./dist/pgyer.text)
buildVersion=$(jq -r '.data.buildVersion' ./dist/pgyer.text)
buildVersionNo=$(jq -r '.data.buildVersionNo' ./dist/pgyer.text)
buildIdentifier=$(jq -r '.data.buildIdentifier' ./dist/pgyer.text)
buildDescription=$(jq -r '.data.buildDescription' ./dist/pgyer.text)
buildQRCodeURL=$(jq -r '.data.buildQRCodeURL' ./dist/pgyer.text)
buildUpdated=$(jq -r '.data.buildUpdated' ./dist/pgyer.text)
buildShortcutUrl=$(jq -r '.data.buildShortcutUrl' ./dist/pgyer.text)
downloadURL="https://www.pgyer.com/$buildShortcutUrl"

echo $APP_NAME

MARKDOWN_CONTENT="## 「${APP_NAME}App」更新成功
> 下载地址：**[立即更新]($downloadURL)**\n
> 版本号：**${buildVersion}**\n
> 编译版本 **${buildVersionNo}**\n
> bundleId:**${buildIdentifier}**\n
> 项目描述：**${buildDescription}**\n
> 更新时间：**${buildUpdated}**\n
> ![二维码地址：](${buildQRCodeURL})"

BODY="{\
    \"msgtype\": \"markdown\",
    \"markdown\": {
        \"content\":\"${MARKDOWN_CONTENT}\"\
    }\
}"
echo "${BODY}"

# curl 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=2f15e5de-6ff9-4d81-b7d7-bc2d9614f722' -H 'Content-Type: application/json' -d "{\
#     \"msgtype\": \"markdown\",
#     \"markdown\": {
#         \"content\":\"${MARKDOWN_CONTENT}\"
#     }
# }"

curl 'https://oapi.dingtalk.com/robot/send?access_token=1c1cb5044b762178cda8d068fac78e50026510339389e20f3ca8105469082014' \
    -H 'Content-Type: application/json' \
    -d "{\
    \"msgtype\": \"markdown\",
    \"markdown\": {
        \"title\": \"「铁塔备电App」更新提示\",
        \"text\": \"@15695913390,@18149540924${MARKDOWN_CONTENT}-\"
     },
     \"at\": {
          \"atMobiles\": [
              \"15695913390\",
              \"18149540924\"
          ],
          \"isAtAll\": false
      }
  }"

# # 定义常用参数
# Podfile="./Podfile"
# scheme="AutoBuild"

# # 判断是否存在podfile文件, 如果存在就执行 pod install
# Podfile="./Podfile"
# if [ -f "$Podfile" ]; then
#     pod install
# fi

# xcodebuild clean # 先把项目缓存清楚一下

# if [ -f "$Podfile" ]; then
#     xcodebuild -scheme $scheme -workspace "$scheme".xcworkspace build
#     if [ ! -d "./dist" ]; then
#         mkdir dist/archive
#     fi

#     xcodebuild archive -workspace "$scheme".xcworkspace -scheme $scheme -configuration Release -archivePath ./dist/archive.xcarchive
#     echo "编译完成"
#     echo "开始打包"
#     xcodebuild -exportArchive -archivePath ./dist/archive.xcarchive -exportPath ./dist -exportOptionsPlist ./AutoBuild/Info.plist
# fi

# exit

# # if []; then

# # fi

# pod init
# pod install
# xcodebuild -scheme AutoBuild -workspace AutoBuild.xcworkspace build
