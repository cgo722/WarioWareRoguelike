RSRC                    VisualShader            ��������                                            �      resource_local_to_scene    resource_name    noise_type    seed 
   frequency    offset    fractal_type    fractal_octaves    fractal_lacunarity    fractal_gain    fractal_weighted_strength    fractal_ping_pong_strength    cellular_distance_function    cellular_jitter    cellular_return_type    domain_warp_enabled    domain_warp_type    domain_warp_amplitude    domain_warp_frequency    domain_warp_fractal_type    domain_warp_fractal_octaves    domain_warp_fractal_lacunarity    domain_warp_fractal_gain    script    width    height    invert    in_3d_space    generate_mipmaps 	   seamless    seamless_blend_skirt    as_normal_map    bump_strength 
   normalize    color_ramp    noise    output_port_for_preview    default_input_values    expanded_output_ports    source    texture    texture_type    op_type 	   operator    input_name 	   function    interpolation_mode    interpolation_color_space    offsets    colors 	   gradient    use_hdr    fill 
   fill_from    fill_to    repeat    parameter_name 
   qualifier    color_default    texture_filter    texture_repeat    texture_source    hint    min    max    step    default_value_enabled    default_value    code    graph_offset    mode    modes/blend    modes/depth_draw    modes/cull    modes/diffuse    modes/specular    flags/depth_prepass_alpha    flags/depth_test_disabled    flags/sss_mode_skin    flags/unshaded    flags/wireframe    flags/skip_vertex_transform    flags/world_vertex_coords    flags/ensure_correct_normals    flags/shadows_disabled    flags/ambient_light_disabled    flags/shadow_to_opacity    flags/vertex_lighting    flags/particle_trails    flags/alpha_to_coverage     flags/alpha_to_coverage_and_one    flags/debug_shadow_splits    flags/fog_disabled    nodes/vertex/0/position    nodes/vertex/4/node    nodes/vertex/4/position    nodes/vertex/5/node    nodes/vertex/5/position    nodes/vertex/6/node    nodes/vertex/6/position    nodes/vertex/7/node    nodes/vertex/7/position    nodes/vertex/8/node    nodes/vertex/8/position    nodes/vertex/9/node    nodes/vertex/9/position    nodes/vertex/10/node    nodes/vertex/10/position    nodes/vertex/11/node    nodes/vertex/11/position    nodes/vertex/12/node    nodes/vertex/12/position    nodes/vertex/13/node    nodes/vertex/13/position    nodes/vertex/14/node    nodes/vertex/14/position    nodes/vertex/15/node    nodes/vertex/15/position    nodes/vertex/16/node    nodes/vertex/16/position    nodes/vertex/17/node    nodes/vertex/17/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/2/node    nodes/fragment/2/position    nodes/fragment/3/node    nodes/fragment/3/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/2/node    nodes/light/2/position    nodes/light/3/node    nodes/light/3/position    nodes/light/4/node    nodes/light/4/position    nodes/light/5/node    nodes/light/5/position    nodes/light/6/node    nodes/light/6/position    nodes/light/7/node    nodes/light/7/position    nodes/light/8/node    nodes/light/8/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections           local://FastNoiseLite_17iao          local://NoiseTexture2D_cmqol a      &   local://VisualShaderNodeTexture_cd1uo �      '   local://VisualShaderNodeVectorOp_8v3go        $   local://VisualShaderNodeInput_22246 5      %   local://VisualShaderNodeUVFunc_ik6dq n      $   local://VisualShaderNodeInput_p0spp �         local://Gradient_wj0g0            local://GradientTexture2D_2hmx6 E      &   local://VisualShaderNodeTexture_odgea w      1   local://VisualShaderNodeTexture2DParameter_j24nx �      1   local://VisualShaderNodeTexture2DParameter_ul1tl       &   local://VisualShaderNodeFloatOp_wtrh8 I      &   local://VisualShaderNodeTexture_5iybi }      &   local://VisualShaderNodeTexture_u2v3f �      %   local://VisualShaderNodeUVFunc_w7ii3       1   local://VisualShaderNodeTexture2DParameter_fe6ob t      1   local://VisualShaderNodeTexture2DParameter_8k632 �      1   local://VisualShaderNodeTexture2DParameter_s04ur       &   local://VisualShaderNodeTexture_qo2bn J      )   local://VisualShaderNodeDotProduct_658tc ~      $   local://VisualShaderNodeInput_emdwk �      $   local://VisualShaderNodeInput_wacdw �      &   local://VisualShaderNodeFloatOp_2pbv7       $   local://VisualShaderNodeClamp_w1cs0 n      -   local://VisualShaderNodeFloatParameter_xej53 �      -   local://VisualShaderNodeFloatParameter_8m5yy          local://VisualShader_6ppun d         FastNoiseLite          
         �z�?	      q=�>         NoiseTexture2D                   V>#                      VisualShaderNodeTexture    &                '         (                     VisualShaderNodeVectorOp    +                  VisualShaderNodeInput    ,         vertex          VisualShaderNodeUVFunc    %               
     �?   @      
                    VisualShaderNodeInput    ,         time       	   Gradient    1   $      D�*?D�*?D�*?  �?  �?  �?  �?  �?         GradientTexture2D    2                     VisualShaderNodeTexture    '         (                  #   VisualShaderNodeTexture2DParameter    8      
   intensity       #   VisualShaderNodeTexture2DParameter    8         noise          VisualShaderNodeFloatOp    +                  VisualShaderNodeTexture    &                '         (                     VisualShaderNodeTexture    '         (                     VisualShaderNodeUVFunc    %               
      @  �?      
                 #   VisualShaderNodeTexture2DParameter    8         Noise_2       #   VisualShaderNodeTexture2DParameter    8         Intesity_2       #   VisualShaderNodeTexture2DParameter    8         color          VisualShaderNodeTexture    '                  VisualShaderNodeDotProduct             VisualShaderNodeInput    ,         light          VisualShaderNodeInput    ,         normal          VisualShaderNodeFloatOp    %                                  @?         VisualShaderNodeClamp    %                             )   X�h�uO�=            ?         VisualShaderNodeFloatParameter    8         Specular_Min          VisualShaderNodeFloatParameter    8         Specular_Max          VisualShader 5   D      �  shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_lambert, specular_schlick_ggx;

