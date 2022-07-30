using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Serialization;

public class Campfire : Buildings, IInteractable
{
    public GameObject particle;
    [FormerlySerializedAs("light")] public GameObject lightt;
    private bool isOn;
    private Vector3 lightstartPosition;

    public int damage;
    public float damagerate;

    private List<IDamagable> thingsToDoDamage = new List<IDamagable>();

    private void Start()
    {
        lightstartPosition = lightt.transform.localPosition;
        StartCoroutine(DealDamage());
    }

    IEnumerator DealDamage()
    {
        while(true)
        {
            if(isOn)
            {
                for (int x = 0; x < thingsToDoDamage.Count; x++)
                    thingsToDoDamage[x].TakePhysicDamage(damage);

                
            }

            yield return new WaitForSeconds(damagerate);
        }
    }

    public string GetInteractPrompt()
    {
        return isOn ? "Turn Off" : "Turn On";
    }

    public void OnInteract()
    {
        isOn = !isOn;

        particle.SetActive(isOn);
        lightt.SetActive(isOn);
    }

    private void Update()
    {
        if(isOn)
        {
            float x = Mathf.PerlinNoise(Time.time * 3.0f, 0.0f) / 5.0f;
            float z = Mathf.PerlinNoise(0.0f, Time.time * 3.0f) / 5.0f;

            lightt.transform.localPosition = lightstartPosition + new Vector3(x, 0.0f, z);
        }
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.GetComponent<IDamagable>() != null)
        {
            thingsToDoDamage.Add(collision.gameObject.GetComponent<IDamagable>());
        }
    }

    private void OnCollisionExit(Collision collision)
    {
        if (collision.gameObject.GetComponent<IDamagable>() != null)
        {
            thingsToDoDamage.Remove(collision.gameObject.GetComponent<IDamagable>());
        }
    }
}