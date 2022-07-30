// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using Boxophobic.StyledGUI;
using Boxophobic.Utils;

namespace PolyverseSkiesAsset
{
    public class PolyverseSkiesHub : EditorWindow
    {
        string assetFolder = "Assets/BOXOPHOBIC/Polyverse Skies";

        int assetVersion;
        string bannerVersion;

        Color bannerColor;
        string bannerText;
        string helpURL;
        static PolyverseSkiesHub window;

        [MenuItem("Window/BOXOPHOBIC/Polyverse Skies/Hub", false, 1051)]
        public static void ShowWindow()
        {
            window = GetWindow<PolyverseSkiesHub>(false, "Polyverse Skies", true);
            window.minSize = new Vector2(300, 200);
        }

        void OnEnable()
        {
            bannerColor = new Color(0.55f, 0.7f, 1f);
            bannerText = "Polyverse Skies";
            helpURL = "https://docs.google.com/document/d/1z7A_xKNa2mXhvTRJqyu-ZQsAtbV32tEZQbO1OmPS_-s/edit#heading=h.rp8ji698m9wz";

            //Safer search, there might be many user folders
            string[] searchFolders;

            searchFolders = AssetDatabase.FindAssets("Polyverse Skies");

            for (int i = 0; i < searchFolders.Length; i++)
            {
                if (AssetDatabase.GUIDToAssetPath(searchFolders[i]).EndsWith("Polyverse Skies.pdf"))
                {
                    assetFolder = AssetDatabase.GUIDToAssetPath(searchFolders[i]);
                    assetFolder = assetFolder.Replace("/Polyverse Skies.pdf", "");
                }
            }

            assetVersion = SettingsUtils.LoadSettingsData(assetFolder + "/Core/Editor/Version.asset", -99);
            bannerVersion = assetVersion.ToString();
            bannerVersion = bannerVersion.Insert(1, ".");
            bannerVersion = bannerVersion.Insert(3, ".");

            bannerColor = new Color(0.968f, 0.572f, 0.890f);
            bannerText = "Polyverse Skies " + bannerVersion;
        }

        void OnGUI()
        {
            StyledGUI.DrawWindowBanner(bannerColor, bannerText, helpURL);

            GUILayout.BeginHorizontal();
            GUILayout.Space(20);

            EditorGUILayout.HelpBox("The included shaders are compatible by default with Standard and Universal Render Pipelines!", MessageType.Info, true);

            GUILayout.Space(13);
            GUILayout.EndHorizontal();
        }
    }
}


