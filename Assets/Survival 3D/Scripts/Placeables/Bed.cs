using System;
using System.Collections;
using System.Collections.Generic;
using PolyverseSkiesAsset;
using Unity.Mathematics;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UI;

public class Bed : Buildings, IInteractable
{

    public float wakupTime;
    public float startSleepTime;
    public float endSleepTime;
    public float sleepToGive;
    public RawImage FadeScreen2;

    public string GetInteractPrompt()
    {
        return CanSleep() ? "Sleep" : "It's too early to sleep";
    }
    
    private void Start()
    {
        FadeScreen2 = FindObjectOfType<RawImage>(true);
    }

   

    public void OnInteract()    
    {
        if (CanSleep())
        {
            FadeScreen2.GetComponent<Animation>().Play("sleep_anim");

            PolyverseSkies.instance.gameObject.SetActive(false);
            
            PolyverseSkies.instance.gameObject.SetActive(true);
            
            
            DayNight.instance.time = wakupTime;
            PolyverseSkies.instance.timeOfDay = 0.0f;
           
            PlayerNeeds.instance.Sleep(sleepToGive);
            
        }
    }
    

    bool CanSleep()
    {
        return DayNight.instance.time >= startSleepTime || DayNight.instance.time < endSleepTime;
        
    }
    
}
    