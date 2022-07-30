// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/Polyverse Skies/Standard"
{
	Properties
	{
		[StyledBanner(Polyverse Skies Standard)]_Banner("< Banner >", Float) = 1
		[StyledCategory(Background, 5, 10)]_BackgroundCat("[ Background Cat ]", Float) = 1
		[KeywordEnum(Colors,Cubemap,Combined)] _BackgroundMode("Background Mode", Float) = 0
		[Space(10)]_SkyColor("Sky Color", Color) = (0.4980392,0.7450981,1,1)
		_EquatorColor("Equator Color", Color) = (1,0.747,0,1)
		_GroundColor("Ground Color", Color) = (0.4980392,0.497,0,1)
		_EquatorHeight("Equator Height", Range( 0 , 1)) = 0.5
		_EquatorSmoothness("Equator Smoothness", Range( 0.01 , 1)) = 0.5
		[NoScaleOffset][Space(10)][StyledTextureSingleLine]_BackgroundCubemap("Background Cubemap", CUBE) = "black" {}
		[Space(10)]_BackgroundExposure("Background Exposure", Range( 0 , 8)) = 1
		[StyledCategory(Pattern)]_PatternCat("[ Pattern Cat ]", Float) = 1
		[Toggle(_ENABLEPATTERNOVERLAY_ON)] _EnablePatternOverlay("Enable Pattern Overlay", Float) = 0
		[NoScaleOffset][Space(10)][StyledTextureSingleLine]_PatternCubemap("Pattern Cubemap", CUBE) = "black" {}
		[Space(10)]_PatternContrast("Pattern Contrast", Range( 0 , 2)) = 0.5
		[StyledCategory(Stars)]_StarsCat("[ Stars Cat ]", Float) = 1
		[Toggle(_ENABLESTARS_ON)] _EnableStars("Enable Stars", Float) = 0
		[NoScaleOffset][Space(10)][StyledTextureSingleLine]_StarsCubemap("Stars Cubemap", CUBE) = "white" {}
		[Space(10)]_StarsIntensity("Stars Intensity", Range( 0 , 5)) = 2
		[IntRange]_StarsLayer("Stars Layers", Range( 1 , 3)) = 2
		_StarsSize("Stars Size", Range( 0 , 0.99)) = 0.5
		_StarsSunMask("Stars Sun Mask", Range( 0 , 1)) = 0
		_StarsHeightMask("Stars Height Mask", Range( 0 , 1)) = 0
		[StyledToggle]_StarsBottomMask("Stars Bottom Mask", Float) = 0
		[Space(10)][Toggle(_ENABLESTARSTWINKLING_ON)] _EnableStarsTwinkling("Enable Stars Twinkling", Float) = 0
		[NoScaleOffset][Space(10)][StyledTextureSingleLine]_TwinklingTexture("Twinkling Texture", 2D) = "white" {}
		[Space(10)]_TwinklingContrast("Twinkling Contrast", Range( 0 , 2)) = 1
		_TwinklingSpeed("Twinkling Speed", Float) = 0.05
		[Space(10)][Toggle(_ENABLESTARSROTATION_ON)] _EnableStarsRotation("Enable Stars Rotation", Float) = 0
		[IntRange][Space(10)]_StarsRotation("Stars Rotation", Range( 0 , 360)) = 360
		_StarsRotationSpeed("Stars Rotation Speed", Float) = 0.5
		_StarsRotationAxis("Stars Rotation Axis", Vector) = (0,1,0,0)
		[StyledCategory(Sun)]_SunCat("[ Sun Cat ]", Float) = 1
		[Toggle(_ENABLESUN_ON)] _EnableSun("Enable Sun", Float) = 0
		[NoScaleOffset][Space(10)][StyledTextureSingleLine]_SunTexture("Sun Texture", 2D) = "black" {}
		[Space(10)]_SunColor("Sun Color", Color) = (1,1,1,1)
		_SunSize("Sun Size", Range( 0.1 , 1)) = 0.5
		_SunIntensity("Sun Intensity", Range( 1 , 10)) = 1
		[StyledCategory(Moon)]_MoonCat("[ Moon Cat ]", Float) = 1
		[Toggle(_ENABLEMOON_ON)] _EnableMoon("Enable Moon", Float) = 0
		[NoScaleOffset][Space(10)][StyledTextureSingleLine]_MoonTexture("Moon Texture", 2D) = "black" {}
		[Space(10)]_MoonColor("Moon Color", Color) = (1,1,1,1)
		_MoonSize("Moon Size", Range( 0.1 , 1)) = 0.5
		_MoonIntensity("Moon Intensity", Range( 1 , 10)) = 1
		[StyledCategory(Clouds)]_CloudsCat("[ Clouds Cat ]", Float) = 1
		[Toggle(_ENABLECLOUDS_ON)] _EnableClouds("Enable Clouds", Float) = 0
		[NoScaleOffset][Space(10)][StyledTextureSingleLine]_CloudsCubemap("Clouds Cubemap", CUBE) = "black" {}
		[Space(10)]_CloudsIntensity("Clouds Intensity", Range( 0 , 1)) = 1
		_CloudsHeight("Clouds Height", Range( -0.5 , 0.5)) = 0
		_CloudsLightColor("Clouds Light Color", Color) = (1,1,1,1)
		_CloudsShadowColor("Clouds Shadow Color", Color) = (0.4980392,0.7450981,1,1)
		[Space(10)][Toggle(_CLOUDSLITBYSUN_ON)] _CloudsLitbySun("Clouds Lit by Sun", Float) = 0
		[Space(10)][Toggle(_ENABLECLOUDSROTATION_ON)] _EnableCloudsRotation("Enable Clouds Rotation", Float) = 0
		[IntRange]_CloudsRotation("Clouds Rotation", Range( 0 , 360)) = 360
		_CloudsRotationSpeed("Clouds Rotation Speed", Float) = 0.5
		[StyledCategory(Fog)]_FogCat("[ Fog Cat ]", Float) = 1
		[Toggle(_ENABLEBUILTINFOG_ON)] _EnableBuiltinFog("Enable Fog", Float) = 0
		[StyledMessage(Info, The fog color is controlled by the fog color set in the Lighting panel., _EnableBuiltinFog, 1, 10, 0)]_EnableFogMessage("EnableFogMessage", Float) = 0
		[Space(10)]_FogHeight("Fog Height", Range( 0 , 1)) = 0
		_FogSmoothness("Fog Smoothness", Range( 0.01 , 1)) = 0
		_FogFill("Fog Fill", Range( 0 , 1)) = 0
		[StyledCategory(Skybox Settings)]_SkyboxCat("[ Skybox Cat ]", Float) = 1
		_SkyboxOffset("Skybox Offset", Range( -1 , 1)) = 0
		_SkyboxRotation("Skybox Rotation", Range( 0 , 1)) = 0
		[ASEEnd]_SkyboxRotationAxis("Skybox Rotation Axis", Vector) = (0,1,0,0)

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Background" "Queue"="Background" "PreviewType"="Skybox" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend Off
		AlphaToMask Off
		Cull Off
		ColorMask RGBA
		ZWrite Off
		ZTest LEqual
		
		
		
		Pass
		{
			Name "Unlit"

			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _ENABLEBUILTINFOG_ON
			#pragma shader_feature_local _ENABLECLOUDS_ON
			#pragma shader_feature_local _ENABLEMOON_ON
			#pragma shader_feature_local _ENABLESUN_ON
			#pragma shader_feature_local _ENABLESTARS_ON
			#pragma shader_feature_local _ENABLEPATTERNOVERLAY_ON
			#pragma shader_feature_local _BACKGROUNDMODE_COLORS _BACKGROUNDMODE_CUBEMAP _BACKGROUNDMODE_COMBINED
			#pragma shader_feature_local _ENABLESTARSROTATION_ON
			#pragma shader_feature_local _ENABLESTARSTWINKLING_ON
			#pragma shader_feature_local _CLOUDSLITBYSUN_ON
			#pragma shader_feature_local _ENABLECLOUDSROTATION_ON


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform float _EnableFogMessage;
			uniform half _BackgroundCat;
			uniform half _PatternCat;
			uniform half _MoonCat;
			uniform half _StarsCat;
			uniform half _SkyboxCat;
			uniform half _FogCat;
			uniform half _CloudsCat;
			uniform half _SunCat;
			uniform half _Banner;
			uniform half4 _EquatorColor;
			uniform half4 _GroundColor;
			uniform half4 _SkyColor;
			uniform float3 _SkyboxRotationAxis;
			uniform float _SkyboxRotation;
			uniform float _SkyboxOffset;
			uniform half _EquatorHeight;
			uniform half _EquatorSmoothness;
			uniform samplerCUBE _BackgroundCubemap;
			uniform half _BackgroundExposure;
			uniform half _PatternContrast;
			uniform samplerCUBE _PatternCubemap;
			uniform half3 GlobalSunDirection;
			uniform half _StarsSunMask;
			uniform samplerCUBE _StarsCubemap;
			uniform float3 _StarsRotationAxis;
			uniform half _StarsRotation;
			uniform half _StarsRotationSpeed;
			uniform half _StarsLayer;
			uniform half _StarsSize;
			uniform sampler2D _TwinklingTexture;
			uniform half _TwinklingSpeed;
			uniform half _TwinklingContrast;
			uniform half _StarsHeightMask;
			uniform half _StarsIntensity;
			uniform half _StarsBottomMask;
			uniform sampler2D _SunTexture;
			uniform half _SunSize;
			uniform half4 _SunColor;
			uniform half _SunIntensity;
			uniform sampler2D _MoonTexture;
			uniform half3 GlobalMoonDirection;
			uniform half _MoonSize;
			uniform half4 _MoonColor;
			uniform half _MoonIntensity;
			uniform half4 _CloudsShadowColor;
			uniform half4 _CloudsLightColor;
			uniform samplerCUBE _CloudsCubemap;
			uniform half _CloudsRotation;
			uniform half _CloudsRotationSpeed;
			uniform half _CloudsHeight;
			uniform half _CloudsIntensity;
			uniform half _FogHeight;
			uniform half _FogSmoothness;
			uniform half _FogFill;
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 appendResult1264 = (float3(0.0 , -_SkyboxOffset , 0.0));
				float3 rotatedValue1236 = RotateAroundAxis( appendResult1264, ( v.vertex.xyz + appendResult1264 ), normalize( _SkyboxRotationAxis ), ( _SkyboxRotation * ( 2.0 * UNITY_PI ) ) );
				float3 normalizeResult1267 = normalize( rotatedValue1236 );
				float3 vertexToFrag1237 = normalizeResult1267;
				o.ase_texcoord1.xyz = vertexToFrag1237;
				half3 GlobalSunDirection1005 = GlobalSunDirection;
				float3 ase_worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float dotResult732 = dot( GlobalSunDirection1005 , ase_worldViewDir );
				#ifdef _ENABLESTARS_ON
				float staticSwitch947 = saturate( (0.0 + (dotResult732 - -1.0) * (1.0 - 0.0) / (-( 1.0 - _StarsSunMask ) - -1.0)) );
				#else
				float staticSwitch947 = 0.0;
				#endif
				float vertexToFrag762 = staticSwitch947;
				o.ase_texcoord1.w = vertexToFrag762;
				half3 VertexPos1239 = vertexToFrag1237;
				float3 break1245 = VertexPos1239;
				float lerpResult268 = lerp( 1.0 , ( unity_OrthoParams.y / unity_OrthoParams.x ) , unity_OrthoParams.w);
				half CAMERA_MODE300 = lerpResult268;
				float temp_output_1215_0 = ( break1245.y * CAMERA_MODE300 );
				float3 appendResult1217 = (float3(break1245.x , temp_output_1215_0 , break1245.z));
				float3 normalizeResult1229 = normalize( _StarsRotationAxis );
				float3 rotatedValue1227 = RotateAroundAxis( float3( 0,0,0 ), appendResult1217, normalizeResult1229, -radians( ( _StarsRotation + ( _Time.y * _StarsRotationSpeed ) ) ) );
				#ifdef _ENABLESTARSROTATION_ON
				float3 staticSwitch1221 = rotatedValue1227;
				#else
				float3 staticSwitch1221 = appendResult1217;
				#endif
				float3 vertexToFrag1220 = staticSwitch1221;
				o.ase_texcoord3.xyz = vertexToFrag1220;
				float2 temp_cast_0 = (_TwinklingSpeed).xx;
				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 appendResult568 = (float2(ase_screenPosNorm.x , ase_screenPosNorm.y));
				float2 panner569 = ( _Time.y * temp_cast_0 + appendResult568);
				#ifdef _ENABLESTARS_ON
				float2 staticSwitch956 = panner569;
				#else
				float2 staticSwitch956 = float2( 0,0 );
				#endif
				float2 vertexToFrag761 = staticSwitch956;
				o.ase_texcoord4.xy = vertexToFrag761;
				#ifdef _ENABLESTARS_ON
				float staticSwitch953 = saturate( (0.1 + (abs( v.vertex.xyz.y ) - 0.0) * (1.0 - 0.1) / (_StarsHeightMask - 0.0)) );
				#else
				float staticSwitch953 = 0.0;
				#endif
				float vertexToFrag856 = staticSwitch953;
				o.ase_texcoord3.w = vertexToFrag856;
				float3 temp_output_962_0 = cross( GlobalSunDirection , half3(0,1,0) );
				float3 normalizeResult967 = normalize( temp_output_962_0 );
				float dotResult968 = dot( normalizeResult967 , v.vertex.xyz );
				float3 normalizeResult965 = normalize( cross( GlobalSunDirection1005 , temp_output_962_0 ) );
				float dotResult969 = dot( normalizeResult965 , v.vertex.xyz );
				float2 appendResult970 = (float2(dotResult968 , dotResult969));
				float2 break972 = appendResult970;
				float2 appendResult980 = (float2(break972.x , ( break972.y * CAMERA_MODE300 )));
				float2 temp_cast_1 = (-1.0).xx;
				float2 temp_cast_2 = (1.0).xx;
				float2 temp_cast_3 = (0.0).xx;
				float2 temp_cast_4 = (1.0).xx;
				#ifdef _ENABLESUN_ON
				float2 staticSwitch940 = (temp_cast_3 + (( appendResult980 * (20.0 + (_SunSize - 0.1) * (2.0 - 20.0) / (1.0 - 0.1)) ) - temp_cast_1) * (temp_cast_4 - temp_cast_3) / (temp_cast_2 - temp_cast_1));
				#else
				float2 staticSwitch940 = float2( 0,0 );
				#endif
				float2 vertexToFrag993 = staticSwitch940;
				o.ase_texcoord4.zw = vertexToFrag993;
				float dotResult988 = dot( GlobalSunDirection1005 , v.vertex.xyz );
				#ifdef _ENABLESUN_ON
				float staticSwitch1027 = saturate( dotResult988 );
				#else
				float staticSwitch1027 = 0.0;
				#endif
				float vertexToFrag997 = staticSwitch1027;
				o.ase_texcoord5.x = vertexToFrag997;
				float3 temp_output_1058_0 = cross( GlobalMoonDirection , half3(0,1,0) );
				float3 normalizeResult1039 = normalize( temp_output_1058_0 );
				float dotResult1036 = dot( normalizeResult1039 , v.vertex.xyz );
				half3 GlobalMoonDirection1073 = GlobalMoonDirection;
				float3 normalizeResult1064 = normalize( cross( GlobalMoonDirection1073 , temp_output_1058_0 ) );
				float dotResult1067 = dot( normalizeResult1064 , v.vertex.xyz );
				float2 appendResult1066 = (float2(dotResult1036 , dotResult1067));
				float2 break1063 = appendResult1066;
				float2 appendResult1069 = (float2(break1063.x , ( break1063.y * CAMERA_MODE300 )));
				float2 temp_cast_5 = (-1.0).xx;
				float2 temp_cast_6 = (1.0).xx;
				float2 temp_cast_7 = (0.0).xx;
				float2 temp_cast_8 = (1.0).xx;
				#ifdef _ENABLEMOON_ON
				float2 staticSwitch1057 = (temp_cast_7 + (( appendResult1069 * (20.0 + (_MoonSize - 0.1) * (2.0 - 20.0) / (1.0 - 0.1)) ) - temp_cast_5) * (temp_cast_8 - temp_cast_7) / (temp_cast_6 - temp_cast_5));
				#else
				float2 staticSwitch1057 = float2( 0,0 );
				#endif
				float2 vertexToFrag1043 = staticSwitch1057;
				o.ase_texcoord5.yz = vertexToFrag1043;
				float dotResult1054 = dot( GlobalMoonDirection1073 , v.vertex.xyz );
				#ifdef _ENABLEMOON_ON
				float staticSwitch1052 = saturate( dotResult1054 );
				#else
				float staticSwitch1052 = 0.0;
				#endif
				float vertexToFrag1051 = staticSwitch1052;
				o.ase_texcoord5.w = vertexToFrag1051;
				float3 break1247 = VertexPos1239;
				float3 appendResult1129 = (float3(break1247.x , ( break1247.y * CAMERA_MODE300 ) , break1247.z));
				float3 vertexToFrag1222 = appendResult1129;
				o.ase_texcoord6.xyz = vertexToFrag1222;
				half3 VertexPos40_g3 = appendResult1129;
				float3 appendResult74_g3 = (float3(0.0 , VertexPos40_g3.y , 0.0));
				float3 VertexPosRotationAxis50_g3 = appendResult74_g3;
				float3 break84_g3 = VertexPos40_g3;
				float3 appendResult81_g3 = (float3(break84_g3.x , 0.0 , break84_g3.z));
				float3 VertexPosOtherAxis82_g3 = appendResult81_g3;
				half Angle44_g3 = -radians( ( _CloudsRotation + ( _Time.y * _CloudsRotationSpeed ) ) );
				float3 vertexToFrag1207 = ( VertexPosRotationAxis50_g3 + ( VertexPosOtherAxis82_g3 * cos( Angle44_g3 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g3 ) * sin( Angle44_g3 ) ) );
				o.ase_texcoord7.xyz = vertexToFrag1207;
				
				o.ase_texcoord2 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float3 vertexToFrag1237 = i.ase_texcoord1.xyz;
				half3 VertexPos1239 = vertexToFrag1237;
				float4 lerpResult180 = lerp( _GroundColor , _SkyColor , step( 0.0 , VertexPos1239.y ));
				float4 lerpResult288 = lerp( _EquatorColor , lerpResult180 , pow( saturate( (0.0 + (abs( VertexPos1239.y ) - 0.0) * (1.0 - 0.0) / (_EquatorHeight - 0.0)) ) , ( 1.0 - _EquatorSmoothness ) ));
				half4 SKY218 = lerpResult288;
				half4 BACKGROUND1195 = ( texCUBE( _BackgroundCubemap, i.ase_texcoord2.xyz ) * _BackgroundExposure );
				#if defined(_BACKGROUNDMODE_COLORS)
				float4 staticSwitch1200 = SKY218;
				#elif defined(_BACKGROUNDMODE_CUBEMAP)
				float4 staticSwitch1200 = BACKGROUND1195;
				#elif defined(_BACKGROUNDMODE_COMBINED)
				float4 staticSwitch1200 = ( SKY218 * BACKGROUND1195 );
				#else
				float4 staticSwitch1200 = SKY218;
				#endif
				half4 PATTERN513 = saturate( CalculateContrast(_PatternContrast,texCUBE( _PatternCubemap, VertexPos1239 )) );
				float4 blendOpSrc574 = PATTERN513;
				float4 blendOpDest574 = staticSwitch1200;
				#ifdef _ENABLEPATTERNOVERLAY_ON
				float4 staticSwitch524 = ( saturate( (( blendOpDest574 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest574 ) * ( 1.0 - blendOpSrc574 ) ) : ( 2.0 * blendOpDest574 * blendOpSrc574 ) ) ));
				#else
				float4 staticSwitch524 = staticSwitch1200;
				#endif
				float vertexToFrag762 = i.ase_texcoord1.w;
				float3 vertexToFrag1220 = i.ase_texcoord3.xyz;
				float4 texCUBENode564 = texCUBE( _StarsCubemap, vertexToFrag1220 );
				float temp_output_537_0 = (3.0 + (_StarsLayer - 1.0) * (1.0 - 3.0) / (3.0 - 1.0));
				float2 vertexToFrag761 = i.ase_texcoord4.xy;
				float saferPower554 = max( tex2D( _TwinklingTexture, vertexToFrag761 ).r , 0.0001 );
				#ifdef _ENABLESTARSTWINKLING_ON
				float staticSwitch878 = saturate( pow( saferPower554 , _TwinklingContrast ) );
				#else
				float staticSwitch878 = 1.0;
				#endif
				float vertexToFrag856 = i.ase_texcoord3.w;
				float3 break1245 = VertexPos1239;
				float lerpResult268 = lerp( 1.0 , ( unity_OrthoParams.y / unity_OrthoParams.x ) , unity_OrthoParams.w);
				half CAMERA_MODE300 = lerpResult268;
				float temp_output_1215_0 = ( break1245.y * CAMERA_MODE300 );
				half Starts_Bottom_Mask1250 = step( 0.0 , temp_output_1215_0 );
				float lerpResult1255 = lerp( 1.0 , saturate( Starts_Bottom_Mask1250 ) , _StarsBottomMask);
				half STARS630 = ( floor( ( vertexToFrag762 * ( ( texCUBENode564.r + ( texCUBENode564.g * step( temp_output_537_0 , 2.0 ) ) + ( texCUBENode564.b * step( temp_output_537_0 , 1.0 ) ) ) + ( _StarsSize * staticSwitch878 ) ) * vertexToFrag856 ) ) * _StarsIntensity * lerpResult1255 );
				#ifdef _ENABLESTARS_ON
				float4 staticSwitch918 = ( staticSwitch524 + STARS630 );
				#else
				float4 staticSwitch918 = staticSwitch524;
				#endif
				float2 vertexToFrag993 = i.ase_texcoord4.zw;
				float4 tex2DNode995 = tex2D( _SunTexture, vertexToFrag993 );
				half4 SUN1004 = ( tex2DNode995.r * _SunColor * _SunIntensity );
				float vertexToFrag997 = i.ase_texcoord5.x;
				half SUN_MASK1003 = ( tex2DNode995.a * vertexToFrag997 );
				float4 lerpResult176 = lerp( staticSwitch918 , SUN1004 , SUN_MASK1003);
				#ifdef _ENABLESUN_ON
				float4 staticSwitch919 = lerpResult176;
				#else
				float4 staticSwitch919 = staticSwitch918;
				#endif
				float2 vertexToFrag1043 = i.ase_texcoord5.yz;
				float4 tex2DNode1049 = tex2D( _MoonTexture, vertexToFrag1043 );
				half4 MOON1077 = ( tex2DNode1049.r * _MoonColor * _MoonIntensity );
				float vertexToFrag1051 = i.ase_texcoord5.w;
				half MOON_MASK1078 = ( tex2DNode1049.a * vertexToFrag1051 );
				float4 lerpResult1114 = lerp( staticSwitch919 , MOON1077 , MOON_MASK1078);
				#ifdef _ENABLEMOON_ON
				float4 staticSwitch1113 = lerpResult1114;
				#else
				float4 staticSwitch1113 = staticSwitch919;
				#endif
				float3 vertexToFrag1222 = i.ase_texcoord6.xyz;
				float3 vertexToFrag1207 = i.ase_texcoord7.xyz;
				#ifdef _ENABLECLOUDSROTATION_ON
				float3 staticSwitch1164 = vertexToFrag1207;
				#else
				float3 staticSwitch1164 = vertexToFrag1222;
				#endif
				float3 break245 = staticSwitch1164;
				float3 appendResult246 = (float3(break245.x , ( break245.y + ( _CloudsHeight * -1.0 ) ) , break245.z));
				float4 texCUBENode41 = texCUBE( _CloudsCubemap, appendResult246 );
				half Clouds_G397 = texCUBENode41.g;
				half3 GlobalSunDirection1005 = GlobalSunDirection;
				float3 normalizeResult1163 = normalize( GlobalSunDirection1005 );
				float3 temp_cast_0 = (0.0).xxx;
				float3 temp_cast_1 = (1.0).xxx;
				float3 temp_cast_2 = (-1.0).xxx;
				float3 temp_cast_3 = (1.0).xxx;
				float dotResult89 = dot( normalizeResult1163 , (temp_cast_2 + ((texCUBENode41).rgb - temp_cast_0) * (temp_cast_3 - temp_cast_2) / (temp_cast_1 - temp_cast_0)) );
				#ifdef _CLOUDSLITBYSUN_ON
				float staticSwitch391 = saturate( (0.0 + (dotResult89 - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) );
				#else
				float staticSwitch391 = Clouds_G397;
				#endif
				float4 lerpResult101 = lerp( _CloudsShadowColor , _CloudsLightColor , staticSwitch391);
				half4 CLOUDS222 = lerpResult101;
				half CLOUDS_MASK223 = ( texCUBENode41.a * _CloudsIntensity );
				float4 lerpResult227 = lerp( staticSwitch1113 , CLOUDS222 , CLOUDS_MASK223);
				#ifdef _ENABLECLOUDS_ON
				float4 staticSwitch1120 = lerpResult227;
				#else
				float4 staticSwitch1120 = staticSwitch1113;
				#endif
				float lerpResult678 = lerp( saturate( pow( (0.0 + (abs( VertexPos1239.y ) - 0.0) * (1.0 - 0.0) / (_FogHeight - 0.0)) , ( 1.0 - _FogSmoothness ) ) ) , 0.0 , _FogFill);
				half FOG_MASK359 = lerpResult678;
				float4 lerpResult317 = lerp( unity_FogColor , staticSwitch1120 , FOG_MASK359);
				#ifdef _ENABLEBUILTINFOG_ON
				float4 staticSwitch921 = lerpResult317;
				#else
				float4 staticSwitch921 = staticSwitch1120;
				#endif
				
				
				finalColor = staticSwitch921;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "PolyverseSkiesShaderGUI"
	
	Fallback "False"
}
/*ASEBEGIN
Version=18908
1920;5;1920;1024;3487.337;4302.175;5.510436;True;False
Node;AmplifyShaderEditor.RangedFloatNode;1265;-896,-5168;Inherit;False;Property;_SkyboxOffset;Skybox Offset;61;0;Create;True;0;0;0;False;0;False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;1269;-608,-5168;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;1234;-896,-5312;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1264;-448,-5248;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PiNode;1232;-896,-5424;Inherit;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1233;-896,-5488;Inherit;False;Property;_SkyboxRotation;Skybox Rotation;62;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;1238;-896,-5632;Inherit;False;Property;_SkyboxRotationAxis;Skybox Rotation Axis;63;0;Create;True;0;0;0;False;0;False;0,1,0;1,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1235;-608,-5488;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1262;-256,-5312;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotateAboutAxisNode;1236;0,-5632;Inherit;False;True;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1267;320,-5632;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OrthoParams;267;-896,-6016;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexToFragmentNode;1237;512,-5632;Inherit;False;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;309;-592,-6016;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1007;-448,-6016;Half;False;Constant;_Float7;Float 7;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1208;-896,-1376;Half;False;Property;_StarsRotationSpeed;Stars Rotation Speed;29;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1209;-896,-1440;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1239;768,-5632;Half;False;VertexPos;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;268;-256,-6016;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;300;0,-6016;Half;False;CAMERA_MODE;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;260;-896,2336;Half;False;Property;_CloudsRotationSpeed;Clouds Rotation Speed;53;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1210;-640,-1440;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;567;-896,-896;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1244;-896,-1792;Inherit;False;1239;VertexPos;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1211;-896,-1536;Half;False;Property;_StarsRotation;Stars Rotation;28;1;[IntRange];Create;True;0;0;0;False;1;Space(10);False;360;360;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;701;-896,2272;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-640,-784;Half;False;Property;_TwinklingSpeed;Twinkling Speed;26;0;Create;True;0;0;0;False;0;False;0.05;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;568;-640,-896;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;48;-896,2176;Half;False;Property;_CloudsRotation;Clouds Rotation;52;1;[IntRange];Create;True;0;0;0;False;0;False;360;360;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;961;-896,32;Half;False;Constant;_Vector2;Vector 2;9;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;938;-896,-128;Half;False;Global;GlobalSunDirection;GlobalSunDirection;38;0;Create;True;0;0;0;False;0;False;0,0,0;-0.856954,0.2770823,0.4345752;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BreakToComponentsNode;1245;-736,-1792;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;255;-640,2272;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1213;-512,-1536;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1246;-896,1920;Inherit;False;1239;VertexPos;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleTimeNode;633;-640,-704;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1212;-896,-1648;Inherit;False;300;CAMERA_MODE;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;276;-512,2176;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1241;-896,-3712;Inherit;False;1239;VertexPos;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;1228;-552.3823,-1335.455;Inherit;False;Property;_StarsRotationAxis;Stars Rotation Axis;30;0;Create;True;0;0;0;False;0;False;0,1,0;1,1,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CrossProductOpNode;962;-576,0;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1215;-640,-1664;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1216;-384,-1536;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1247;-736,1920;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;1127;-896,2064;Inherit;False;300;CAMERA_MODE;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;569;-336,-896;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1005;-640,-128;Half;False;GlobalSunDirection;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;956;0,-896;Float;False;Property;_ENABLESTARS_ON;Enable Stars;15;0;Create;False;0;0;0;False;0;False;0;0;0;False;;Toggle;2;Key0;Key1;Reference;918;False;True;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1128;-640,2048;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CrossProductOpNode;964;-384,-128;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;1218;-256,-1536;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;1062;-896,1056;Half;False;Constant;_Vector3;Vector 3;9;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;1061;-896,896;Half;False;Global;GlobalMoonDirection;GlobalMoonDirection;38;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RadiansOpNode;47;-384,2176;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1217;-512,-1792;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1242;-720,-3712;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.NormalizeNode;1229;-325.3823,-1314.455;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;1205;-256,2176;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1129;-512,1920;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1009;-384,-3376;Half;False;Constant;_Float9;Float 9;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1073;-640,896;Half;False;GlobalMoonDirection;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CrossProductOpNode;1058;-576,1024;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;967;-384,0;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.AbsOpNode;287;-192,-3680;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotateAboutAxisNode;1227;-101.3823,-1419.455;Inherit;False;False;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;965;-192,-128;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;1173;-384,256;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;733;2688,-1472;Half;False;Property;_StarsSunMask;Stars Sun Mask;20;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1008;-384,-3456;Half;False;Constant;_Float8;Float 8;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;212;-384,-3264;Half;False;Property;_EquatorHeight;Equator Height;6;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexToFragmentNode;761;256,-880;Inherit;False;False;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TFHCRemapNode;210;0,-3328;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1010;1024,-1456;Half;False;Constant;_Float10;Float 10;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;555;512,-704;Half;False;Property;_TwinklingContrast;Twinkling Contrast;25;0;Create;True;0;0;0;False;1;Space(10);False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;738;3008,-1472;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CrossProductOpNode;1038;-384,896;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1221;256,-1792;Float;False;Property;_EnableStarsRotation;Enable Stars Rotation;27;0;Create;True;0;0;0;False;1;Space(10);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1148;2432,-1792;Inherit;False;1005;GlobalSunDirection;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;731;2432,-1648;Float;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;1011;1024,-1376;Half;False;Constant;_Float11;Float 11;47;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;566;512,-896;Inherit;True;Property;_TwinklingTexture;Twinkling Texture;24;1;[NoScaleOffset];Create;True;0;0;0;False;2;Space(10);StyledTextureSingleLine;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DotProductOpNode;968;0,0;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;528;1024,-1536;Half;False;Property;_StarsLayer;Stars Layers;18;1;[IntRange];Create;False;0;0;0;False;0;False;2;2;1;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;471;-384,-3136;Half;False;Property;_EquatorSmoothness;Equator Smoothness;7;0;Create;True;0;0;0;False;0;False;0.5;0.5;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1203;-128,1920;Inherit;False;Compute Rotation Y;-1;;3;848a7021c0b62984d9ca063f51e19d69;0;2;38;FLOAT3;0,0,0;False;43;FLOAT;0;False;1;FLOAT3;19
Node;AmplifyShaderEditor.DotProductOpNode;969;0,-128;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;1172;2432,-1152;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;1270;-512,-3200;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1013;1408,-1264;Half;False;Constant;_Float13;Float 13;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1167;3056,-1056;Half;False;Constant;_Float0;Float 0;47;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;970;160,-128;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1014;3008,-1712;Half;False;Constant;_Float14;Float 14;47;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;732;2768,-1792;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1016;3008,-1552;Half;False;Constant;_Float16;Float 16;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1039;-384,1024;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;831;3024,-960;Half;False;Property;_StarsHeightMask;Stars Height Mask;21;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1018;2816,-960;Half;False;Constant;_Float18;Float 18;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;554;832,-896;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1017;2816,-1040;Half;False;Constant;_Float17;Float 17;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexToFragmentNode;1222;128,2112;Inherit;False;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1012;1408,-1344;Half;False;Constant;_Float12;Float 12;47;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;828;3072,-1152;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;475;-64,-3136;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexToFragmentNode;1207;128,1920;Inherit;False;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;1175;-384,1280;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1015;3008,-1632;Half;False;Constant;_Float15;Float 15;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;740;3200,-1472;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexToFragmentNode;1220;576,-1792;Inherit;False;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;537;1408,-1536;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;3;False;3;FLOAT;3;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1064;-192,896;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;208;256,-3328;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1164;384,2112;Float;False;Property;_EnableCloudsRotation;Enable Clouds Rotation;51;0;Create;True;0;0;0;False;1;Space(10);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;832;3328,-1152;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;972;320,-128;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.TFHCRemapNode;726;3328,-1792;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;-0.5;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;194;640,-3536;Half;False;Property;_GroundColor;Ground Color;5;0;Create;True;0;0;0;False;0;False;0.4980392,0.497,0,1;0.4980389,0.497,0,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1224;1024,-768;Half;False;Constant;_Float1;Float 1;57;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;533;1664,-1536;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;241;768,2256;Half;False;Property;_CloudsHeight;Clouds Height;47;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;303;896,-3216;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;756;1024,-896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;182;640,-3360;Half;False;Property;_SkyColor;Sky Color;3;0;Create;True;0;0;0;False;1;Space(10);False;0.4980392,0.7450981,1,1;0.4980389,0.7450981,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;564;1408,-1792;Inherit;True;Property;_StarsCubemap;Stars Cubemap;16;1;[NoScaleOffset];Create;True;0;0;0;False;2;Space(10);StyledTextureSingleLine;False;-1;None;4136c4d5d7422cf49a21b885d09f4518;True;0;False;white;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;971;320,0;Inherit;False;300;CAMERA_MODE;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;1190;-896,-4864;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1090;768,2352;Half;False;Constant;_Float31;Float 31;53;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;534;1664,-1408;Inherit;False;2;0;FLOAT;3;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;470;384,-3136;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;1067;0,896;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;1036;0,1024;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1020;352,240;Half;False;Constant;_Float20;Float 20;47;0;Create;True;0;0;0;False;0;False;20;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;973;352,80;Half;False;Constant;_Float4;Float 4;36;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1019;352,160;Half;False;Constant;_Float19;Float 19;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;878;1408,-896;Float;False;Property;_EnableStarsTwinkling;Enable Stars Twinkling;23;0;Create;True;0;0;0;False;1;Space(10);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;417;1152,-3136;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;245;768,2096;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;530;1856,-1536;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;975;0,128;Half;False;Property;_SunSize;Sun Size;35;0;Create;True;0;0;0;False;0;False;0.5;0.5;0.1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;529;1856,-1664;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1066;160,896;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StepOpNode;1271;-480,-1664;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;724;3504,-1792;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;278;1088,2336;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1196;-640,-4672;Half;False;Property;_BackgroundExposure;Background Exposure;9;0;Create;True;0;0;0;False;1;Space(10);False;1;1;0;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;181;640,-3712;Half;False;Property;_EquatorColor;Equator Color;4;0;Create;True;0;0;0;False;1;;False;1,0.747,0,1;1,0.747,0,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1243;-896,-2560;Inherit;False;1239;VertexPos;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;619;1408,-1152;Half;False;Property;_StarsSize;Stars Size;19;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0.99;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;976;640,-32;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;180;1024,-3520;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1021;352,320;Half;False;Constant;_Float21;Float 21;47;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;822;3520,-1152;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1191;-640,-4864;Inherit;True;Property;_BackgroundCubemap;Background Cubemap;8;1;[NoScaleOffset];Create;True;0;0;0;False;2;Space(10);StyledTextureSingleLine;False;-1;None;None;True;0;False;black;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;288;1280,-3712;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1197;-256,-4864;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1250;-256,-1664;Half;False;Starts_Bottom_Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;254;-640,-2560;Inherit;True;Property;_PatternCubemap;Pattern Cubemap;12;1;[NoScaleOffset];Create;True;0;0;0;False;2;Space(10);StyledTextureSingleLine;False;-1;None;None;True;0;False;black;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;947;3712,-1744;Float;False;Property;_ENABLESTARS_ON;Enable Stars;15;0;Create;False;0;0;0;False;0;False;0;0;0;False;;Toggle;2;Key0;Key1;Reference;918;False;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;953;3712,-1104;Float;False;Property;_ENABLESTARS_ON;Enable Stars;15;0;Create;False;0;0;0;False;0;False;0;0;0;False;;Toggle;2;Key0;Key1;Reference;918;False;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;527;2048,-1792;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;980;832,-128;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;244;1232,2240;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1223;1791.023,-1013.223;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;283;-640,-2368;Half;False;Property;_PatternContrast;Pattern Contrast;13;0;Create;True;0;0;0;False;1;Space(10);False;0.5;0.5;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;981;640,128;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0.1;False;2;FLOAT;1;False;3;FLOAT;20;False;4;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1065;320,1024;Inherit;False;300;CAMERA_MODE;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1063;320,896;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.VertexToFragmentNode;762;3968,-1728;Inherit;False;False;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1028;2816,256;Inherit;False;1005;GlobalSunDirection;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;218;1536,-3712;Half;False;SKY;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1023;1024,80;Half;False;Constant;_Float6;Float 6;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexToFragmentNode;856;3968,-1088;Inherit;False;False;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1046;0,1152;Half;False;Property;_MoonSize;Moon Size;41;0;Create;True;0;0;0;False;0;False;0.5;0.5;0.1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;985;1024,-128;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;246;1408,2096;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;519;-256,-2560;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PosVertexDataNode;1174;2816,384;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1022;1024,0;Half;False;Constant;_Float5;Float 5;47;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1253;4480,-1024;Inherit;False;1250;Starts_Bottom_Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1071;352,1104;Half;False;Constant;_Float30;Float 30;36;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1040;352,1344;Half;False;Constant;_Float3;Float 3;47;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1024;1024,160;Half;False;Constant;_Float22;Float 22;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1070;352,1264;Half;False;Constant;_Float29;Float 29;47;0;Create;True;0;0;0;False;0;False;20;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1072;640,992;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1047;352,1184;Half;False;Constant;_Float28;Float 28;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1195;256,-4864;Half;False;BACKGROUND;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;626;2176,-1392;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;876;4480,-1408;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;989;1280,-128;Inherit;False;5;0;FLOAT2;0,0;False;1;FLOAT2;-1,0;False;2;FLOAT2;1,0;False;3;FLOAT2;0,0;False;4;FLOAT2;1,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;220;-896,-6656;Inherit;False;218;SKY;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1199;-896,-6528;Inherit;False;1195;BACKGROUND;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1251;4480,-960;Half;False;Property;_StarsBottomMask;Stars Bottom Mask;22;0;Create;True;0;0;0;False;1;StyledToggle;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;41;1600,2096;Inherit;True;Property;_CloudsCubemap;Clouds Cubemap;45;1;[NoScaleOffset];Create;True;0;0;0;False;2;Space(10);StyledTextureSingleLine;False;-1;None;5bf545dec997743419de1df4195b3a0d;True;0;False;black;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1069;832,896;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;517;-64,-2560;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1259;4720,-1024;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1068;640,1152;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0.1;False;2;FLOAT;1;False;3;FLOAT;20;False;4;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;988;3072,256;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1042;1024,1024;Half;False;Constant;_Float24;Float 24;47;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1075;1024,896;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;513;256,-2560;Half;False;PATTERN;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;126;2304,2096;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1041;1024,1104;Half;False;Constant;_Float23;Float 23;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1094;2304,2192;Half;False;Constant;_Float32;Float 32;54;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;940;1504.37,-122.7181;Float;False;Property;_ENABLESUN_ON;Enable Sun;32;0;Create;False;0;0;0;False;0;False;0;0;0;False;;Toggle;2;Key0;Key1;Reference;919;False;True;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1201;-672,-6528;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1147;2304,1920;Inherit;False;1005;GlobalSunDirection;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1056;2816,1280;Inherit;False;1073;GlobalMoonDirection;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1044;1024,1184;Half;False;Constant;_Float25;Float 25;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1255;4864,-1024;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1095;2304,2272;Half;False;Constant;_Float33;Float 33;54;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1096;2304,2352;Half;False;Constant;_Float34;Float 34;54;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;629;4480,-1216;Half;False;Property;_StarsIntensity;Stars Intensity;17;0;Create;True;0;0;0;False;1;Space(10);False;2;2.71;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;1176;2816,1408;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FloorOpNode;886;4736,-1408;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;994;3232,256;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1200;-512,-6656;Float;False;Property;_BackgroundMode;Background Mode;2;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Colors;Cubemap;Combined;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;1054;3072,1280;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;116;2624,2128;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;-1,-1,-1;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1027;3424,299;Float;False;Property;_ENABLESUN_ON;Enable Sun;32;0;Create;False;0;0;0;False;0;False;0;0;0;False;;Toggle;2;Key0;Key1;Reference;919;False;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1163;3136,1904;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;882;4928,-1408;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexToFragmentNode;993;1808,-64;Inherit;False;False;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;516;-384,-6912;Inherit;False;513;PATTERN;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;1074;1280,896;Inherit;False;5;0;FLOAT2;0,0;False;1;FLOAT2;-1,0;False;2;FLOAT2;1,0;False;3;FLOAT2;0,0;False;4;FLOAT2;1,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;995;2176,-128;Inherit;True;Property;_SunTexture;Sun Texture;33;1;[NoScaleOffset];Create;True;0;0;0;False;2;Space(10);StyledTextureSingleLine;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;998;2176,128;Half;False;Property;_SunColor;Sun Color;34;0;Create;True;0;0;0;False;1;Space(10);False;1,1,1,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexToFragmentNode;997;3664,320;Inherit;False;False;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1098;3424,2048;Half;False;Constant;_Float36;Float 36;54;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;574;-192,-6912;Inherit;False;Overlay;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;996;2176,320;Half;False;Property;_SunIntensity;Sun Intensity;36;0;Create;True;0;0;0;False;0;False;1;1;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1099;3424,2128;Half;False;Constant;_Float37;Float 37;54;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1097;3424,1968;Half;False;Constant;_Float35;Float 35;54;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;630;5184,-1408;Half;False;STARS;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;89;3296,1904;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1055;3232,1280;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1057;1504,897;Float;False;Property;_ENABLEMOON_ON;Enable Moon;38;0;Create;False;0;0;0;False;0;False;0;0;0;False;;Toggle;2;Key0;Key1;Reference;1113;False;True;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.VertexToFragmentNode;1043;1793,898;Inherit;False;False;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1248;-896,2944;Inherit;False;1239;VertexPos;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1002;2560,-128;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;236;3680,1904;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1001;4096,-32;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;397;1920,2224;Half;False;Clouds_G;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;524;128,-6912;Float;False;Property;_EnablePatternOverlay;Enable Pattern Overlay;11;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;632;128,-6592;Inherit;False;630;STARS;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1052;3424,1328;Float;False;Property;_ENABLEMOON_ON;Enable Moon;38;0;Create;False;0;0;0;False;0;False;0;0;0;False;;Toggle;2;Key0;Key1;Reference;1113;False;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1249;-736,2944;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;1045;2176,1344;Half;False;Property;_MoonIntensity;Moon Intensity;42;0;Create;True;0;0;0;False;0;False;1;1;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1003;4352,128;Half;False;SUN_MASK;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;104;3872,1904;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1048;2176,1152;Half;False;Property;_MoonColor;Moon Color;40;0;Create;True;0;0;0;False;1;Space(10);False;1,1,1,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1004;4352,-128;Half;False;SUN;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;631;464,-6784;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexToFragmentNode;1051;3664,1344;Inherit;False;False;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1049;2176,896;Inherit;True;Property;_MoonTexture;Moon Texture;39;1;[NoScaleOffset];Create;True;0;0;0;False;2;Space(10);StyledTextureSingleLine;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;399;3840,2240;Inherit;False;397;Clouds_G;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1111;640,-6592;Inherit;False;1003;SUN_MASK;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;391;4096,2160;Float;False;Property;_CloudsLitbySun;Clouds Lit by Sun;50;0;Create;True;0;0;0;False;1;Space(10);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1112;640,-6688;Inherit;False;1004;SUN;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1109;-512,3168;Half;False;Constant;_Float40;Float 40;55;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;314;-512,2944;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;918;640,-6912;Float;False;Property;_EnableStars;Enable Stars;15;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1108;-512,3072;Half;False;Constant;_Float39;Float 39;55;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1059;2560,896;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1053;4096,992;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;325;-896,3264;Half;False;Property;_FogSmoothness;Fog Smoothness;58;0;Create;True;0;0;0;False;0;False;0;0;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;313;-896,3136;Half;False;Property;_FogHeight;Fog Height;57;0;Create;True;0;0;0;False;1;Space(10);False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;176;960,-6784;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1077;4352,896;Half;False;MOON;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RelayNode;407;4560,2256;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;329;-256,3264;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1078;4352,1152;Half;False;MOON_MASK;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;261;4480,2080;Half;False;Property;_CloudsLightColor;Clouds Light Color;48;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;315;-320,2944;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;232;4480,1920;Half;False;Property;_CloudsShadowColor;Clouds Shadow Color;49;0;Create;True;0;0;0;False;0;False;0.4980392,0.7450981,1,1;1,0.1853116,0,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1231;1536,2496;Half;False;Property;_CloudsIntensity;Clouds Intensity;46;0;Create;True;0;0;0;False;1;Space(10);False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1116;1152,-6592;Inherit;False;1078;MOON_MASK;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;677;-64,2944;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;919;1152,-6912;Float;False;Property;_EnableSun;Enable Sun;32;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;101;4864,1920;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1115;1152,-6688;Inherit;False;1077;MOON;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1230;1856,2432;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;223;2016,2368;Half;False;CLOUDS_MASK;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;679;128,3264;Half;False;Property;_FogFill;Fog Fill;59;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;222;5312,1904;Half;False;CLOUDS;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1114;1472,-6784;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1110;128,3136;Half;False;Constant;_Float41;Float 41;55;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;316;128,2944;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;228;1664,-6688;Inherit;False;222;CLOUDS;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1113;1664,-6912;Float;False;Property;_EnableMoon;Enable Moon;38;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;229;1664,-6592;Inherit;False;223;CLOUDS_MASK;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;678;384,2944;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;359;768,2944;Half;False;FOG_MASK;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;227;1984,-6784;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FogAndAmbientColorsNode;312;2176,-6688;Inherit;False;unity_FogColor;0;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1120;2176,-6912;Float;False;Property;_EnableClouds;Enable Clouds;44;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;436;2176,-6592;Inherit;False;359;FOG_MASK;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;317;2560,-6784;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1226;-896,3392;Inherit;False;Property;_EnableFogMessage;EnableFogMessage;56;0;Create;True;0;0;0;True;1;StyledMessage(Info, The fog color is controlled by the fog color set in the Lighting panel., _EnableBuiltinFog, 1, 10, 0);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1198;-736,-7680;Half;False;Property;_BackgroundCat;[ Background Cat ];1;0;Create;True;0;0;0;True;1;StyledCategory(Background, 5, 10);False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1188;-512,-7680;Half;False;Property;_PatternCat;[ Pattern Cat ];10;0;Create;True;0;0;0;True;1;StyledCategory(Pattern);False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1189;0,-7680;Half;False;Property;_MoonCat;[ Moon Cat ];37;0;Create;True;0;0;0;True;1;StyledCategory(Moon);False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1186;-336,-7680;Half;False;Property;_StarsCat;[ Stars Cat ];14;0;Create;True;0;0;0;True;1;StyledCategory(Stars);False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1240;512,-7680;Half;False;Property;_SkyboxCat;[ Skybox Cat ];60;0;Create;True;0;0;0;True;1;StyledCategory(Skybox Settings);False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1181;352,-7680;Half;False;Property;_FogCat;[ Fog Cat ];54;0;Create;True;0;0;0;True;1;StyledCategory(Fog);False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1183;176,-7680;Half;False;Property;_CloudsCat;[ Clouds Cat ];43;0;Create;True;0;0;0;True;1;StyledCategory(Clouds);False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1185;-160,-7680;Half;False;Property;_SunCat;[ Sun Cat ];31;0;Create;True;0;0;0;True;1;StyledCategory(Sun);False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1184;-896,-7680;Half;False;Property;_Banner;< Banner >;0;0;Create;True;0;0;0;True;1;StyledBanner(Polyverse Skies Standard);False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;921;2816,-6912;Float;False;Property;_EnableBuiltinFog;Enable Fog;55;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1180;3328,-6912;Float;False;True;-1;2;PolyverseSkiesShaderGUI;100;1;BOXOPHOBIC/Polyverse Skies/Standard;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;2;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;2;False;-1;True;0;False;-1;True;False;0;False;-1;0;False;-1;True;3;RenderType=Background=RenderType;Queue=Background=Queue=0;PreviewType=Skybox;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;False;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
Node;AmplifyShaderEditor.CommentaryNode;1026;2816,128;Inherit;False;1029.934;100;Direction Negative Z Mask;0;;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1136;-896,1792;Inherit;False;1534.754;100;Clouds Coordinates;0;CLOUDS;0,0.4980392,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1091;768,1792;Inherit;False;1347.811;100;Clouds Cubemap;0;;0,0.4980392,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;700;-896,2816;Inherit;False;1411.941;100;Fog Coords on Screen;0;BUILT-IN FOG;0,0.4980392,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;639;-896,-2688;Inherit;False;1047.013;100;Pattern Overlay Texture and Contrast;0;PATTERN OVERLAY;0,0.4980392,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1117;-896,-7040;Inherit;False;4475.933;100;;0;FINAL COLOR;0.4980392,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;952;2432,-1280;Inherit;False;1793.068;100;Stars Horizon Height Mask;0;;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;914;4480,1792;Inherit;False;522.4746;100;Cloud Colors;0;;0,0.4980392,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1030;-896,768;Inherit;False;2948.242;100;Calculate Moon Position;0;MOON;0,0.4980392,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1035;2816,1152;Inherit;False;1054.961;100;Direction Negative Z Mask;0;;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1031;2176,768;Inherit;False;509.1301;100;Moon Texture, Color and Intensity;0;;0,0.4980392,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1006;-896,-256;Inherit;False;2942.402;100;Calculate Sun Position;0;SUN;0,0.4980392,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;480;640,-3840;Inherit;False;770.3374;100;Color Gradient Colors;0;;0,0.4980392,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;479;-896,-3840;Inherit;False;1405.403;100;Color Gradient Calculation;0;SKY;0,0.4980392,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;431;-896,-6144;Inherit;False;770.2415;100;Switch between Perspective / Orthographic camera;0;CAMERA MODE;1,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;991;2176,-256;Inherit;False;512.5464;100;Sun Texture, Color and Intensity;0;;0,0.4980392,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1187;-896,-7808;Inherit;False;1558.748;100;Drawers;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;949;2432,-1920;Inherit;False;1751.366;100;Stars Sun Mask;0;;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;942;-896,-1920;Inherit;False;3070.282;100;Stars Cubemap Coords and Cubemap RGB Layer;0;STARS;0,0.4980392,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;955;-896,-1024;Inherit;False;2050.233;100;Stars Twinkling ;0;;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1162;2304,1792;Inherit;False;1697.376;100;Light Calculation on Clouds;0;;1,1,0,1;0;0
WireConnection;1269;0;1265;0
WireConnection;1264;1;1269;0
WireConnection;1235;0;1233;0
WireConnection;1235;1;1232;0
WireConnection;1262;0;1234;0
WireConnection;1262;1;1264;0
WireConnection;1236;0;1238;0
WireConnection;1236;1;1235;0
WireConnection;1236;2;1264;0
WireConnection;1236;3;1262;0
WireConnection;1267;0;1236;0
WireConnection;1237;0;1267;0
WireConnection;309;0;267;2
WireConnection;309;1;267;1
WireConnection;1239;0;1237;0
WireConnection;268;0;1007;0
WireConnection;268;1;309;0
WireConnection;268;2;267;4
WireConnection;300;0;268;0
WireConnection;1210;0;1209;0
WireConnection;1210;1;1208;0
WireConnection;568;0;567;1
WireConnection;568;1;567;2
WireConnection;1245;0;1244;0
WireConnection;255;0;701;0
WireConnection;255;1;260;0
WireConnection;1213;0;1211;0
WireConnection;1213;1;1210;0
WireConnection;276;0;48;0
WireConnection;276;1;255;0
WireConnection;962;0;938;0
WireConnection;962;1;961;0
WireConnection;1215;0;1245;1
WireConnection;1215;1;1212;0
WireConnection;1216;0;1213;0
WireConnection;1247;0;1246;0
WireConnection;569;0;568;0
WireConnection;569;2;546;0
WireConnection;569;1;633;0
WireConnection;1005;0;938;0
WireConnection;956;0;569;0
WireConnection;1128;0;1247;1
WireConnection;1128;1;1127;0
WireConnection;964;0;1005;0
WireConnection;964;1;962;0
WireConnection;1218;0;1216;0
WireConnection;47;0;276;0
WireConnection;1217;0;1245;0
WireConnection;1217;1;1215;0
WireConnection;1217;2;1245;2
WireConnection;1242;0;1241;0
WireConnection;1229;0;1228;0
WireConnection;1205;0;47;0
WireConnection;1129;0;1247;0
WireConnection;1129;1;1128;0
WireConnection;1129;2;1247;2
WireConnection;1073;0;1061;0
WireConnection;1058;0;1061;0
WireConnection;1058;1;1062;0
WireConnection;967;0;962;0
WireConnection;287;0;1242;1
WireConnection;1227;0;1229;0
WireConnection;1227;1;1218;0
WireConnection;1227;3;1217;0
WireConnection;965;0;964;0
WireConnection;761;0;956;0
WireConnection;210;0;287;0
WireConnection;210;1;1008;0
WireConnection;210;2;212;0
WireConnection;210;3;1008;0
WireConnection;210;4;1009;0
WireConnection;738;0;733;0
WireConnection;1038;0;1073;0
WireConnection;1038;1;1058;0
WireConnection;1221;1;1217;0
WireConnection;1221;0;1227;0
WireConnection;566;1;761;0
WireConnection;968;0;967;0
WireConnection;968;1;1173;0
WireConnection;1203;38;1129;0
WireConnection;1203;43;1205;0
WireConnection;969;0;965;0
WireConnection;969;1;1173;0
WireConnection;1270;1;1242;1
WireConnection;970;0;968;0
WireConnection;970;1;969;0
WireConnection;732;0;1148;0
WireConnection;732;1;731;0
WireConnection;1039;0;1058;0
WireConnection;554;0;566;1
WireConnection;554;1;555;0
WireConnection;1222;0;1129;0
WireConnection;828;0;1172;2
WireConnection;475;0;471;0
WireConnection;1207;0;1203;19
WireConnection;740;0;738;0
WireConnection;1220;0;1221;0
WireConnection;537;0;528;0
WireConnection;537;1;1010;0
WireConnection;537;2;1011;0
WireConnection;537;3;1011;0
WireConnection;537;4;1010;0
WireConnection;1064;0;1038;0
WireConnection;208;0;210;0
WireConnection;1164;1;1222;0
WireConnection;1164;0;1207;0
WireConnection;832;0;828;0
WireConnection;832;1;1017;0
WireConnection;832;2;831;0
WireConnection;832;3;1167;0
WireConnection;832;4;1018;0
WireConnection;972;0;970;0
WireConnection;726;0;732;0
WireConnection;726;1;1014;0
WireConnection;726;2;740;0
WireConnection;726;3;1015;0
WireConnection;726;4;1016;0
WireConnection;533;0;537;0
WireConnection;533;1;1012;0
WireConnection;303;0;1270;0
WireConnection;756;0;554;0
WireConnection;564;1;1220;0
WireConnection;534;0;537;0
WireConnection;534;1;1013;0
WireConnection;470;0;208;0
WireConnection;470;1;475;0
WireConnection;1067;0;1064;0
WireConnection;1067;1;1175;0
WireConnection;1036;0;1039;0
WireConnection;1036;1;1175;0
WireConnection;878;1;1224;0
WireConnection;878;0;756;0
WireConnection;417;0;470;0
WireConnection;245;0;1164;0
WireConnection;530;0;564;3
WireConnection;530;1;534;0
WireConnection;529;0;564;2
WireConnection;529;1;533;0
WireConnection;1066;0;1036;0
WireConnection;1066;1;1067;0
WireConnection;1271;1;1215;0
WireConnection;724;0;726;0
WireConnection;278;0;241;0
WireConnection;278;1;1090;0
WireConnection;976;0;972;1
WireConnection;976;1;971;0
WireConnection;180;0;194;0
WireConnection;180;1;182;0
WireConnection;180;2;303;0
WireConnection;822;0;832;0
WireConnection;1191;1;1190;0
WireConnection;288;0;181;0
WireConnection;288;1;180;0
WireConnection;288;2;417;0
WireConnection;1197;0;1191;0
WireConnection;1197;1;1196;0
WireConnection;1250;0;1271;0
WireConnection;254;1;1243;0
WireConnection;947;0;724;0
WireConnection;953;0;822;0
WireConnection;527;0;564;1
WireConnection;527;1;529;0
WireConnection;527;2;530;0
WireConnection;980;0;972;0
WireConnection;980;1;976;0
WireConnection;244;0;245;1
WireConnection;244;1;278;0
WireConnection;1223;0;619;0
WireConnection;1223;1;878;0
WireConnection;981;0;975;0
WireConnection;981;1;973;0
WireConnection;981;2;1019;0
WireConnection;981;3;1020;0
WireConnection;981;4;1021;0
WireConnection;1063;0;1066;0
WireConnection;762;0;947;0
WireConnection;218;0;288;0
WireConnection;856;0;953;0
WireConnection;985;0;980;0
WireConnection;985;1;981;0
WireConnection;246;0;245;0
WireConnection;246;1;244;0
WireConnection;246;2;245;2
WireConnection;519;1;254;0
WireConnection;519;0;283;0
WireConnection;1072;0;1063;1
WireConnection;1072;1;1065;0
WireConnection;1195;0;1197;0
WireConnection;626;0;527;0
WireConnection;626;1;1223;0
WireConnection;876;0;762;0
WireConnection;876;1;626;0
WireConnection;876;2;856;0
WireConnection;989;0;985;0
WireConnection;989;1;1022;0
WireConnection;989;2;1024;0
WireConnection;989;3;1023;0
WireConnection;989;4;1024;0
WireConnection;41;1;246;0
WireConnection;1069;0;1063;0
WireConnection;1069;1;1072;0
WireConnection;517;0;519;0
WireConnection;1259;0;1253;0
WireConnection;1068;0;1046;0
WireConnection;1068;1;1071;0
WireConnection;1068;2;1047;0
WireConnection;1068;3;1070;0
WireConnection;1068;4;1040;0
WireConnection;988;0;1028;0
WireConnection;988;1;1174;0
WireConnection;1075;0;1069;0
WireConnection;1075;1;1068;0
WireConnection;513;0;517;0
WireConnection;126;0;41;0
WireConnection;940;0;989;0
WireConnection;1201;0;220;0
WireConnection;1201;1;1199;0
WireConnection;1255;1;1259;0
WireConnection;1255;2;1251;0
WireConnection;886;0;876;0
WireConnection;994;0;988;0
WireConnection;1200;1;220;0
WireConnection;1200;0;1199;0
WireConnection;1200;2;1201;0
WireConnection;1054;0;1056;0
WireConnection;1054;1;1176;0
WireConnection;116;0;126;0
WireConnection;116;1;1094;0
WireConnection;116;2;1096;0
WireConnection;116;3;1095;0
WireConnection;116;4;1096;0
WireConnection;1027;0;994;0
WireConnection;1163;0;1147;0
WireConnection;882;0;886;0
WireConnection;882;1;629;0
WireConnection;882;2;1255;0
WireConnection;993;0;940;0
WireConnection;1074;0;1075;0
WireConnection;1074;1;1042;0
WireConnection;1074;2;1044;0
WireConnection;1074;3;1041;0
WireConnection;1074;4;1044;0
WireConnection;995;1;993;0
WireConnection;997;0;1027;0
WireConnection;574;0;516;0
WireConnection;574;1;1200;0
WireConnection;630;0;882;0
WireConnection;89;0;1163;0
WireConnection;89;1;116;0
WireConnection;1055;0;1054;0
WireConnection;1057;0;1074;0
WireConnection;1043;0;1057;0
WireConnection;1002;0;995;1
WireConnection;1002;1;998;0
WireConnection;1002;2;996;0
WireConnection;236;0;89;0
WireConnection;236;1;1098;0
WireConnection;236;2;1099;0
WireConnection;236;3;1097;0
WireConnection;236;4;1099;0
WireConnection;1001;0;995;4
WireConnection;1001;1;997;0
WireConnection;397;0;41;2
WireConnection;524;1;1200;0
WireConnection;524;0;574;0
WireConnection;1052;0;1055;0
WireConnection;1249;0;1248;0
WireConnection;1003;0;1001;0
WireConnection;104;0;236;0
WireConnection;1004;0;1002;0
WireConnection;631;0;524;0
WireConnection;631;1;632;0
WireConnection;1051;0;1052;0
WireConnection;1049;1;1043;0
WireConnection;391;1;399;0
WireConnection;391;0;104;0
WireConnection;314;0;1249;1
WireConnection;918;1;524;0
WireConnection;918;0;631;0
WireConnection;1059;0;1049;1
WireConnection;1059;1;1048;0
WireConnection;1059;2;1045;0
WireConnection;1053;0;1049;4
WireConnection;1053;1;1051;0
WireConnection;176;0;918;0
WireConnection;176;1;1112;0
WireConnection;176;2;1111;0
WireConnection;1077;0;1059;0
WireConnection;407;0;391;0
WireConnection;329;0;325;0
WireConnection;1078;0;1053;0
WireConnection;315;0;314;0
WireConnection;315;1;1108;0
WireConnection;315;2;313;0
WireConnection;315;3;1108;0
WireConnection;315;4;1109;0
WireConnection;677;0;315;0
WireConnection;677;1;329;0
WireConnection;919;1;918;0
WireConnection;919;0;176;0
WireConnection;101;0;232;0
WireConnection;101;1;261;0
WireConnection;101;2;407;0
WireConnection;1230;0;41;4
WireConnection;1230;1;1231;0
WireConnection;223;0;1230;0
WireConnection;222;0;101;0
WireConnection;1114;0;919;0
WireConnection;1114;1;1115;0
WireConnection;1114;2;1116;0
WireConnection;316;0;677;0
WireConnection;1113;1;919;0
WireConnection;1113;0;1114;0
WireConnection;678;0;316;0
WireConnection;678;1;1110;0
WireConnection;678;2;679;0
WireConnection;359;0;678;0
WireConnection;227;0;1113;0
WireConnection;227;1;228;0
WireConnection;227;2;229;0
WireConnection;1120;1;1113;0
WireConnection;1120;0;227;0
WireConnection;317;0;312;0
WireConnection;317;1;1120;0
WireConnection;317;2;436;0
WireConnection;921;1;1120;0
WireConnection;921;0;317;0
WireConnection;1180;0;921;0
ASEEND*/
//CHKSM=D9AA40034D81E6C46571D77E7025F510DF0451AF