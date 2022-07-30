using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CraftingWindow : MonoBehaviour
{
    public CraftingRecipeUI[] recipeUIs;
    //singleton
    public static CraftingWindow instance;

    private void Awake()
    {
        instance = this;
    }

    void OnEnable()
    {
        Inventory.instance.onOpenInventory.AddListener(OnOpenInventory);
    }
    void OnDisable()
    {
        Inventory.instance.onOpenInventory.RemoveListener(OnOpenInventory);
    }
    
    
    void OnOpenInventory()
    {
        //disable crafting window
        gameObject.SetActive(false);
    }

    public void Craft(CraftingRecipe recipe)
    {
        //looping through all of the items we need for crafting
        for (int i = 0; i < recipe.cost.Length; i++)
        {
            //loop through quantity for example if we need 3 stone loop 3 times and reduce 3 stone from inventory
            for (int x = 0; x < recipe.cost[i].quantity; x++)
            {
                Inventory.instance.RemoveItem(recipe.cost[i].item);
            }
        }
        
        //add item to recipe
        Inventory.instance.AddItem(recipe.itemToCraft);
        
        // add item to inventory
        for (int i = 0; i < recipeUIs.Length; i++)
        {
            // we are add to crafted item to inventory
            recipeUIs[i].UpdateCanCraft();
        }
        
    }
}
