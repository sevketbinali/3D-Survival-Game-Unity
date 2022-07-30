using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using Unity.Mathematics;
using UnityEngine;
using UnityEngine.Serialization;

public class ResourceFruitTree : MonoBehaviour
{
    public ItemDatabase itemToGive;
    public ItemDatabase itemtoGive2;
    public int capacityitem1;
    public int capacityitem2;
    public int quantityPerHit = 1;
    public GameObject hitParticle;

    public void Gather(Vector3 hitpoint, Vector3 hitNormal)
    {
        for (int i = 0; i < quantityPerHit; i++)
        {
            //if capacity become 0 just break the loop and no longer loop through this
            if (capacityitem1 <= 0)
                break;
            //reduce 1 from capacity with every hit
            capacityitem1 -= 1;

            //add resource to inventory
            Inventory.instance.AddItem(itemToGive);
        }
        for (int x = 0; x < quantityPerHit; x++)
        {
            //if capacity become 0 just break the loop and no longer loop through this
            if (capacityitem2 <= 0)
                break;
            //reduce 1 from capacity with every hit
            capacityitem2 -= 1;
            
            //add resource to inventory
            Inventory.instance.AddItem(itemtoGive2);
        }
        //instantiate a particle effect at the position which we hit the tree with correct orientation
        Destroy(Instantiate(hitParticle, hitpoint, quaternion.LookRotation(hitNormal, Vector3.up)),1.0f);
        
        if (capacityitem1 <= 0)
            Destroy(gameObject);
        
    }
    
}