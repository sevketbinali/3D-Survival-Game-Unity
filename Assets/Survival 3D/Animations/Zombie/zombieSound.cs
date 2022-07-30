using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class zombieSound : MonoBehaviour
{
    public AudioSource audioSource;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void ZombieAttack()
    {
        audioSource.Play();
    }
    
}
