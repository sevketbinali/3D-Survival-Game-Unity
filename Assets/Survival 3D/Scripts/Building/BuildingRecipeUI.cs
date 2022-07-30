using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
public class BuildingRecipeUI : MonoBehaviour
{
    public BuildingRecipe recipe;
    public Image backGroundImage;
    public Image icon;
    public TextMeshProUGUI buildingName;
    public Image[] resourceCosts;

    public Color canBuildColor;
    public Color cannotBuildColor;
    private bool canBuild;
    
    
    void OnEnable()
    {
        UpdateCanCraft();
    }

    private void Start()
    {
        //set the icon of crafting item
        icon.sprite = recipe.icon;
        //set the name of crafting item
       buildingName.text = recipe.displayName;
        
        //set resource cost, icon, quantity we need to craft
        for (int x = 0; x < resourceCosts.Length; x++)
        {
            if (x < recipe.cost.Length)
            {
                //active recipe
                resourceCosts[x].gameObject.SetActive(true);
                //activate icons
                resourceCosts[x].sprite = recipe.cost[x].item.icon;
                //activate quantity text
                resourceCosts[x].transform.GetComponentInChildren<TextMeshProUGUI>().text =
                    recipe.cost[x].quantity.ToString();
            }
            else
            {
                resourceCosts[x].gameObject.SetActive(false);
            }
            
        }
    }

    void UpdateCanCraft()
    {
        //as a default we set it true
        canBuild = true;
        
        //check if we have enough resources
        for (int x = 0; x < recipe.cost.Length; x++)
        {
            //check if inventory have enough item
            if(!Inventory.instance.HasItems(recipe.cost[x].item, recipe.cost[x].quantity))
            {
                // we are not allowed to craft and stop the call
                canBuild = false;
                break;
            }
        }
        //set the backgroundcolor to canbuild color otherweise to cannotbuild color
        backGroundImage.color = canBuild ? canBuildColor : cannotBuildColor;

    }

    public void OnClickButton()
    {
        if (canBuild)
        {
            EquipBuildingKit.instance.SetNewBuildingRecipe(recipe);
        }

        else
        {
            //if we click on the recipe that we cant craft we will be close it
            
            PlayerController.instance.ToggleCursor(true);
            EquipBuildingKit.instance.gameObject.SetActive(false);
        }
    }
    
    
}
