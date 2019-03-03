using System;
using System.Linq;
using UnityEditor;
using UnityEditor.Build.Reporting;
using UnityEngine;

public class Builder
{
    [MenuItem("Tools/Debug/Refresh")]
    static void Refresh()
    {
        AssetDatabase.Refresh();
    }
    
    [MenuItem("Tools/Build/BuildApk")]
    static void BuildApk()
    {        
        PlayerSettings.Android.keystoreName = GetEnv("KEYSTORE_NAME");
        PlayerSettings.Android.keystorePass = GetEnv("KEYSTORE_PASSWORD");
        PlayerSettings.Android.keyaliasName = GetEnv("KEYSTORE_ALIAS");
        PlayerSettings.Android.keyaliasPass = GetEnv("KEYSTORE_PASSWORD");

        PlayerSettings.productName = GetEnv("PRODUCT_NAME");
        PlayerSettings.bundleVersion = GetEnv("PRODUCT_VERSION");
        PlayerSettings.Android.bundleVersionCode = int.Parse(GetEnv("PRODUCT_VERSION_CODE"));
        
        var enableScenes = EditorBuildSettings.scenes.Where(x => x.enabled).Select(x => x.path).ToArray();
        var outputPath = $"Build/{GetEnv("OUT_APK_NAME")}";

        var buildResult = BuildPipeline.BuildPlayer(
                enableScenes,
                outputPath,
                BuildTarget.Android,
                BuildOptions.None
            );

        if (buildResult.summary.result != BuildResult.Succeeded)
        {
            Debug.LogError($"[Error] build is failure. error count is {buildResult.summary.totalErrors}");
        }
    }

    static string GetEnv(string envName)
    {
        return Environment.GetEnvironmentVariable(envName);
    }
    
}
