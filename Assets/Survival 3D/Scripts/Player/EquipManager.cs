using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
public class EquipManager : MonoBehaviour
{
    public Equip currentEquip;
    public Transform equipParent;
    private PlayerController controller;
    
    
    //s
    public static EquipManager instance;

    private void Awake()
    {
        instance = this;
        controller = GetComponent<PlayerController>();
    }

    public void OnAttackInput(InputAction.CallbackContext context)
    {
        if (context.phase == InputActionPhase.Performed && currentEquip != null && controller.canLook == true)
        {
            currentEquip.OnAttackInput();
        }
    }
    
    public void OnAltAttackInput(InputAction.CallbackContext context)
    {
        if (context.phase == InputActionPhase.Performed && currentEquip != null && controller.canLook == true)
        {
            currentEquip.OnAltAttackInput();
        }
    }

    public void EquipNewItem(ItemDatabase item)
    {
        UnEquipItem();
        currentEquip = Instantiate(item.equipPrefab, equipParent).GetComponent<Equip>();
    }

    public void UnEquipItem()
    {
        if (currentEquip != null)
        {
            Destroy(currentEquip.gameObject);
            currentEquip = null;
        }
    }
    
    
}
