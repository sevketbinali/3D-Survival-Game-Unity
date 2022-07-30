//Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

public class PolyverseSkiesShaderGUI : ShaderGUI
{
    bool multiSelection = false;

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props)
    {
        //base.OnGUI(materialEditor, props);

        var material0 = materialEditor.target as Material;
        var materials = materialEditor.targets;

        if (materials.Length > 1)
            multiSelection = true;

        DrawDynamicInspector(material0, materialEditor, props);
    }

    void DrawDynamicInspector(Material material, MaterialEditor materialEditor, MaterialProperty[] props)
    {
        var customPropsList = new List<MaterialProperty>();

        if (multiSelection)
        {
            for (int i = 0; i < props.Length; i++)
            {
                var prop = props[i];

                if (prop.flags == MaterialProperty.PropFlags.HideInInspector)
                    continue;

                customPropsList.Add(prop);
            }
        }
        else
        {
            for (int i = 0; i < props.Length; i++)
            {
                var prop = props[i];

                if (prop.flags == MaterialProperty.PropFlags.HideInInspector)
                {
                    continue;
                }

                if (material.HasProperty("_BackgroundMode"))
                {
                    if (material.GetInt("_BackgroundMode") == 0 && prop.name == "_BackgroundCubemapSpace")
                        continue;

                    if (material.GetInt("_BackgroundMode") == 0 && prop.name == "_BackgroundCubemap")
                        continue;

                    if (material.GetInt("_BackgroundMode") == 0 && prop.name == "_BackgroundExposure")
                        continue;

                    if (material.GetInt("_BackgroundMode") == 1 && prop.name == "_SkyColor")
                        continue;

                    if (material.GetInt("_BackgroundMode") == 1 && prop.name == "_EquatorColor")
                        continue;

                    if (material.GetInt("_BackgroundMode") == 1 && prop.name == "_GroundColor")
                        continue;

                    if (material.GetInt("_BackgroundMode") == 1 && prop.name == "_EquatorHeight")
                        continue;

                    if (material.GetInt("_BackgroundMode") == 1 && prop.name == "_EquatorSmoothness")
                        continue;
                }

                customPropsList.Add(prop);
            }
        }

        //Draw Custom GUI
        for (int i = 0; i < customPropsList.Count; i++)
        {
            var prop = customPropsList[i];

            materialEditor.ShaderProperty(prop, prop.displayName);
        }

        GUILayout.Space(10);
    }
}
