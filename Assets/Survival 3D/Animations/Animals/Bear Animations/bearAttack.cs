using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class bearAttack : MonoBehaviour
{
    public AudioSource bearAttackSound;
    public AudioSource bearDeathSound;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void AttackSoundBear()
    {
        bearAttackSound.Play();
    }

    void DeathSoundBear()
    {
        bearAttackSound.Stop();
        bearDeathSound.Play();
    }
}
