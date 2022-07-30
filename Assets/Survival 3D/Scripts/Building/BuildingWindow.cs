using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;


public class BuildingWindow : MonoBehaviour
{
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
}
