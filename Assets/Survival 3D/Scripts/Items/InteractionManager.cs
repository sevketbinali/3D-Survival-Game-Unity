using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;


public class InteractionManager : MonoBehaviour
{
    public float checkRate = 0.05f;
    private float lastCheckTime;
    public float maxCheckDistance;
    public LayerMask layerMask;

    private GameObject currentInteractGameObject;
    private IInteractable currentInteractable;

    public TextMeshProUGUI prompttext;
    private Camera cam;

    private void Start()
    {
        cam = Camera.main;
    }

    private void Update()
    {   
        //true every "checkrate" seconds
        if (Time.time - lastCheckTime > checkRate)
        {
            lastCheckTime = Time.time;
            
            //create a ray from the center of our screen pointing in the direction we're looking
            Ray ray = cam.ScreenPointToRay(new Vector3(Screen.width / 2,Screen.height / 2,0));
            //store the raycast hit
            RaycastHit hit;
            //did we hit something?
            if (Physics.Raycast(ray, out hit, maxCheckDistance, layerMask))
            {
                //we check if is this not our current interactable? if so, set it as our current interactable
                if (hit.collider.gameObject != currentInteractGameObject)
                {
                    currentInteractGameObject = hit.collider.gameObject;
                    currentInteractable = hit.collider.GetComponent<IInteractable>();
                    SetPromptText();          
                }
                
            }
            // if we didnt hit anything at all
            else
            {
                currentInteractGameObject = null;
                currentInteractable = null;
                //disable prompt tex
                prompttext.gameObject.SetActive(false);
                
            }
            
        }
    }

    //called when we hover over a new interactable
    void SetPromptText()
    {
        prompttext.gameObject.SetActive(true);
        prompttext.text = string.Format("<b>[E]</b> {0}", currentInteractable.GetInteractPrompt());
    }

    public void OnInteractInput(InputAction.CallbackContext context)
    {
        if (context.phase == InputActionPhase.Started && currentInteractable != null)
        {
            currentInteractable.OnInteract();
            currentInteractGameObject = null;
            currentInteractable = null;
            prompttext.gameObject.SetActive(false);
        }
    }
    
}

public interface IInteractable
{
    
    // Farenizi bir öğenin üzerine getirdiğimizde görüntülenen özel bir etkileşim mesajı alan dize işlevi
    string GetInteractPrompt();
    
    // Nesneyle etkileşim kurulduğunda.. ("E")
    void OnInteract();
}