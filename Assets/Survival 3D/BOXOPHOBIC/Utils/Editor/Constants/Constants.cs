//  Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;

namespace Boxophobic.Constants
{
    public static class CONSTANT
    {
        public static Texture2D LogoImage
        {
            get
            {
                return Resources.Load("Boxophobic - Logo") as Texture2D;
            }
        }

        public static Texture2D BannerImageBegin
        {
            get
            {
                return Resources.Load("Boxophobic - BannerBegin") as Texture2D;
            }
        }

        public static Texture2D BannerImageMiddle
        {
            get
            {
                return Resources.Load("Boxophobic - BannerMiddle") as Texture2D;
            }
        }

        public static Texture2D BannerImageEnd
        {
            get
            {
                return Resources.Load("Boxophobic - BannerEnd") as Texture2D;
            }
        }

        public static Texture2D CategoryImageBegin
        {
            get
            {
                return Resources.Load("Boxophobic - CategoryBegin") as Texture2D;
            }
        }

        public static Texture2D CategoryImageMiddle
        {
            get
            {
                return Resources.Load("Boxophobic - CategoryMiddle") as Texture2D;
            }
        }

        public static Texture2D CategoryImageEnd
        {
            get
            {
                return Resources.Load("Boxophobic - CategoryEnd") as Texture2D;
            }
        }

        public static Texture2D IconEdit
        {
            get
            {
                return Resources.Load("Boxophobic - IconEdit") as Texture2D;
            }
        }

        public static Texture2D IconHelp
        {
            get
            {
                return Resources.Load("Boxophobic - IconHelp") as Texture2D;
            }
        }

        public static Color ColorDarkGray
        {
            get
            {
                return new Color(0.27f, 0.27f, 0.27f);
            }
        }

        public static Color ColorLightGray
        {
            get
            {
                return new Color(0.83f, 0.83f, 0.83f);
            }
        }

        public static GUIStyle TitleStyle
        {
            get
            {
                GUIStyle guiStyle = new GUIStyle("label")
                {
                    richText = true,
                    alignment = TextAnchor.MiddleCenter
                };

                return guiStyle;
            }
        }
    }
}

