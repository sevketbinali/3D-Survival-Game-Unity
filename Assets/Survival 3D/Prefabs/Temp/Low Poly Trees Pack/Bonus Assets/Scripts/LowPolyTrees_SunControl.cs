using UnityEngine;
using System.Collections;

public class LowPolyTrees_SunControl : MonoBehaviour {

	//Range for min/max values of variable
	[Range(-10f, 10f)]
	public float sunRotationSpeed_x, sunRotationSpeed_y;

	// Sun Movement
	void Update () {
		gameObject.transform.Rotate (sunRotationSpeed_x * Time.deltaTime, sunRotationSpeed_y * Time.deltaTime, 0);
	}
}
