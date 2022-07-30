#if UNITY_EDITOR

using UnityEditor;
using UnityEngine;
using Boxophobic.StyledGUI;
using System.IO;

namespace PolyverseSkiesAsset
{
    public enum CubemapType
    {
        SkyboxCubemap = 10,
        CloudsCubemap = 20,
    }

    public enum CubemapSizes
    {
        _32 = 32,
        _64 = 64,
        _128 = 128,
        _256 = 256,
        _512 = 512,
        _1024 = 1024,
        _2048 = 2048,
    }

    [ExecuteInEditMode]
    public class PolyverseSkiesGenerator : StyledMonoBehaviour
    {
        [StyledBanner(0.968f, 0.572f, 0.890f, "Cubemap Generator", "", "https://docs.google.com/document/d/1z7A_xKNa2mXhvTRJqyu-ZQsAtbV32tEZQbO1OmPS_-s/edit#heading=h.8h46nz99pbdp")]
        public bool styledBanner;

        [StyledMessage("Info", "The cubemap generator will render the scene skybox to a static cubemap that can be used with a simple cubemap skybox shader! The generated cubemap will be saved to the Assets folder.")]
        public bool messageSkybox = false;

        [StyledMessage("Info", "The cubemap generator will render the clouds to a cubemap. Change the child particles to generate new patterns. The generated cubemap will be saved to the Assets folder. Once generated, you will get a realtime preview in the scene.")]
        public bool messageClouds = false;

        [Space(10)]
        public CubemapType cubemapType = CubemapType.CloudsCubemap;
        public CubemapSizes cubemapSize = CubemapSizes._2048;

        [Space(10)]
        [StyledButton("Generate Cubemap")]
        public bool generateCubemap = false;

        [StyledSpace(10)]
        public bool styledSpace0;

        void Start()
        {
            generateCubemap = false;
        }

        void Update()
        {
            if (cubemapType == CubemapType.SkyboxCubemap)
            {
                messageSkybox = true;
                messageClouds = false;
            }
            else
            {
                messageSkybox = false;
                messageClouds = true;
            }

            if (generateCubemap)
            {
                var cam = GetComponent<Camera>();

                var path = "Assets/Generated Skybox Cubemap.png";

                if (cubemapType == CubemapType.CloudsCubemap)
                {
                    path = "Assets/Generated Clouds Cubemap.png";
                }

                Cubemap cubemap = new Cubemap((int)cubemapSize, UnityEngine.Experimental.Rendering.GraphicsFormat.R32G32B32A32_SFloat, 0);

                cam.RenderToCubemap(cubemap);
                cubemap.Apply();

                Texture2D img = new Texture2D((int)cubemapSize * 6, (int)cubemapSize, TextureFormat.RGBAFloat, false);

                for (int i = 0; i < (int)cubemapSize; i++)
                {
                    for (int j = 0; j < (int)cubemapSize; j++)
                    {
                        var pixelColor = cubemap.GetPixel(CubemapFace.PositiveX, i, (int)cubemapSize - j);
                        var pixelValue = 1.0f;

                        if (cubemapType == CubemapType.CloudsCubemap)
                            pixelValue = pixelColor.r + pixelColor.g + pixelColor.b;

                        img.SetPixel(i, j, new Color(pixelColor.r, pixelColor.g, pixelColor.b, pixelValue));
                    }
                }

                for (int i = 0; i < (int)cubemapSize; i++)
                {
                    for (int j = 0; j < (int)cubemapSize; j++)
                    {
                        var pixelColor = cubemap.GetPixel(CubemapFace.NegativeX, i, (int)cubemapSize - j);
                        var pixelValue = 1.0f;

                        if (cubemapType == CubemapType.CloudsCubemap)
                            pixelValue = pixelColor.r + pixelColor.g + pixelColor.b;

                        img.SetPixel(i + (int)cubemapSize, j, new Color(pixelColor.r, pixelColor.g, pixelColor.b, pixelValue));
                    }
                }

                for (int i = 0; i < (int)cubemapSize; i++)
                {
                    for (int j = 0; j < (int)cubemapSize; j++)
                    {
                        var pixelColor = cubemap.GetPixel(CubemapFace.PositiveY, i, (int)cubemapSize - j);
                        var pixelValue = 1.0f;

                        if (cubemapType == CubemapType.CloudsCubemap)
                            pixelValue = pixelColor.r + pixelColor.g + pixelColor.b;

                        img.SetPixel(i + (int)cubemapSize * 2, j, new Color(pixelColor.r, pixelColor.g, pixelColor.b, pixelValue));
                    }
                }

                for (int i = 0; i < (int)cubemapSize; i++)
                {
                    for (int j = 0; j < (int)cubemapSize; j++)
                    {
                        var pixelColor = cubemap.GetPixel(CubemapFace.NegativeY, i, (int)cubemapSize - j);
                        var pixelValue = 1.0f;

                        if (cubemapType == CubemapType.CloudsCubemap)
                            pixelValue = pixelColor.r + pixelColor.g + pixelColor.b;

                        img.SetPixel(i + (int)cubemapSize * 3, j, new Color(pixelColor.r, pixelColor.g, pixelColor.b, pixelValue));
                    }
                }

                for (int i = 0; i < (int)cubemapSize; i++)
                {
                    for (int j = 0; j < (int)cubemapSize; j++)
                    {
                        var pixelColor = cubemap.GetPixel(CubemapFace.PositiveZ, i, (int)cubemapSize - j);
                        var pixelValue = 1.0f;

                        if (cubemapType == CubemapType.CloudsCubemap)
                            pixelValue = pixelColor.r + pixelColor.g + pixelColor.b;

                        img.SetPixel(i + (int)cubemapSize * 4, j, new Color(pixelColor.r, pixelColor.g, pixelColor.b, pixelValue));
                    }
                }

                for (int i = 0; i < (int)cubemapSize; i++)
                {
                    for (int j = 0; j < (int)cubemapSize; j++)
                    {
                        var pixelColor = cubemap.GetPixel(CubemapFace.NegativeZ, i, (int)cubemapSize - j);
                        var pixelValue = 1.0f;

                        if (cubemapType == CubemapType.CloudsCubemap)
                            pixelValue = pixelColor.r + pixelColor.g + pixelColor.b;

                        img.SetPixel(i + (int)cubemapSize * 5, j, new Color(pixelColor.r, pixelColor.g, pixelColor.b, pixelValue));
                    }
                }

                img.Apply();

                byte[] imgBytes = img.EncodeToPNG();
                File.WriteAllBytes(path, imgBytes);

                AssetDatabase.ImportAsset(path, ImportAssetOptions.ForceUpdate);

                TextureImporter texImporter = AssetImporter.GetAtPath(path) as TextureImporter;
                texImporter.textureShape = TextureImporterShape.TextureCube;
                texImporter.textureCompression = TextureImporterCompression.CompressedHQ;
                texImporter.mipmapEnabled = false;
                texImporter.sRGBTexture = false;

                texImporter.SaveAndReimport();

                AssetDatabase.SaveAssets();
                AssetDatabase.Refresh();

                if (cubemapType == CubemapType.CloudsCubemap)
                {
                    RenderSettings.skybox.SetTexture("_CloudsCubemap", AssetDatabase.LoadAssetAtPath<Cubemap>(path));
                }

                Debug.Log("[Polyverse Skies] The Generated Cubemap is saved to the Assets folder!");

                generateCubemap = false;
            }
        }
    }
}

#endif