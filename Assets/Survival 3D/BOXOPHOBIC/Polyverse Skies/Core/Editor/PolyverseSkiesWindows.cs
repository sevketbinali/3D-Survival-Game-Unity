using UnityEditor;
using UnityEngine;

namespace PolyverseSkiesAsset
{
    public static class PolyverseSkiesWindows
    {
        [MenuItem("Window/BOXOPHOBIC/Polyverse Skies/Publisher Page", false, 8000)]
        public static void Publisher()
        {
            Application.OpenURL("https://assetstore.unity.com/publishers/20529");
        }

        [MenuItem("Window/BOXOPHOBIC/Polyverse Skies/Discord Server", false, 8001)]
        public static void Discord()
        {
            Application.OpenURL("https://discord.com/invite/znxuXET");
        }

        [MenuItem("Window/BOXOPHOBIC/Polyverse Skies/Documentation", false, 8002)]
        public static void Documentation()
        {
            Application.OpenURL("https://docs.google.com/document/d/1z7A_xKNa2mXhvTRJqyu-ZQsAtbV32tEZQbO1OmPS_-s/edit#heading=h.gqix7il7wlwd");
        }

        [MenuItem("Window/BOXOPHOBIC/Polyverse Skies/Changelog", false, 8003)]
        public static void Chnagelog()
        {
            Application.OpenURL("https://docs.google.com/document/d/1z7A_xKNa2mXhvTRJqyu-ZQsAtbV32tEZQbO1OmPS_-s/edit#heading=h.1rbujejuzjce");
        }

        [MenuItem("Window/BOXOPHOBIC/Polyverse Skies/Write A Review", false, 9999)]
        public static void WriteAReview()
        {
            Application.OpenURL("https://assetstore.unity.com/packages/vfx/shaders/polyverse-skies-low-poly-skybox-shaders-and-textures-104017#reviews");
        }
    }
}


