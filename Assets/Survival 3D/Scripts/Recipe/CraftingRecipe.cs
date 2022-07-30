using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "Crafting Recipe",menuName = "New Crafting Recipe")]
public class CraftingRecipe : ScriptableObject

{
    public ItemDatabase itemToCraft;
    public ResourceCost[] cost;

}

[System.Serializable]
public class ResourceCost
{
    public ItemDatabase item;
    public int quantity;
}