using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using Unity.Mathematics;
using UnityEngine;

public class Resources : MonoBehaviour
{
    public ItemDatabase itemToGive;
    public int capacity;
    public int quantityPerHit = 1;
    public GameObject hitParticle;

    public void Gather(Vector3 hitpoint, Vector3 hitNormal)
    {
        for (int i = 0; i < quantityPerHit; i++)
        {
            //if capacity become 0 just break the loop and no longer loop through this
            if (capacity <= 0)
                break;
            //reduce 1 from capacity with every hit
            capacity -= 1;
            
            //add resource to inventory
            Inventory.instance.AddItem(itemToGive);
        }
        //instantiate a particle effect at the position which we hit the tree with correct orientation
        Destroy(Instantiate(hitParticle, hitpoint, quaternion.LookRotation(hitNormal, Vector3.up)),1.0f);
        
        if (capacity <= 0)
            Destroy(gameObject);
        
    }
    
}
