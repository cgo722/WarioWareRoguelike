RSRC                    VisualShader            ��������                                            o      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports    parameter_name 
   qualifier    texture_type    color_default    texture_filter    texture_repeat    texture_source    script    source    texture 	   operator    hint    min    max    step    default_value_enabled    default_value    input_name    op_type    code    graph_offset    mode    modes/blend    modes/depth_draw    modes/cull    modes/diffuse    modes/specular    flags/depth_prepass_alpha    flags/depth_test_disabled    flags/sss_mode_skin    flags/unshaded    flags/wireframe    flags/skip_vertex_transform    flags/world_vertex_coords    flags/ensure_correct_normals    flags/shadows_disabled    flags/ambient_light_disabled    flags/shadow_to_opacity    flags/vertex_lighting    flags/particle_trails    flags/alpha_to_coverage     flags/alpha_to_coverage_and_one    flags/debug_shadow_splits    flags/fog_disabled    nodes/vertex/0/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/2/node    nodes/fragment/2/position    nodes/fragment/3/node    nodes/fragment/3/position    nodes/fragment/4/node    nodes/fragment/4/position    nodes/fragment/5/node    nodes/fragment/5/position    nodes/fragment/6/node    nodes/fragment/6/position    nodes/fragment/7/node    nodes/fragment/7/position    nodes/fragment/8/node    nodes/fragment/8/position    nodes/fragment/9/node    nodes/fragment/9/position    nodes/fragment/11/node    nodes/fragment/11/position    nodes/fragment/12/node    nodes/fragment/12/position    nodes/fragment/13/node    nodes/fragment/13/position    nodes/fragment/14/node    nodes/fragment/14/position    nodes/fragment/15/node    nodes/fragment/15/position    nodes/fragment/16/node    nodes/fragment/16/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/2/node    nodes/light/2/position    nodes/light/3/node    nodes/light/3/position    nodes/light/4/node    nodes/light/4/position    nodes/light/11/node    nodes/light/11/position    nodes/light/13/node    nodes/light/13/position    nodes/light/14/node    nodes/light/14/position    nodes/light/15/node    nodes/light/15/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections        1   local://VisualShaderNodeTexture2DParameter_6ym75 �      &   local://VisualShaderNodeTexture_kcsg0 �      &   local://VisualShaderNodeTexture_im4oo -      1   local://VisualShaderNodeTexture2DParameter_7niwm a      1   local://VisualShaderNodeTexture2DParameter_y0ns2 �      &   local://VisualShaderNodeTexture_6d7c3 �      &   local://VisualShaderNodeFloatOp_xrafn $      -   local://VisualShaderNodeFloatParameter_yavn1 �      1   local://VisualShaderNodeTexture2DParameter_ub4qt �      &   local://VisualShaderNodeTexture_8i421 -      &   local://VisualShaderNodeColorOp_gcr5h a      $   local://VisualShaderNodeInput_q7n2x �      '   local://VisualShaderNodeVectorOp_6hl0t �      ,   local://VisualShaderNodeVec2Parameter_atg8o ?      )   local://VisualShaderNodeDotProduct_xsbtk �      $   local://VisualShaderNodeInput_um4vh �      $   local://VisualShaderNodeInput_g34wj �      $   local://VisualShaderNodeInput_v0co8 "      )   local://VisualShaderNodeDotProduct_tqivh [      )   local://VisualShaderNodeDotProduct_k5s1r �      ,   local://VisualShaderNodeVec3Parameter_7uqab �         local://VisualShader_dqmsx       #   VisualShaderNodeTexture2DParameter          
   Color_Map          VisualShaderNodeTexture                      VisualShaderNodeTexture                   #   VisualShaderNodeTexture2DParameter             AO_Map       #   VisualShaderNodeTexture2DParameter          
   Roughness          VisualShaderNodeTexture                      VisualShaderNodeFloatOp                                      0A                  VisualShaderNodeFloatParameter             Roughness_Strength                  �?      #   VisualShaderNodeTexture2DParameter             hue          VisualShaderNodeTexture                      VisualShaderNodeColorOp                      VisualShaderNodeInput             uv          VisualShaderNodeVectorOp                    
                 
                                       VisualShaderNodeVec2Parameter             scaling          VisualShaderNodeDotProduct             VisualShaderNodeInput             light          VisualShaderNodeInput             attenuation          VisualShaderNodeInput             normal          VisualShaderNodeDotProduct             VisualShaderNodeDotProduct             VisualShaderNodeVec3Parameter             Light_Intesity                   ?                 VisualShader .         X  shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_lambert, specular_schlick_ggx;

