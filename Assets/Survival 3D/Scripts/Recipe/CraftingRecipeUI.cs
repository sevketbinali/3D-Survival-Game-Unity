using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class CraftingRecipeUI : MonoBehaviour
{
    public CraftingRecipe recipe;
    public Image backGroundImage;
    public Image icon;
    public TextMeshProUGUI itemname;
    public Image[] resourceCosts;

    public Color canCraftColor;
    public Color cannotCraftColor;
    private bool canCraft;

    void OnEnable()
    {
        UpdateCanCraft();
    }

    public void UpdateCanCraft()
    {
        //as a default we set it true
        canCraft = true;
        
        //check if we have enough resources
        for (int i = 0; i < recipe.cost.Length; i++)
        {
            //check if inventory have enough item
            if(!Inventory.instance.HasItems(recipe.cost[i].item, recipe.cost[i].quantity))
            {
                // we are not allowed to craft and stop the call
                canCraft = false;
                break;
            }
        }
        //set the backgroundcolor to cancraft color otherweise to cannotcraft color
        backGroundImage.color = canCraft ? canCraftColor : cannotCraftColor;
        
        
        
    }

    private void Start()
    {
        //set the icon of crafting item
        icon.sprite = recipe.itemToCraft.icon;
        //set the name of crafting item
        itemname.text = recipe.itemToCraft.displayName;
        
        //set resource cost, icon, quantity we need to craft
        for (int i = 0; i < resourceCosts.Length; i++)
        {
            if (i < recipe.cost.Length)
            {
                //active recipe
                resourceCosts[i].gameObject.SetActive(true);
                //activate icons
                resourceCosts[i].sprite = recipe.cost[i].item.icon;
                //activate quantity text
                resourceCosts[i].transform.GetComponentInChildren<TextMeshProUGUI>().text =
                    recipe.cost[i].quantity.ToString();
            }
            else
            {
                resourceCosts[i].gameObject.SetActive(false);
            }
            
        }
        
    }

    public void OnClickButton()
    {
        if (canCraft)
        {
            CraftingWindow.instance.Craft(recipe);
        }
    }
    
    
}
