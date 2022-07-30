// Cristian Pop - https://boxophobic.com/

using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;

namespace PolyverseSkiesAsset
{
    public class PolyverseSkiesCreate
    {
        [MenuItem("GameObject/BOXOPHOBIC/Polyverse Skies/Manager", false, 8)]
        static void CreateManager()
        {
            if (GameObject.Find("Polyverse Skies") != null)
            {
                Debug.Log("[Polyverse Skies] " + "Polyverse Skies is already added to your scene!");
                return;
            }

            GameObject go = new GameObject();
            go.name = "Polyverse Skies";
            go.AddComponent<PolyverseSkies>();

            if (Selection.activeGameObject != null)
            {
                go.transform.parent = Selection.activeGameObject.transform;
            }

            Selection.activeGameObject = go;

            EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        }
    }
}

