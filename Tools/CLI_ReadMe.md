# upload-mobile-build
- Mobileプラットフォーム（GoとGearVR）用のapkのアップロードコマンド

## 構文
```
ovr-platform-util upload-mobile-build --app_id <ID> --app_secret <Token> --apk <path/to/Your.apk> --obb <path/to/Your.obb> --assets-dir <path/to/DLCs/dir> --channel <ReleaseChannel> --notes <ReleaseNotes>
```

## パラメーター

|パラメータ|説明|Example|
|---|---|---|
|-app_id <ID> | Oculusダッシュボードから取得できるアプリID | 2394084417268750 |
|--app_secret <Token>| Oculusダッシュボードから取得できるアプリシークレットToken| ae67332a2bcdf2aea652793f0db6bb27|
|--apk <FilePath>| アップロードするAPKファイルへのPath | path/to/upload.apk |
|--assets-dir <DirPath> | オプション：ビルドに対するDLCアセットディレクトリ | path/to/asset/dir |
| --asset-file-iap-configs-file <FilePath> | オプション：有料DLCのためのIAP（InAppParchse）のコンフィグファイル| path/to/configfile |
|-obb <FilePath>| オプション：拡張ファイル（OBB）| path/to/upload.obb |
|--channel <ReleaseChannel>|今回のビルドを配布するチャンネル。大文字小文字判別しない | alpha, beta, rc, store|
|--notes <Text>|リリースノート文字列。 | hogehoge |


# download-mobile-build
- Mobileプラットフォーム（GoとGearVR）用のapkのダウンロードコマンド

## 構文
```
ovr-platform-util download-mobile-build -b <BuildID> -d <Directory>
```

## パラメーター

|パラメータ|説明|Example|
|---|---|---|
|--build_id <BuildID>|ビルドIDは、アップロードが成功した際にコンソールに出力される。現状Oculusダッシュボードからは参照できない||
|--output_dir <Directory>|ダウンロードファイルの保存先ディレクトリ| "path/to/donwload" |

- 注意事項
    - buildIDはアプリIDではなく、CLIよりアップロードした際にコンソールに出力されるID


# set-release-channel-build
- 

## 構文
```
ovr-platform-util set-release-channel-build --app_id <AppID> --app_secret <Secret> --source_channel <Channel> --destination_channel <Channel>
```