uniform sampler2D Noise_2;
uniform sampler2D Intesity_2;
uniform sampler2D noise;
uniform sampler2D intensity;
uniform sampler2D color;
uniform float Specular_Min;
uniform float Specular_Max;



void vertex() {
// Input:8
	float n_out8p0 = TIME;


// UVFunc:15
	vec2 n_in15p1 = vec2(2.00000, 1.00000);
	vec2 n_out15p0 = vec2(n_out8p0) * n_in15p1 + UV;


	vec4 n_out13p0;
// Texture2D:13
	n_out13p0 = texture(Noise_2, n_out15p0);


	vec4 n_out14p0;
// Texture2D:14
	n_out14p0 = texture(Intesity_2, vec2(n_out13p0.xy));


// UVFunc:7
	vec2 n_in7p1 = vec2(1.00000, 2.00000);
	vec2 n_out7p0 = vec2(n_out8p0) * n_in7p1 + UV;


	vec4 n_out4p0;
// Texture2D:4
	n_out4p0 = texture(noise, n_out7p0);


	vec4 n_out9p0;
// Texture2D:9
	n_out9p0 = texture(intensity, vec2(n_out4p0.xy));


// FloatOp:12
	float n_out12p0 = n_out14p0.x * n_out9p0.x;


// Input:6
	vec3 n_out6p0 = VERTEX;


// VectorOp:5
	vec3 n_out5p0 = vec3(n_out12p0) * n_out6p0;


// Output:0
	VERTEX = n_out5p0;


}

void fragment() {
	vec4 n_out3p0;
// Texture2D:3
	n_out3p0 = texture(color, UV);


// Output:0
	ALBEDO = vec3(n_out3p0.xyz);


}

void light() {
// Input:3
	vec3 n_out3p0 = LIGHT;


// Input:4
	vec3 n_out4p0 = NORMAL;


// DotProduct:2
	float n_out2p0 = dot(n_out3p0, n_out4p0);


// FloatOp:5
	float n_in5p1 = 0.75000;
	float n_out5p0 = n_out2p0 + n_in5p1;


// FloatParameter:7
	float n_out7p0 = Specular_Min;


// FloatParameter:8
	float n_out8p0 = Specular_Max;


// Clamp:6
	float n_out6p0 = clamp(n_out2p0, n_out7p0, n_out8p0);


// Output:0
	DIFFUSE_LIGHT = vec3(n_out5p0);
	SPECULAR_LIGHT = vec3(n_out6p0);


}
 ]   
     /D   B^            _   
     ��  H�`            a   
     ��  pBb            c   
    ���  �Cd            e   
    ��  �f            g   
    @I�  H�h         	   i   
    ���   �j         
   k   
    @�  �Cl            m   
     C�  �Cn            o   
     M�  ��p            q   
    ���  �r            s   
     ��  �t            u   
    ��  �v            w   
     *�  ��x            y   
     �� ���z       <                                                                 	       
       	                   	                                                                                                            {   
     4C  �C|            }   
     ��  \C~               
     *�  4C�                                      �            �   
     9�  �B�            �   
    ���  Æ            �   
    ���  \C�            �   
     ��  �A�            �   
     ��  �C�            �   
    ���  �C�            �   
    ���   D�                                                                                                                               RSRC