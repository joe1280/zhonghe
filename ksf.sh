#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�ކ�Wksf.sh �;ksG��5��#{#H����QJ]��]L���咱Ԗ&�3#ۂPI �&��$!�'�Y��x�/�4��)���3I#[&��
���>}�������S���Rݒ�G��_����3��˵������_�}�~������=�T��Q}�����B=�WWo7N�iv{�v�R���ڝ%�����i�fT�h�J�2�鲙�4�$n��z���-[�	)�Dv�IFJ�K��9D�H�z��r�d��K^J�l�,�:|��)A�%�$ǔ� ��V^�������e��٬��F!���Ν��z�7y�B�J��.C��ܜ2_��!�nm���vC�C����@���V�ʦ����H��|�D���d�ͽ/�s���ڕo��G�\]��n_�/��oܯ.�Z��a����r>�#���Cd�1.2���k4�%�A��b	$t��ԙ���Hϊ!� ![HŨ��!g�Z!���]`�c9�3Sl�B�Ա�2[�DD�E@�t�U�c>ҳ���fjn��G$�n���a�H�N�+m��ʳ���D�B���ݥ��i��?߃��x��ՙƗ�+���N�U���F������Z���lǚ��U3��Qs툞=h3��"�^O���3S�3umL�%ϳ�I�ޙN'w?o�洦�l*OM�r�f�=�uQ� sʆ�5�<e.�R�^�r��!�Ou��q)qhr<�Wu+���[�߫��fS^�d�G�v+H�bT��u���H�D.�v���Dv� ٠�u\ehhpP��b�P1��.RO��f��A������W�c�fgS�v#�}H�d�U��ust
i̦ xʗ��<P�j����GuK- -��p�.�F�
MHʯUƱ,c��GdU�e$PV�ԍt���M�_[���Ų�Cd=G5�i�(n	*��Ts�2�}P@&@%��E�»�@�ղ�e�3P��9���C	NCA1!A�i��2���8�a+t�`>��fġ^�1ɀt�����𴼊E��@��&�)I6i��c��=��_2CCo��EX)c!�=���vIn|r��=���/��4y�-�B���O!/�$�,�s�V��0j�d$x�T������-\�/|���ӂ��?����O��^�K��()����d�᥺K[��?`D=�@������WN���IӚ'�	�.{��B����dr���W�����N��y������&r���k�@K��C���*����d�"�D�R �]\r��T��wj��ފo�u���j��M�'�����T�r��t���=��B��[4�S�l�T�~��?�}}�É����!`=���ۘfA|���E@;4���}G��ID 0` 8v���u2o�Hų4��`��]�0*.wa,��_;�צ��E�����&��ۧߜ�ή}�E�9.�
`9��Ë��78����[q=j�=���e15��-]�X��i��R�]c81�Y��k�Η��2�N�M�Aj�e���Z�M�_hV;��E�%ˠX�#��2��mІ�hja�wx\��A�؀��S
i��ŊP�$Ɉ�H�<e��{!�[�誂Y�I��'�Ku�Y_vY��p{��QQ��t�؎��Z�����\y�66b�(gߊ�c����Tb���Ŧ��^�=x:6o3�\���"+L��+���ꖺ����^�-^O��I
�B���=��G�[?�>���|M�u�P$�Y.M�[q�m�`V�a�=8)�����m�L���2�sd�`8�`M��UT]��M������-Wc��L��͖`uƎ'�O`�x2�BĦ'�Ԧ��P�6
��G]�����K�#־^��-h!�1�G��-'fj
|�fؖ�q�3Zj�]Lʽ&��{E޷��dDˍ-�!��u^4��W�%ʋe� ��)�X'Hلh���"'B�m���P>�6Z�µ����f"kg.�W�jY_�][BisPӚC瀈�\`As�)���)ʟf{�͕�J &e 4��';e�J�Ztap�Q�k(p�<��G���$y�%�&'Ϗ��$�� ��S_T�_�4\5y8�G�QǤ ���|c ���X	��Aa#X ��ٯ��y)�׺�Ċ?Щ:2��e�n#��� �� ��J
!���A�l�JT��Xx㷌leC�CI�z�����@�-�s,݅��0a�����CI	�z�f���QQO�L2���UFQ:V�<�6-�t�
 J��p ��{����XĴ<������]�p��(?
o�"N2�l$�����"�� ��U�5͠g�	Q@�αN�s%
���Z6l��`��6��)7��x{ePh�jP�������$� �4�+aLv�t!LWiR��p������xЊ�ޝC0�5�Q7*I/om�4!&+�	��N9Zw��?/��lN�yܨj�(��LT�C��:Q�����74��g\�Ġ.�	�L�r3ܢaN�ё���N���"���DA������♑K��gw:�dt��v������,���(������l�ZF@��%Ã;�w���M�����`�ݗlw���ޯmeh_Y��������_���_��@���1T�"��[04��	NU'����|��āW�@h �l�ۜ��0�-s6C�w�k�����C�{�n�;d���aX�=K�
�y��6�8�8�{�0
��,X��o��	��w�ޛ;�C�����Mu؞�x�{l�4��^kӝ7>��{��hmB���w�����'&_ݻgۡ�����.OBL�:K����V덶�U9���s&�D@H̥�?�y��N��1�����E��W�PK�C��<,ɏB����[k�~���Y����Ù��ǞЇ��j�?���7Uw�T�ٍ@A�/��Dƹ	��蜅"v�aEj��98��~H'c�>�k�~_�r/�������eO̰����&��9�,7�2�� �4�:"G+ˍ��O>�_���\d����Tk�������{���~�N�-Ԯ|ˏ�g8�Ɠk�.���w�gUW>�=�Iv��_Zj|�Au�+�Yvj�H�;��TT��4*͸qnri�� ��E�A-'n^�t����X���Zui�~���|��W���:��-���H�$��r]=xʰv��@?n�(٪����=7}Ğ)�]���I�B뙕w�%N����.vn)p"�����b-z�ź�6�VI	7���1#�l�$�x$�u9��~0�i� �Q�8-�O�UW���tm�LU�.�n{��=0"���6��	���s��S��\!��m���A���Y�A�y�U{�Tz�V�t^U���y/t�cg'o.6�w���d�4�ޮ����z2ޜɶ�2����[�����*CP�k0�Y0V�+Z:4��X�X�88��Hف}�A��@�p�%�.�1˔��oށZvi����o���/�Y�#
��;��$5��{r��9����+D����$d�f�gρI200�D�z��?�3T�y��h�?��dFP�Ԇ�,�!2=ݕQ?]t驨l��kj��-�_J��j�'3;
�"1h*��T|nn�����Wb�`�*�<(?�J�ԱY�[@�S��5OC�|�8O����ͣ�S b���9��?���'�X؁�(v�B����i=����}1�{�~=t����4�>�zA
� O�=�B���t�����#���D�~3^�	��_�@vxFh�����wĶu�#j�W�n�#{�^ ��I��6O�w�=�J�g�-�������>��d���^�7��M��s���w"+=8F��PF����,z�X�0q�gC��nzh����񕟧̪�7��fW%�������8������=�t�g����x���7,�36fo�1��x�v���_��Y	b�e�N2��Ϯ}t/�-�b�r��hy2NC��n�M4|,��%�d��T&'��5���P �I�}�X]�������'��4���4�o_��^�o�C�t ſ�~u�\u�2�6On5�^���TW��>�\]�����ʚ^���$���P]���[�.�j��?�]]����8��$���Gʗ�@��ƈ|(���0�	��-oo���9�a	]�
�ѥ[˖�])����",����˿�����W�+_�ؓ-���]107r�d̀�%|<��"ƌ	�
�i�L$��o0�� +ȣ薻�Sb��~��lKu�^u�BuiS[BN�ծ^��\������`������V��4��h%%�
)����B�->�d�V^+_GB�� �0�M
S��K��v�4����6����}$LVK�d-��%�+ǋKf����g�(E
k�E4�%���<�`	�l�����3�FV
O$�t3t#���%�=vRrit�r�wT\G
)q��JSQښu���3362��b������;�C��O-����Nv�ɫ�b�g��������C��G� �1���ƹ� ���*C������l�ՂYN�'jh�4�Zm,��x�5.?�������ե���o"i�f>��Sp�l?>�ۓ��)m��"�8A��V�N���<޲���lff�Ԍ���9�}�(��0S�3����`H
���o��,�Ol�Pk��K�y�����R�u�x��=W�*�q�.��d\;&@I}t�M�N�k��,L�Fm�
7���O���"͌��E�if-�sQ ao��bj����gKA���b	ޘ����"~K��y���Lr�0�'/��B�1�,�Gr�:D����gy2�p�[uR�A� !��\Zфj.J�9�sZ�c$�9��d[3Y�\:� ��Zo�ܝ1��L�Y�,<6��������}s;��n6r�E��l:|�^8���H�3�N���i~&��l���S�
{��{���צ]���`�qˤ$�n+�ܡ������"���{�&&b?�ܹ#��4�Yv�S6ӂ+|����Z��mԬ�����I%G�Xs&K�1�)�PI��2�Ƣc���a�S`������L:�j]d��( �:�: �/J&��q���T�����;��˒De�x��.���)�j�3(��E��l1"	K����&!D@Gؤ��!E�;�a��ɼq�-E9F��|e�t�5�xb�ٷ�4fA,E���w�����qz��$I�KԹ��H*I�:a�T�H2�? ���d�d�m�O�;E����es�>v���Ea��{�� o~�܋Ȼ���`�(8�M���ϙ/����&��c��u7�|������g1-6Ɔ�DtQ��]���7{��}�G�	a_2:�ᐦ !��YP��Ȇ"�MI�%|�����{�9���2����¸��=���In`��R�:6]:G|��G�cF�������,YB��'7�������ru��ک��3:\]�������sk���C�TD!��)	�����qj��yX���$;GJ����{O�Ց�ϹE��{$>�03H�p�MHg]�D6��}';0e>����(�+�(�ht����"��۹3�O�/����}���;�@�ރ�$s����������ǒǃ��gb�V�9�$l|��$�{Ws��}<�b|��^]�
��������hG���?����R&�h�|�����=	�����m�i���ɗxA�����Oś��5��A�.�?�4p,d;��1���!���t�>����r����{�{U�F��S(B��k�l�[eM9��2�j�݌#S��ݷ<U��X�0FnKt��Tj[6���3�4�>(|�-�A�{DV���9����Z?��S7ƧJ�0Kc�w�����f Oj�:B��}Z��'ŉ��E�hT̳��+^��ߟʿ��\�w��Z^�w �rX��cw�&L���Sc�����i�G|~��t7���)m!"���c���LF�ށ���Y�]^�߱�h����W�z�N�]�=�4M���O2�k@1C���O�M`~�pf�W"n��g� ����L Fa?>���ί/�>/\[*L-X+W��s�;c��T�nhi��>m ��k���rHA?⠰~��k�#%6
<�:�g��t��?u�>ʰI�1��䈛��/�j�e骠�B�4{�E���� ������'{�8�>p������C�@�����P�Gّ�lwp7�>�b�o�����ݝ�wv��~����F����g�HWw����O�� ��!�Ga��~��~CX�
9���&۱H|ڿ�@�~��U���HoR &~z��d�2����M�΢R�kU�Uܴ���i�U�p u�_��=3��u��C�q��Z������
s�ֹ�Nu���jq�6�P�%/���;��a_�b�cH���o77�c���|(��W����*h��'Ҁ�Y���U7�U�bD�S
gr0�l��G�qZFS�c?@͖�� 8G��v8���pZ��h2�*(��pt+}w��i����!2��v�����29��m�
���j�j�˦��Uף��߆]7޽֩vP�|b�� 8�K6�j�E!��Zh�*�N�c0��wA��X���F��  nǱ\t�T,>���d�z��?���ZV|�H攱K��˿��M3̩�ջ͍V� h�p�*�ತ���$���@�+~w�`WW~�l�}���Nm�j�;2,�ή}
w��Ҳ�{��Ж�d@�*���\ķ�UϢ����0@��Y�Ld3�t3~l��c���Z�)�&Њ;P���_�D">	�ś�@L�����Q��E[<`�����/0�´���ήS��|`�NI����~�S?7|Z�e�'�w�H�d=���*3f�E���V���1��i����\Jڣ�b�
��+��Ǣ�>��2m- �ؿ�Z��8��gI'�h�M&8	�g���]]�^����c ���П�`�*�s����@7 ��]�������½H��U�'�=�:%�!����c��O�u$���k�X;k��׍�G^DoƋ�'aGM��8]��j3R��[n.=����e(H�K_��/��W��
b9�W��7���<����]E]����Z�0}cF�~�a�Af$'d)��rL�d����-^}BZ�`w�](P|�j}}���I��A^���W�8�c����,�z��>z:�����:L�٨��q�>3?�8���0�0�9�m��?u�Y �E��v �K�(��v�70��|�Qs�?�GR������j�m�:6U[[6�X�q@&/@��-�?��K�K��@��u�Q]sq#���`�n���=�2�:?���?t~�QǇ,�{`N䂶kD��;��� !���={ܗ�d��N$�oE�hB��`�$aib��V�<ky;d��A�T�nb�F2qq�7
��BK���v1r�6�Fۍ��FAF�����W0B&]�����4�%ci�J�-�u�3s#����J��ѹ�l��-�]���7���=�����hF���E�[�>�&�C��G^o�5��XU��v�9oF�j�͈~�nU�u�W]��զB����y��<� A+}���[�K�-���9l�YE+�w���Ç;���I��ߡ���ߙ�zҿ�j9p�7�)�|�e+|`�v���W�����dz(ez(>ă�כDjc.=ã;T[;�F^�F*Pmćj#>T��=U��gOn�m�j���ؼ?;���ώo�R]h�h��F��ߡ��%�ώ�U�츇�m��F�����ߵ������s��iy�z�l_�5�l_l�4��]ͪ�wh�v��Օf�b4k��F�����ߵ�l����h�ׅf�_'��d����iwx�v�E�ï���4�E��>&07������4^��1z��T<��c?�/�ԯ?�]�t8D�����_�V�`�T�
vul���0l���Շ�:�T��4��L7937R�]�T�2��2�W~�L�8�Pg�g|UC��S?�ڎ�S��Sg�u��z���G�	):�Z(���	E�N�A�Y��oM���*�2��2�@�>��C��+�paD�eC�Z�.'��L��`�ۇ�K��4ߡ���Ld]�L��Ag��e>�2X��nf&�V��c~}�8�8w~K&B������\<���{]�=5ǆk�Hc���`6�K��X�Ⱬ�;[g�D�)ǆVV
�0aZ����f�l}N?�}N?|���K��3�ё�o�0�Z)TG�z������n�>�J��-V.����
H��h��Ωl��IP��K���#I������T�m�6m	o��37W]�e;��ޖ�kc5�����
�۱��l<�	xR]8f4�Ң�36!3�C&�R�,�D]�}i�ܧX���ݭ �UK=��ju�-�l�Q�D���5n�_��Nm��v���K����	�\�W��d�'殅�'z���`u�	'���Ro�/�F��P4�C����t��T:�A�#:���HtD��V��C��LTdM��_��@��D�>;��olC5��V����zI��a���1�E������+�"-������u@����󍬽]�0���-F
c��uqɚ[�n���(��f��@qa�8s�U M�'�T٘�q��]W%����ë
UCV��Ϭ�)�Z<��+�"&�� Bֺt]�Fh�Ov%���L�Kk��w����9�C��(���޷.>���A�~w�����G�2�ۯ���>�?_"�>��҃�h��@�i��L� ��-�ϔf�Y�Ι��7>�Y+|���/O�3&��=)�|Z���2�j[��Z�@p��a;�v(������Sk���������la�r~e��d�L�hR02�Oo̍���;~K�F"��4�fT�P~�Fqr���v������K�g�����µ��� ���4v���`WkO
yQs�D_�N<�|�`�ﬕ��y
#2�h�=㕄�xt(ZcP�h���A<��������4����f=Ҙ)3���%$�� "�`�4ج��f �x.�LB	 ��Q�Q�sU@� +��T���?�=U �n���ZU�������]�� Ī���-o�Jet)��"�V��1z��TH�t?�Ag��kJz�l�wM�3��ڟ�o��POϷ������������#(-�� �Ai����� Pj���B�ぽ�)��M!'��y�?��]{¤l�/�0��2�22sf�/���\<�a58��5��/2'�:�a�*D�I�,ص��-6��g�Q+΀S�-^Y���&��#ش�6yźp�,vVD��E!*{y>����6�Uk�I�Mri��A���M�=79L���M�j���Ir�&��$U4���$�i���M���Hi"��N�Ģ�̗/�xE&��ɂxn-u��ʣ��\����0�t�V�޶����kJ�� �ͧ���KkkW^����5�|��tv��r7���|1a�쟆�  n̞������>H���/�W��k�|q��T��΅9������a�@$�a������@���O�`-���R��n~]Z�_�_(-|�@���+��dV��<<vm�p����^�%
[7��qu���5}ۺy��񇓬����v�fo��.�]���Q<|�-�?�C�P�p�Ji��쮵�%܅� �[Ͼ�)�i��oر�?IpA4Cq�ٜ9����9���j1��]N(C�I�6R<C2SZ����E:����ԣ�«��p&ޛ�#X*Z-`��d���]PE�2�o����y�2��Y7�,����w����ҁ�*�5b��o���W����������ٗ��E��Q�'���I;Cp�ѩ(���q�r�� <��.����a3�-�rx8�*�Z�=#@��L���&AiM��Tf0��u0�0���� ;ڸu3<������� S�e.�+d�ts�˥��yd2K����Yh��?bc��C����F/=!v!�b��oEb��o�&��!eyG�)�!�C�b�7	 ���`�/%���;	�84L#���l�j	Z�ρI;�����S�X��bl�}�I�Vzz��uk�4?�o���y�#�	�l�ڒ���}�[�`��͉L��e�ghqh�L��O�ĞR����gրӹ��J���\$�)����1�T[&à�m��d.Í����o[�EU���}9���D�6�����Y���j~yf����m��#�Sx4ϓ�� Qb�&��=ӊ�ۑƬ�3N��K����h�m��m=��Z��x�MԃU)8PG1���P!-Sr�W4�a�)V�8�y�&rݧ'7�_�A�G��Lb�L��A�u\�?{������<� ��`�L�LZY��|���K��n�[����������6>�4�Y��Q��P��_\twg*�`�9(�7l5�ri:jX9mG�T-�4��t4zS�f��6]���R��گ$K�=p�'7�U�gg��]k��M�ji���B�T��~�*ҷ.;(U�TZ�K�������ٞl:�`"��۠"��w~�|G��W�Kih<��,�� �Y��\�C�w�S�;�3}�p���L,I���6�0	�l��Ǭ�l���	G�m�wl���g�${�J�1)!�P�^H���(�Z
������+�BH��&���S�ɩ�`T��	���i����s� ����d^����P?
_}�Q�a�x�a�Ȅ�]ų���Q@�m�zFymr��~:���0y�������U�-&���Lf�ǐ���d�F�-��@m �C�M��c'�=�f��vS�+�}�� %�ԙ�hV�Nz��4 ��eh-۔��,^�I0v�.)b�,�Tˮ�v
�����`0(N����u��W1L�e����%n�+�9k���^g�2?t��|�b��3?F���'h��tx}њ�O���f<��F��&P@HŠ61(���w��R�G��z3��k�E癢�g�*��� ��6	wr�w{��5�J��9���<��ue�]p@�۳'d��=w"Z�O{C{C�:��='�)`��!G�r^�1�S[�X��&��ϑ'w��9���a�;	pㄴ���1��@?���2U�� ������M��S��ȀBe[XBJ�$)����a���rI��Ӛ��_�jƏ��.+R�(�)�I�囶�	�g�R�B~y�/Y6��&y�=	���L��&��b���J�".�j�����|��wF�X���	��|">�m�S!��gj�K�"~���:-�%�����t����`��dTW-�\yM��n�$��j��_$~����Vj��^�	���k$=8��c��>�̯�]ڞ����g�@/��Ÿ)��3�iIt^��T0v,ڳ�:]^�&���'#>��P"j�+�oj:v��.�Yң�,����"�@<�YQ*����,&K�S&>�ށD&�x��@"7�Z�Y2h=�p(��SY��5���or� X�h�Es���
���#;֛>��m{��w����޳y1��0��T�/��h���Nk�f4���'��/GB��.Y��C�9Μ�N��hn0[!{��nRA~��ɯ�?�b�{3��1��p$�E4@�2�}ً+�`2�dU�ʳ�W��!�-�WBjnC�$��z��8�L�"f���N{����Q�.��Z~��4P-�գl�s���&���G��Y�D
�T�,Y/Nq$*c�'��xpe1e�L�ͥ3>�ôR��Χ؛��{x$�Ӕ9=i*\�)~����fR���˰�%��s�mH�E.X��Ox�33&�q�w(���[�G���ǋR���(������x����|]��䵵J��t�U���&��	�l�;��+ڄ]�:���<%Ɇ�#��J�uݭ:�Q&�r��@�p���f?�p�&�����{�n��
�M,���������*%�$`��M�5*�x�rt���m\��q�
�/���c"���2Z.`�v�,�>�=z��0��dOK볰s��^x��Ƶu~=^|p>������'4���ԙ��x~y��n�T~u5�v�pe*�6�q6�&�c@��Ifu"�2m�[˯��c��/��kw�ˋ�g(_���j���#�;Z����a��>{���#F�[���+Z"d�-�W
�-��2���twu?mA���bE*��Zɤ����b�8J"cōN8TB�G6-�OIڐ���)�H�5��*�K�;�O��3��7�;�ي�J}��|�_���3���e�s��)�<5���*����,:5�%R]$�~�^�X[v�c�}�n�Z�}��@�w[0�չ�����'�˂M���%&��2�%���S�o;���
�O<�����=�&y=8�h�ޡ�o�'R�1��旇m��E����T�����Ij���}`Wa��K�/�e���� av�YL�����{`;�8��:u�6*g����D߿{��sȫ��0	'e���PǑ�9n�'F��e}؟
�Xh0V7�fM�e3W!d՗N��wSj.�@�J6@$�h�u�P�}����h"!��Jv.���N�'&��6���!����u!"ވ����=�ޤԦ��R�F�ρ2e��*�ўP5�����f"oTx�kit���n�W=���T~�,��k��)�:�Mm�8�Ơ}[�~[�����;��B$lH�c�^�� ����&p�ꆥ� '�e3:��D2	�6M'�	6ME?��k��H�Y��a\��y��ΰ�x�i��Χ摂s�K{ޛ}����Rx1�j����m��h,�%%9[��Xtz�?�e�K\cM�ѱ16�������$c˅�D ���V63+� VI"����˰t.v0����9�l��F1#��d�e�[�|�����?����Pn�����Ȟ��68�+�e�I|e��'�	�@&/M3�vT
L���P8�y�%}Q��p8�!z�E*�f�h>�C ���KN1R~a��%��v���{��銞�6�4���*J`Bb�FT�G�N| �	������^~kS�n�k�s��1������ʰz���W�0�s2~!�P������'?	L��8�m�G�y�kc� ��ߙ?�)�,�W����� r4_=�̯W��Ў��%v�%�-	߲�-.��H��Bai��`C�D������L2�	��.}�%5�za��7�w��{⸧��{�+	�i�����F�L�G��5�w�lP[A�毬��4��#�(.��ǵ#�<aq8�au� �i�O$�mzR���쨤�SG������&�W�yp\�8���:?����#P�"��;�o���#"#AB(��|хDtA��J����X��+ZJ���f�TǍ��n����e� �,y�O��y�c�l�W����*�
����	��Q��|�k�3N�[�G`&����u�i�r��P���k_ꎕ� �F,�1]�&̼wX��:����BY&B1+�e>{\���քF�Ҹ�Qzм]j=�p9�?9������h|_a���������ۑ�P�͵U�Ҿkzw���M< �K-[鴝
TԡZJ� �����c��\��8�7_�I :ĝ���L���v�{��_🿋�  