GDPC                                                                             
   <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex0      �      &�y���ڞu;>��.p@   res://.import/image.png-2de165adb17dfebcee8a7cd6c9833936.stex   �      V       W�w�Ӓ���Z���`�   res://Main.gd.remap �              �(@Er�#��K�F�[   res://Main.gdc  �      �      =�<��������4�u   res://Main.tscn p	            ���I|�.1���{�   res://default_env.tres  �      �       um�`�N��<*ỳ�8   res://icon.png  �       �      G1?��z�c��vN��   res://icon.png.import         �      ��fe��6�B��^ U�   res://image.png.import         �      n�Y��ŻK\�@U   res://project.binary�-      �      `*�.$�V9�gFOTC     GDSC         %   #     �����Ӷ�   �������Ŷ���   ����׶��   �����Ķ�   �������ڶ���   ���������������۶���   ���۶���   ����¶��   ����������������Ҷ��   ϶��   ζ��   ���������������۶���   ����ڶ��   �   ���¶���   ﶶ�   ���۶���   �����¶�   ����¶��   ��������������������ض��   �����������ζ���   ��������������������������Ҷ   �������¶���   ���������Ŷ�   ������������Ŷ��      center        zoom      ui_up     {�G�z�?      ui_down       ui_left       ui_right      zoom_in   ffffff�?      zoom_out  333333�?      X:        Y:        Zoom:           �������?        �������?   
   iterations                     
                        (      0   	   9   
   A      J      R      [      c      l      r      {      �      �      �      �      �      �      �      �      �      �      �      �      �      �         !     "     #     $   !  %   3YY0�  P�  QV�  ;�  �  T�  PQ�  ;�  �  T�  P�  Q�  �  &�  T�  P�  QV�  �  T�	  �  �  �  &�  T�  P�  QV�  �  T�	  �  �  �  &�  T�  P�  QV�  �  T�
  �  �  �  &�  T�  P�  QV�  �  T�
  �  �  �  &�  T�  P�  QV�  �  �  �  �  &�  T�  P�	  QV�  �  �  �
  �  �  �  T�  PR�  Q�  �  T�  P�  R�  Q�  �  W�  �  T�  �  �>  P�  T�
  Q�  W�  �  T�  �  �>  P�  T�	  Q�  W�  �  T�  �  �>  P�  QYY0�  P�  QV�  &�  4�  V�  &�  T�  �  V�  �  T�  P�  R�  T�  P�  Q�  Q�  (V&�  T�  �  V�  �  T�  P�  R�  T�  P�  Q�  QYY0�  P�  QV�  �  T�  P�  R�  P�  QQ�  W�  �  T�  PQY`    [gd_scene load_steps=5 format=2]

[ext_resource path="res://image.png" type="Texture" id=1]
[ext_resource path="res://Main.gd" type="Script" id=2]

[sub_resource type="Shader" id=6]
code = "shader_type canvas_item;
uniform int iterations = 25;
uniform vec2 center = vec2(-0.5, 0);
uniform float zoom = 1.0;
const vec4 colors[12] = {vec4(1, 0, 0, 1), vec4(1, 0.5, 0, 1), vec4(1, 1, 0, 1), vec4(0.5, 1, 0, 1), vec4(0, 1, 0, 1), vec4(0, 1, 0.5, 1), vec4(0, 1, 1, 1), vec4(0, 0.5, 1, 1), vec4(0, 0, 1, 1), vec4(0.5, 0, 1, 1), vec4(1, 0, 1, 1), vec4(1, 0, 0.5, 1)};

void fragment(){
	vec2 starting_position = (UV - vec2(0.5, 0.5)) * vec2(4, 4) / zoom;
	vec2 position = vec2(0, 0);
	vec4 color = vec4(0, 0, 0, 1);
	
	for (int i = 0;i < iterations;i++) {
		position = vec2(pow(position.x,2) - pow(position.y,2), 2.0 * position.x * position.y) + starting_position + center;
		if (distance(position, vec2(0, 0)) > 2.0) {
			color = colors[i % colors.length()];
			break;
		}
	}
	
	COLOR = color;
}"

[sub_resource type="ShaderMaterial" id=5]
shader = SubResource( 6 )
shader_param/iterations = 100
shader_param/center = Vector2( -0.5, 0 )
shader_param/zoom = 1.0

[node name="Main" type="Sprite"]
material = SubResource( 5 )
position = Vector2( 512, 288 )
scale = Vector2( 2.048, 2.048 )
texture = ExtResource( 1 )
script = ExtResource( 2 )

[node name="Panel" type="Panel" parent="."]
margin_left = 172.0
margin_top = -141.0
margin_right = 328.0
margin_bottom = -23.0
rect_scale = Vector2( 0.5, 0.5 )

[node name="Iterations" type="LineEdit" parent="Panel"]
margin_left = 87.0
margin_top = 8.0
margin_right = 150.0
margin_bottom = 32.0
text = "100"

[node name="Label" type="Label" parent="Panel"]
margin_left = 7.93649
margin_top = 8.06351
margin_right = 86.9365
margin_bottom = 32.0635
text = "Iterations:"
valign = 1

[node name="X" type="Label" parent="Panel"]
margin_left = 7.5625
margin_top = 47.625
margin_right = 69.5625
margin_bottom = 62.625
text = "X:"

[node name="Y" type="Label" parent="Panel"]
margin_left = 7.5625
margin_top = 32.0
margin_right = 69.5625
margin_bottom = 47.0
text = "Y:"

[node name="Zoom" type="Label" parent="Panel"]
margin_left = 7.5625
margin_top = 63.25
margin_right = 147.563
margin_bottom = 77.25
text = "Zoom:"

[node name="Label2" type="Label" parent="Panel"]
margin_left = 8.0
margin_top = 79.0
margin_right = 149.0
margin_bottom = 110.0
text = "Z/X to zoom in/out
Arrow keys to move"

[node name="Line2D" type="Line2D" parent="."]
points = PoolVector2Array( 0, 15.625, 0, -15.625 )
width = 1.0
default_color = Color( 1, 1, 1, 0.196078 )

[node name="Line2D2" type="Line2D" parent="."]
points = PoolVector2Array( -15.625, 0, 15.625, 0 )
width = 1.0
default_color = Color( 1, 1, 1, 0.196078 )

[connection signal="text_entered" from="Panel/Iterations" to="." method="_on_Iterations_text_entered"]
[gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              GDST�  �           :   WEBPRIFF.   WEBPVP8L!   /��| ������I���dD�3�����?���           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/image.png-2de165adb17dfebcee8a7cd6c9833936.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://image.png"
dest_files=[ "res://.import/image.png-2de165adb17dfebcee8a7cd6c9833936.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
           [remap]

path="res://Main.gdc"
 �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG
      application/config/name         Fractal    application/run/main_scene         res://Main.tscn    application/config/icon         res://icon.png     display/window/stretch/mode         2d     display/window/stretch/aspect         keep+   gui/common/drop_mouse_on_gui_input_disabled            input/zoom_in�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   Z      physical_scancode             unicode           echo          script         input/zoom_out�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   X      physical_scancode             unicode           echo          script      )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres          