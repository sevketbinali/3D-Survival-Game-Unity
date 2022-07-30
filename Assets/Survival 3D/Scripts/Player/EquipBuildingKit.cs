    using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class EquipBuildingKit : Equip
{
    public GameObject buildingWindow;
    private BuildingRecipe curRecipe;
    private buildingPreview currentBuildingPreview;

    public float placementUpdateRate = 0.03f;
    private float lastPlacementUpdateTime;
    public float placementMaxDistance = 5.0f;

    public LayerMask placementLayerMask;

    public Vector3 placementPosition;
    private bool canPlace;
    private float curYRot;

    public float rotateSpeed = 180.0f;

    private Camera cam;
    public static EquipBuildingKit instance;
    

    void Awake ()
    {
        instance = this;
        cam = Camera.main;
    }

    void Start ()
    {
        buildingWindow = FindObjectOfType<BuildingWindow>(true).gameObject;
         
    }

    // called when we press the Left Mouse button
    public override void OnAttackInput()
    {
        if(curRecipe == null || currentBuildingPreview == null || !canPlace)
            return;

        Instantiate(curRecipe.spawnPrefab, currentBuildingPreview.transform.position, currentBuildingPreview.transform.rotation);

        for(int x = 0; x < curRecipe.cost.Length; x++)
        {
            for(int y = 0; y < curRecipe.cost[x].quantity; y++)
            {
                Inventory.instance.RemoveItem(curRecipe.cost[x].item);
            }
        }

        curRecipe = null;
        Destroy(currentBuildingPreview.gameObject);
        currentBuildingPreview = null;
        canPlace = false;
        curYRot = 0;
    }



    // called when we press the Right Mouse button
    public override void OnAltAttackInput()
    {
        if (currentBuildingPreview != null)
            Destroy(currentBuildingPreview.gameObject);

        buildingWindow.SetActive(true);
        PlayerController.instance.ToggleCursor(true);
    }




    // called when we select a recipe from the building window
    public void SetNewBuildingRecipe (BuildingRecipe recipe)
    {
        curRecipe = recipe;
        buildingWindow.SetActive(false);
        PlayerController.instance.ToggleCursor(false);

        currentBuildingPreview = Instantiate(recipe.previewPrefab).GetComponent<buildingPreview>();
    }

    void Update ()
    {
        // do we have a recipe selected?
        if(curRecipe != null && currentBuildingPreview != null && Time.time - lastPlacementUpdateTime > placementUpdateRate)
        {
            lastPlacementUpdateTime = Time.time;

            // shoot a raycast to where we're looking
            Ray ray = cam.ScreenPointToRay(new Vector3(Screen.width / 2, Screen.height / 2, 0));
            RaycastHit hit;

            if(Physics.Raycast(ray, out hit, placementMaxDistance, placementLayerMask))
            {
                currentBuildingPreview.transform.position = hit.point;
                currentBuildingPreview.transform.up = hit.normal;
                currentBuildingPreview.transform.Rotate(new Vector3(0, curYRot, 0), Space.Self);

                if(!currentBuildingPreview.CollidingWithObjects())
                {
                    if(!canPlace)
                        currentBuildingPreview.CanPlace();

                    canPlace = true;
                }
                else
                {
                    if(canPlace)
                        currentBuildingPreview.CannotPlace();

                    canPlace = false;
                }
            }
        }

        if(Keyboard.current.rKey.isPressed)
        {
            curYRot += rotateSpeed * Time.deltaTime;

            if(curYRot > 360.0f)
                curYRot = 0.0f;
        }    
    }

    void OnDestroy ()
    {
        if (currentBuildingPreview != null)
            Destroy(currentBuildingPreview.gameObject);
    }
}