// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using Boxophobic.Constants;

namespace Boxophobic.StyledGUI
{
    public partial class StyledGUI 
    {
        public static void DrawInspectorCategory(string bannerText)
        {
            var categoryFullRect = GUILayoutUtility.GetRect(0, 0, 18, 0);
            var categoryBeginRect = new Rect(categoryFullRect.position.x, categoryFullRect.position.y, 10, 18);
            var categoryMiddleRect = new Rect(categoryFullRect.position.x + 10, categoryFullRect.position.y, categoryFullRect.xMax - 32, 18);
            var categoryEndRect = new Rect(categoryFullRect.xMax - 10, categoryFullRect.position.y, 10, 18);
            var titleRect = new Rect(categoryFullRect.position.x, categoryFullRect.position.y, categoryFullRect.width, 18);

            if (EditorGUIUtility.isProSkin)
            {
                GUI.color = CONSTANT.ColorDarkGray;
            }
            else
            {
                GUI.color = CONSTANT.ColorLightGray;
            }

            GUI.DrawTexture(categoryBeginRect, CONSTANT.CategoryImageBegin, ScaleMode.StretchToFill, true);
            GUI.DrawTexture(categoryMiddleRect, CONSTANT.CategoryImageMiddle, ScaleMode.StretchToFill, true);
            GUI.DrawTexture(categoryEndRect, CONSTANT.CategoryImageEnd, ScaleMode.StretchToFill, true);

            GUI.color = Color.white;
            GUI.Label(titleRect, bannerText, CONSTANT.TitleStyle);
        }

        public static bool DrawInspectorCategory(string bannerText, bool enabled, float top, float down, bool colapsable)
        {
            if (colapsable)
            {
                if (enabled)
                {
                    GUILayout.Space(top);
                }
                else
                {
                    GUILayout.Space(0);
                }
            }
            else
            {
                GUILayout.Space(top);
            }

            var categoryFullRect = GUILayoutUtility.GetRect(0, 0, 18, 0);
            var categoryBeginRect = new Rect(categoryFullRect.position.x, categoryFullRect.position.y, 10, 18);
            var categoryMiddleRect = new Rect(categoryFullRect.position.x + 10, categoryFullRect.position.y, categoryFullRect.xMax - 32, 18);
            var categoryEndRect = new Rect(categoryFullRect.xMax - 10, categoryFullRect.position.y, 10, 18);
            var titleRect = new Rect(categoryFullRect.position.x, categoryFullRect.position.y, categoryFullRect.width, 18);

            if (EditorGUIUtility.isProSkin)
            {
                GUI.color = CONSTANT.ColorDarkGray;
            }
            else
            {
                GUI.color = CONSTANT.ColorLightGray;
            }

            if (colapsable)
            {
                if (GUI.Button(categoryFullRect, "", GUIStyle.none))
                {
                    enabled = !enabled;
                }
            }
            else
            {
                enabled = true;
            }

            GUI.DrawTexture(categoryBeginRect, CONSTANT.CategoryImageBegin, ScaleMode.StretchToFill, true);
            GUI.DrawTexture(categoryMiddleRect, CONSTANT.CategoryImageMiddle, ScaleMode.StretchToFill, true);
            GUI.DrawTexture(categoryEndRect, CONSTANT.CategoryImageEnd, ScaleMode.StretchToFill, true);

            GUI.color = Color.white;
            GUI.Label(titleRect, bannerText, CONSTANT.TitleStyle);

            if (colapsable)
            {
                if (enabled)
                {
                    GUILayout.Space(down);
                }
                else
                {
                    GUILayout.Space(0);
                }
            }
            else
            {
                GUILayout.Space(down);
            }

            return enabled;
        }
    }
}

