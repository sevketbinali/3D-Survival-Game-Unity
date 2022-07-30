using UnityEngine;
using System.Collections;

public class LowPolyRocks_CameraControl : MonoBehaviour {

	//Range for min/max values of variable
	[Range(-10f, 10f)]
	public float cameraMoveSpeed_x, cameraMoveSpeed_y, cameraMoveSpeed_z;

	// Camera Movement
	void Update () {
		gameObject.transform.Translate (cameraMoveSpeed_x * Time.deltaTime, cameraMoveSpeed_y * Time.deltaTime, cameraMoveSpeed_z * Time.deltaTime);
	}
}
