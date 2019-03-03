${path}=(Get-Location)
${ovr-platform-util}="C:\FreeSoft\OculusPlatform\ovr-platform-util.exe"
${unityVersion}=(Get-Content .\ProjectSettings\ProjectVersion.txt | ForEach-Object { $_ -replace "m_EditorVersion: ", "" })
${unity-app}="C:\Program Files\Unity\Hub\Editor\${unityVersion}\Editor\Unity.exe"

$env:PRODUCT_NAME = "gopublishtest"
$env:PRODUCT_VERSION= 0.1
$env:PRODUCT_VERSION_CODE = 2
$env:KEYSTORE_NAME = "KeyStore/user.keystore"
$env:KEYSTORE_ALIAS = "gopublishtest"
$env:KEYSTORE_PASSWORD = "d9hYRoPzV1AyPlwZ"
$env:OUT_APK_NAME = "${env:PRODUCT_NAME}_v${env:PRODUCT_VERSION}_vc${env:PRODUCT_VERSION_CODE}.apk"
$env:OCULUS_APP_ID = "2394084417268750"
$env:OCULUS_APP_SECRET = "ae67332a2bcdf2aea652793f0db6bb27"
$env:OCULUS_APP_CHANNEL = "alpha"

Start-Process `
    -FilePath:${unity-app} `
    -ArgumentList:"-quit -batchmode -executeMethod Builder.BuildApk -projectPath $path -logFile build.log" `
    -Wait

Start-Process `
    -FilePath:${ovr-platform-util} `
    -ArgumentList:"upload-mobile-build --app_id ${env:OCULUS_APP_ID} --app_secret ${env:OCULUS_APP_SECRET} --apk Build/${env:OUT_APK_NAME} --channel ${env:OCULUS_APP_CHANNEL}"
    -Wait
