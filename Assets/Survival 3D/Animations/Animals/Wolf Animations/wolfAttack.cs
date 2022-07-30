using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class wolfAttack : MonoBehaviour
{

    public AudioSource WolfAttackSound;

    public AudioSource WolfDeathSound;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void AttackSoundWolf()
    {
        WolfAttackSound.Play();
    }

    void DeathSoundWolf()
    {
        WolfAttackSound.Stop();
        WolfDeathSound.Play();
    }
    
    
}