uniform vec2 scaling;
uniform sampler2D Color_Map;
uniform sampler2D hue;
uniform sampler2D Roughness;
uniform float Roughness_Strength = 1;
uniform sampler2D AO_Map;
uniform vec3 Light_Intesity = vec3(0.500000, 0.000000, 0.000000);



void fragment() {
// Input:14
	vec2 n_out14p0 = UV;


// Vector2Parameter:16
	vec2 n_out16p0 = scaling;


// VectorOp:15
	vec2 n_out15p0 = n_out14p0 * n_out16p0;


	vec4 n_out3p0;
// Texture2D:3
	n_out3p0 = texture(Color_Map, n_out15p0);


	vec4 n_out12p0;
// Texture2D:12
	n_out12p0 = texture(hue, UV);


	vec3 n_out13p0;
// ColorOp:13
	{
		float base = vec3(n_out3p0.xyz).x;
		float blend = vec3(n_out12p0.xyz).x;
		if (base < 0.5) {
			n_out13p0.x = (base * (blend + 0.5));
		} else {
			n_out13p0.x = (1.0 - (1.0 - base) * (1.0 - (blend - 0.5)));
		}
	}
	{
		float base = vec3(n_out3p0.xyz).y;
		float blend = vec3(n_out12p0.xyz).y;
		if (base < 0.5) {
			n_out13p0.y = (base * (blend + 0.5));
		} else {
			n_out13p0.y = (1.0 - (1.0 - base) * (1.0 - (blend - 0.5)));
		}
	}
	{
		float base = vec3(n_out3p0.xyz).z;
		float blend = vec3(n_out12p0.xyz).z;
		if (base < 0.5) {
			n_out13p0.z = (base * (blend + 0.5));
		} else {
			n_out13p0.z = (1.0 - (1.0 - base) * (1.0 - (blend - 0.5)));
		}
	}


	vec4 n_out7p0;
// Texture2D:7
	n_out7p0 = texture(Roughness, UV);


// FloatParameter:9
	float n_out9p0 = Roughness_Strength;


// FloatOp:8
	float n_out8p0 = n_out7p0.x * n_out9p0;


	vec4 n_out4p0;
// Texture2D:4
	n_out4p0 = texture(AO_Map, UV);


// Output:0
	ALBEDO = n_out13p0;
	ROUGHNESS = n_out8p0;
	AO = n_out4p0.x;


}

void light() {
// Input:3
	vec3 n_out3p0 = LIGHT;


// Input:4
	float n_out4p0 = ATTENUATION;


// DotProduct:2
	float n_out2p0 = dot(n_out3p0, vec3(n_out4p0));


// Input:11
	vec3 n_out11p0 = NORMAL;


// DotProduct:13
	float n_out13p0 = dot(vec3(n_out2p0), n_out11p0);


// Vector3Parameter:15
	vec3 n_out15p0 = Light_Intesity;


// DotProduct:14
	float n_out14p0 = dot(vec3(n_out13p0), n_out15p0);


// Output:0
	DIFFUSE_LIGHT = vec3(n_out14p0);


}
 4             5   
    ���  \�6            7   
     ��   �8            9   
    ���  D:            ;   
    ��  �C<            =   
    ��  fD>            ?   
    ���  CD@            A   
   �����<fDB            C   
    ���  �DD            E   
     ��  H�F         	   G   
     k�  ��H         
   I   
   ��Mè��BJ            K   
     9�    L            M   
    @�  ��N            O   
     >�  CP       8                                                                                    	                                                                                                             R            S   
     4�   BT            U   
     ��  ��V            W   
     ��   BX            Y   
     ��  \CZ            [   
     ��  �B\            ]   
   �6����B^            _   
     ��  �`                                                                                                                RSRC