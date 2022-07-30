using UnityEngine;
using System.Collections;

public class LowPolyRocks_FireLightControl : MonoBehaviour {

	private Light fireLight;

	//Range for min/max values of variable
	[Range(0f, 30f)]
	public float minIntensity = 20.5f;
	[Range(0f, 30f)]
	public float maxIntensity = 30.5f;

	float randomValue;

	void Start()
	{
		fireLight = GetComponent<Light> ();
		randomValue = Random.Range(0.0f, 65000f);
	}

	// FireLight Blinking
	void Update()
	{
		float noise = Mathf.PerlinNoise(randomValue, Time.time);
		fireLight.intensity = Mathf.Lerp(minIntensity, maxIntensity, noise);
	}
}
