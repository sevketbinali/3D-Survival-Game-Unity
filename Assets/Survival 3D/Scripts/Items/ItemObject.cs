using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemObject : MonoBehaviour, IInteractable
{
    public ItemDatabase item;

    public string GetInteractPrompt()
    {
        return string.Format("Pick Up {0}", item.displayName);
    }

    public void OnInteract()
    {
        //after interact add item to inventory
        Inventory.instance.AddItem(item);
        //destroy item in the world because we picked them up
        Destroy(gameObject);
    }
}
