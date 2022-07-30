using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EquipTool : Equip
{
    public float attackRate;
    public float attackdistance;
    private bool attacking;

    [Header("Combat")] 
    public bool doesDealDamage;
    public int damage;

    [Header("Resource Gathering")]
    public bool doesGatherresources;

    //components
    private Animator anim;
    private Camera cam;

    private void Awake()
    {
        //get components
        anim = GetComponent<Animator>();
        cam = Camera.main;
    }

    public override void OnAttackInput()
    {
        if (!attacking)
        {
            attacking = true;
            anim.SetTrigger("Attack");
            Invoke("OnCanAttack",attackRate);
        }
    }
    void OnCanAttack()
    {
        attacking = false;
    }

    public void OnHit()
    {
        //set the ray to shoot from center of screen
        Ray ray = cam.ScreenPointToRay(new Vector3(Screen.width / 2, Screen.height / 2, 0));
        //store all the actual hit data in
        RaycastHit hit;
        //shoot raycast
        if (Physics.Raycast(ray, out hit, attackdistance))
        {
            // if we hit resource
            if (doesGatherresources && hit.collider.GetComponent<Resources>())
            {
                hit.collider.GetComponent<Resources>().Gather(hit.point, hit.normal);
            }
            // if we hit damagable or enemy 
            if (doesDealDamage && hit.collider.GetComponent<IDamagable>() != null)
            {
                hit.collider.GetComponent<IDamagable>().TakePhysicDamage(damage);
            }
            
        }
    }
    
    
}

