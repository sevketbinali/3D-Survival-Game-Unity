using UnityEngine;
using System.Collections;

public class LowPolyTrees_CameraControl : MonoBehaviour {

	//Range for min/max values of variable
	[Range(-100f, 100f)]
	public float cameraMoveSpeed_x, cameraMoveSpeed_y, cameraMoveSpeed_z;

	// Camera Movement
	void Update () {
		gameObject.transform.Translate (cameraMoveSpeed_x * Time.deltaTime, cameraMoveSpeed_y * Time.deltaTime, cameraMoveSpeed_z * Time.deltaTime);
	}
}
