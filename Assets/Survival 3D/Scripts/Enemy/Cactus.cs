using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;



public class Cactus : MonoBehaviour
{

    public int damage;
    public float damageRate;

    private List<IDamagable> thingsToDamage = new List<IDamagable>();
    private void Start()
    {
        StartCoroutine(DealDamage());
    }
    //hasar arası gecikme (delay) gibi düşünülebilir.
    IEnumerator DealDamage()
    {
        while(true)
        {
            for (int i = 0; i < thingsToDamage.Count; i++)
            {
                thingsToDamage[i].TakePhysicDamage(damage);
            }
            yield return new WaitForSeconds(damageRate);
        }
    }


    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.GetComponent<IDamagable>() != null)
        {
            thingsToDamage.Add(collision.gameObject.GetComponent<IDamagable>());
        }
    }

    private void OnCollisionExit(Collision collision)
    {
        if (collision.gameObject.GetComponent<IDamagable>() != null)
        {
            thingsToDamage.Remove(collision.gameObject.GetComponent<IDamagable>());
        }
    }
}
