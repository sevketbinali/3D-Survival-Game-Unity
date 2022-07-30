using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RabbitSound : MonoBehaviour
{

    public AudioSource RabbitSoundCore;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void RabbitDeathSound()
    {
        RabbitSoundCore.Play();
    }
    
}
