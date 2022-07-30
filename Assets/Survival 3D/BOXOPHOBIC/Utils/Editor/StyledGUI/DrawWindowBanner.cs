// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using Boxophobic.Constants;

namespace Boxophobic.StyledGUI
{
    public partial class StyledGUI
    {
        public static void DrawWindowBanner(Color color, string title, string help)
        {
            GUILayout.Space(15);

            var bannerFullRect = GUILayoutUtility.GetRect(0, 0, 36, 0);
            var bannerBeginRect = new Rect(bannerFullRect.position.x + 20, bannerFullRect.position.y, 20, 36);
            var bannerMiddleRect = new Rect(bannerFullRect.position.x + 40, bannerFullRect.position.y, bannerFullRect.xMax - 76, 36);
            var bannerEndRect = new Rect(bannerFullRect.xMax - 36, bannerFullRect.position.y, 20, 36);
            var iconRect = new Rect(bannerFullRect.xMax - 51, bannerFullRect.position.y + 5, 30, 26);

            if (EditorGUIUtility.isProSkin)
            {
                color = new Color(color.r, color.g, color.b, 1f);
            }
            else
            {
                color = CONSTANT.ColorLightGray;
            }

            GUI.color = color;

            GUI.DrawTexture(bannerBeginRect, CONSTANT.BannerImageBegin, ScaleMode.StretchToFill, true);
            GUI.DrawTexture(bannerMiddleRect, CONSTANT.BannerImageMiddle, ScaleMode.StretchToFill, true);
            GUI.DrawTexture(bannerEndRect, CONSTANT.BannerImageEnd, ScaleMode.StretchToFill, true);

            Color guiColor = CONSTANT.ColorDarkGray;

            GUI.Label(bannerFullRect, "<size=16><color=#" + ColorUtility.ToHtmlStringRGB(guiColor) + ">" + title + "</color></size>", CONSTANT.TitleStyle);

            GUI.color = guiColor;

            if (GUI.Button(iconRect, CONSTANT.IconHelp, new GUIStyle { alignment = TextAnchor.MiddleCenter }))
            {
                Application.OpenURL(help);
            }

            GUI.color = Color.white;
            GUILayout.Space(15);
        }

        public static void DrawWindowBanner(Color color, string title)
        {
            GUILayout.Space(15);

            var bannerFullRect = GUILayoutUtility.GetRect(0, 0, 36, 0);
            var bannerBeginRect = new Rect(bannerFullRect.position.x + 20, bannerFullRect.position.y, 20, 36);
            var bannerMiddleRect = new Rect(bannerFullRect.position.x + 40, bannerFullRect.position.y, bannerFullRect.xMax - 76, 36);
            var bannerEndRect = new Rect(bannerFullRect.xMax - 36, bannerFullRect.position.y, 20, 36);

            if (EditorGUIUtility.isProSkin)
            {
                color = new Color(color.r, color.g, color.b, 1f);
            }
            else
            {
                color = CONSTANT.ColorLightGray;
            }

            GUI.color = color;

            GUI.DrawTexture(bannerBeginRect, CONSTANT.BannerImageBegin, ScaleMode.StretchToFill, true);
            GUI.DrawTexture(bannerMiddleRect, CONSTANT.BannerImageMiddle, ScaleMode.StretchToFill, true);
            GUI.DrawTexture(bannerEndRect, CONSTANT.BannerImageEnd, ScaleMode.StretchToFill, true);

            Color guiColor = CONSTANT.ColorDarkGray;

            GUI.Label(bannerFullRect, "<size=16><color=#" + ColorUtility.ToHtmlStringRGB(guiColor) + ">" + title + "</color></size>", CONSTANT.TitleStyle);

            GUI.color = Color.white;

            GUILayout.Space(15);
        }

        public static void DrawWindowBanner(string title)
        {
            GUILayout.Space(15);

            var bannerFullRect = GUILayoutUtility.GetRect(0, 0, 36, 0);
            var bannerBeginRect = new Rect(bannerFullRect.position.x + 20, bannerFullRect.position.y, 20, 36);
            var bannerMiddleRect = new Rect(bannerFullRect.position.x + 40, bannerFullRect.position.y, bannerFullRect.xMax - 76, 36);
            var bannerEndRect = new Rect(bannerFullRect.xMax - 36, bannerFullRect.position.y, 20, 36);

            Color bannerColor;
            Color guiColor;

            if (EditorGUIUtility.isProSkin)
            {
                bannerColor = CONSTANT.ColorDarkGray;
                guiColor = CONSTANT.ColorLightGray;
            }
            else
            {
                bannerColor = CONSTANT.ColorLightGray;
                guiColor = CONSTANT.ColorDarkGray;
            }

            GUI.color = bannerColor;

            GUI.DrawTexture(bannerBeginRect, CONSTANT.BannerImageBegin, ScaleMode.StretchToFill, true);
            GUI.DrawTexture(bannerMiddleRect, CONSTANT.BannerImageMiddle, ScaleMode.StretchToFill, true);
            GUI.DrawTexture(bannerEndRect, CONSTANT.BannerImageEnd, ScaleMode.StretchToFill, true);

            GUI.Label(bannerFullRect, "<size=16><color=#" + ColorUtility.ToHtmlStringRGB(guiColor) + ">" + title + "</color></size>", CONSTANT.TitleStyle);

            GUI.color = Color.white;

            GUILayout.Space(15);
        }

        public static void DrawWindowBanner(string title, string help)
        {
            GUILayout.Space(15);

            var bannerFullRect = GUILayoutUtility.GetRect(0, 0, 36, 0);
            var bannerBeginRect = new Rect(bannerFullRect.position.x + 20, bannerFullRect.position.y, 20, 36);
            var bannerMiddleRect = new Rect(bannerFullRect.position.x + 40, bannerFullRect.position.y, bannerFullRect.xMax - 76, 36);
            var bannerEndRect = new Rect(bannerFullRect.xMax - 36, bannerFullRect.position.y, 20, 36);
            var iconRect = new Rect(bannerFullRect.xMax - 51, bannerFullRect.position.y + 5, 30, 26);

            Color bannerColor;
            Color guiColor;

            if (EditorGUIUtility.isProSkin)
            {
                bannerColor = CONSTANT.ColorDarkGray;
                guiColor = CONSTANT.ColorLightGray;
            }
            else
            {
                bannerColor = CONSTANT.ColorLightGray;
                guiColor = CONSTANT.ColorDarkGray;
            }

            GUI.color = bannerColor;

            GUI.DrawTexture(bannerBeginRect, CONSTANT.BannerImageBegin, ScaleMode.StretchToFill, true);
            GUI.DrawTexture(bannerMiddleRect, CONSTANT.BannerImageMiddle, ScaleMode.StretchToFill, true);
            GUI.DrawTexture(bannerEndRect, CONSTANT.BannerImageEnd, ScaleMode.StretchToFill, true);

            GUI.Label(bannerFullRect, "<size=16><color=#" + ColorUtility.ToHtmlStringRGB(guiColor) + ">" + title + "</color></size>", CONSTANT.TitleStyle);

            GUI.color = guiColor;

            if (GUI.Button(iconRect, CONSTANT.IconHelp, new GUIStyle { alignment = TextAnchor.MiddleCenter }))
            {
                Application.OpenURL(help);
            }

            GUI.color = Color.white;
            GUILayout.Space(15);
        }
    }
}

