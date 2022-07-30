using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;
using UnityEngine.SceneManagement;



public class PlayerNeeds : MonoBehaviour,IDamagable

{
    public Image FadeScreen4;
    
    public Need health;
    public Need hunger;
    public Need thirst;
    public Need sleep;

    public float hungerHealthdecay;
    public float thirstHealthdecay;

    public UnityEvent onTakeDamage;

    public static PlayerNeeds instance;

    //singleton
    void Awake()
    {
        instance = this;
    }


    // Start is called before the first frame update
    void Start()
    {
        
        //oyun başlangıcındaki ilk değerler  (currentValue = startValue)
        health.currentValue = health.startValue;
        hunger.currentValue = hunger.startValue;
        thirst.currentValue = thirst.startValue;
        sleep.currentValue = sleep.startValue;

    }

    // Update is called once per frame
    void Update()
    {
        
        //zamana bağlı olarak barlardaki değişim
        hunger.Subtrack(hunger.decayRate*Time.deltaTime);
        thirst.Subtrack(thirst.decayRate*Time.deltaTime);
        sleep.Subtrack(sleep.regenrate*Time.deltaTime);
        
        //acıkınca can barının azalması
        if (hunger.currentValue == 0.0f)
        {
            health.Subtrack(hungerHealthdecay * Time.deltaTime);
        }
        
        //susayınca can barının azalması
        if (thirst.currentValue == 0.0f)
        {
            health.Subtrack(thirstHealthdecay * Time.deltaTime);
        }
        
        //karakter ölümü
        if (health.currentValue == 0.0f)
        {
            Die();
        }
        
        //ui barların güncellenmesi  GetPercentage ile alınan % lik değer UI kısmında
        //Bar imagelerinin horizontal şekilde değişmesini sağlayacak.
        health.uiBar.fillAmount = health.GetPercentage();
        hunger.uiBar.fillAmount = hunger.GetPercentage();
        thirst.uiBar.fillAmount = thirst.GetPercentage();
        sleep.uiBar.fillAmount = sleep.GetPercentage();

    }

    public void Heal(float amount)
    {
        health.Add(amount);
    }
    public void Eat(float amount)
    {
        hunger.Add(amount);
    }
    public void Drink(float amount)
    {
        thirst.Add(amount);
    }
    public void Sleep(float amount)
    {
        sleep.Subtrack(amount);
    }
    public void TakePhysicDamage(int amount)
    {
        health.Subtrack(amount);
        onTakeDamage?.Invoke();  //? --> eğer onTakeDamage eventi gerçekleşirse
                                 //.invoke metodunu çalıştırır
    }
    
    public void Die()
    {
        FadeScreen4.GetComponent<Animation>().Play("you_died");
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;
        SceneManager.LoadScene("Menu");
        
    }
    
    
    
    
    
}

[System.Serializable]
public class Need
{   
    [HideInInspector]
    public float currentValue;
    public float maxValue;
    public float startValue;
    public float regenrate;
    public float decayRate;
    public Image uiBar;

    // Add ve Subtrack metotları Needs sekmesinin altında yer alan
    // hp,enerji,susuzluk,uyku barlarının max ve min noktalarını belirler.
    public void Add(float amount)
    {
        currentValue = Mathf.Min(currentValue + amount, maxValue);
    }

    public void Subtrack(float amount)
    {
        currentValue = Mathf.Max(currentValue - amount, 0);
    }
    // Barın yüzde kaç olduğunu verir
    public float GetPercentage()
    {
        return currentValue / maxValue;
    }
}

public interface IDamagable
{
    void TakePhysicDamage(int damageAmount);
}