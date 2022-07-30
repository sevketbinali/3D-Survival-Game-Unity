using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
public class Menu : MonoBehaviour
{
    
    public RawImage FadeScreenStarting;
    public Canvas FadeScreenCanvas;
    public GameObject instructionimage;
    public void OnNewGameButton()
    {
        FadeScreenCanvas.GetComponent<Canvas>().sortingOrder = 2;
        SceneManager.LoadScene("Game");
        FadeScreenStarting.GetComponent<Animation>().Play("sleep_anim");
        
        
    }

    
    public void OnInstructionButton()
    {
        instructionimage.SetActive(true);
    }

    public void OutInstructionButton()
    {
        instructionimage.SetActive(false);
    }
    
    public void OnQuitButton()
    {
        Application.Quit();
    }
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
