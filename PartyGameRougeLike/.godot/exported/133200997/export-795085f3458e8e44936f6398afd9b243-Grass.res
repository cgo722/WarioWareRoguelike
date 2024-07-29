RSRC                    VisualShader            ��������                                            �      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports    input_name    script    op_type 	   function 	   operator    parameter_name 
   qualifier    texture_type    color_default    texture_filter    texture_repeat    texture_source    source    texture    default_value_enabled    default_value    interpolation_mode    interpolation_color_space    offsets    colors 	   gradient    width    height    use_hdr    fill 
   fill_from    fill_to    repeat    noise_type    seed 
   frequency    offset    fractal_type    fractal_octaves    fractal_lacunarity    fractal_gain    fractal_weighted_strength    fractal_ping_pong_strength    cellular_distance_function    cellular_jitter    cellular_return_type    domain_warp_enabled    domain_warp_type    domain_warp_amplitude    domain_warp_frequency    domain_warp_fractal_type    domain_warp_fractal_octaves    domain_warp_fractal_lacunarity    domain_warp_fractal_gain    invert    in_3d_space    generate_mipmaps 	   seamless    seamless_blend_skirt    as_normal_map    bump_strength 
   normalize    color_ramp    noise    code    graph_offset    mode    modes/blend    modes/depth_draw    modes/cull    modes/diffuse    modes/specular    flags/depth_prepass_alpha    flags/depth_test_disabled    flags/sss_mode_skin    flags/unshaded    flags/wireframe    flags/skip_vertex_transform    flags/world_vertex_coords    flags/ensure_correct_normals    flags/shadows_disabled    flags/ambient_light_disabled    flags/shadow_to_opacity    flags/vertex_lighting    flags/particle_trails    flags/alpha_to_coverage     flags/alpha_to_coverage_and_one    flags/debug_shadow_splits    flags/fog_disabled    nodes/vertex/0/position    nodes/vertex/2/node    nodes/vertex/2/position    nodes/vertex/3/node    nodes/vertex/3/position    nodes/vertex/4/node    nodes/vertex/4/position    nodes/vertex/5/node    nodes/vertex/5/position    nodes/vertex/6/node    nodes/vertex/6/position    nodes/vertex/7/node    nodes/vertex/7/position    nodes/vertex/8/node    nodes/vertex/8/position    nodes/vertex/9/node    nodes/vertex/9/position    nodes/vertex/10/node    nodes/vertex/10/position    nodes/vertex/11/node    nodes/vertex/11/position    nodes/vertex/12/node    nodes/vertex/12/position    nodes/vertex/13/node    nodes/vertex/13/position    nodes/vertex/14/node    nodes/vertex/14/position    nodes/vertex/15/node    nodes/vertex/15/position    nodes/vertex/16/node    nodes/vertex/16/position    nodes/vertex/17/node    nodes/vertex/17/position    nodes/vertex/18/node    nodes/vertex/18/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/2/node    nodes/fragment/2/position    nodes/fragment/3/node    nodes/fragment/3/position    nodes/fragment/4/node    nodes/fragment/4/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/2/node    nodes/light/2/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections        $   local://VisualShaderNodeInput_6j0nx U      .   local://VisualShaderNodeVectorDecompose_8rxg3 �      (   local://VisualShaderNodeFloatFunc_fhvj3 �      '   local://VisualShaderNodeVectorOp_vfnip       $   local://VisualShaderNodeInput_7rop2 E      1   local://VisualShaderNodeTexture2DParameter_ocdhm ~      &   local://VisualShaderNodeTexture_uumjf �      '   local://VisualShaderNodeVectorOp_3l1jo �      %   local://VisualShaderNodeUVFunc_p3vno 0      $   local://VisualShaderNodeInput_xiohf W      $   local://VisualShaderNodeInput_t66sr �      .   local://VisualShaderNodeVectorDecompose_tlacg �      ,   local://VisualShaderNodeVectorCompose_arlo6       '   local://VisualShaderNodeVectorOp_e7o6w >      ,   local://VisualShaderNodeVec2Parameter_owe24 �      '   local://VisualShaderNodeVectorOp_xxtcn �      ,   local://VisualShaderNodeVec2Parameter_adjru _         local://Gradient_y1mim �          local://GradientTexture2D_1q3gk �      &   local://VisualShaderNodeTexture_vkp08          local://Gradient_nt76b N         local://FastNoiseLite_4b6nh �         local://NoiseTexture2D_3klq4 �      &   local://VisualShaderNodeTexture_3pt2h �      (   local://VisualShaderNodeColorFunc_hkpft 4      &   local://VisualShaderNodeTexture_yqlfd ^         local://VisualShader_palvj �         VisualShaderNodeInput             uv           VisualShaderNodeVectorDecompose                    
                              VisualShaderNodeFloatFunc                      VisualShaderNodeVectorOp             VisualShaderNodeInput             vertex       #   VisualShaderNodeTexture2DParameter    
      
   WindNoise          VisualShaderNodeTexture                      VisualShaderNodeVectorOp    	                  VisualShaderNodeUVFunc             VisualShaderNodeInput             time          VisualShaderNodeInput             node_position_world           VisualShaderNodeVectorDecompose             VisualShaderNodeVectorCompose                       VisualShaderNodeVectorOp                    
                 
                              VisualShaderNodeVec2Parameter    
      	   Intesity          VisualShaderNodeVectorOp                    
                 
                     	                  VisualShaderNodeVec2Parameter    
         Speed       	   Gradient       $          ���>{�>  �?�K�>�Q:?��>  �?         GradientTexture2D                         VisualShaderNodeTexture                      	   Gradient       $      ծ�>ծ�>ծ�>  �?  �?  �?  �?  �?         FastNoiseLite    #      �-�:         NoiseTexture2D    >            ?                     VisualShaderNodeTexture                         VisualShaderNodeColorFunc             VisualShaderNodeTexture                         VisualShader 1   @        shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_lambert, specular_schlick_ggx;

uniform vec2 Intesity;
uniform sampler2D WindNoise;
uniform vec2 Speed;
uniform sampler2D tex_frg_2;
uniform sampler2D tex_frg_3;
uniform sampler2D tex_lgt_2;



void vertex() {
// Input:6
	vec3 n_out6p0 = VERTEX;


// Vector2Parameter:16
	vec2 n_out16p0 = Intesity;


// Input:12
	vec3 n_out12p0 = NODE_POSITION_WORLD;


// VectorDecompose:13
	float n_out13p0 = n_out12p0.x;
	float n_out13p1 = n_out12p0.y;
	float n_out13p2 = n_out12p0.z;


// VectorCompose:14
	vec2 n_out14p0 = vec2(n_out13p0, n_out13p2);


// Input:11
	float n_out11p0 = TIME;


// VectorOp:15
	vec2 n_out15p0 = n_out14p0 + vec2(n_out11p0);


// UVFunc:10
	vec2 n_out10p0 = n_out15p0 * n_out16p0 + UV;


	vec4 n_out8p0;
// Texture2D:8
	n_out8p0 = texture(WindNoise, n_out10p0);


// Input:2
	vec2 n_out2p0 = UV;


// VectorDecompose:3
	float n_out3p0 = n_out2p0.x;
	float n_out3p1 = n_out2p0.y;


// FloatFunc:4
	float n_out4p0 = 1.0 - n_out3p0;


// VectorOp:9
	vec3 n_out9p0 = vec3(n_out8p0.xyz) * vec3(n_out4p0);


// Vector2Parameter:18
	vec2 n_out18p0 = Speed;


// VectorOp:17
	vec2 n_out17p0 = vec2(n_out9p0.xy) * n_out18p0;


// VectorOp:5
	vec3 n_out5p0 = n_out6p0 + vec3(n_out17p0, 0.0);


// Output:0
	VERTEX = n_out5p0;


}

void fragment() {
// Texture2D:2
	vec4 n_out2p0 = texture(tex_frg_2, UV);


// Texture2D:3
	vec4 n_out3p0 = texture(tex_frg_3, UV);


	vec3 n_out4p0;
// ColorFunc:4
	{
		vec3 c = vec3(n_out3p0.xyz);
		float max1 = max(c.r, c.g);
		float max2 = max(max1, c.b);
		n_out4p0 = vec3(max2, max2, max2);
	}


// Output:0
	ALBEDO = vec3(n_out2p0.xyz);
	ROUGHNESS = n_out4p0.x;


}

void light() {
// Texture2D:2
	vec4 n_out2p0 = texture(tex_lgt_2, UV);


// Output:0
	DIFFUSE_LIGHT = vec3(n_out2p0.xyz);


}
 Y   
     �D   CZ             [   
    @�  �C\            ]   
     ��  �C^            _   
    ���  �C`            a   
     �B  HCb            c   
     ��  H�d            e   
    �	�  ��f            g   
     ��  ��h            i   
     H�  pBj            k   
    � �  �l         	   m   
    �J�  ��n         
   o   
    �s�  H�p            q   
    �K�  R�r            s   
    @5�  R�t            u   
    ��  �v            w   
    @�  f�x            y   
   ����=��Cz            {   
     ��  D|       H                                                   	       
                                                                                        
             
      	                                                             	                     }   
     >D  C~               
     �  4À            �   
     �  �C�            �   
     �C  �C�                                                     �            �   
   ��4Ç6@È                               RSRC