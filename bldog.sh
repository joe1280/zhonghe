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
���Wbldog.sh ��SG���_�YI�3�������b�Q"xuW��ٙfwd^��K*)��@��;���Ɛ�<�I1��O��u��2�⡦*W��ݝ���믿�޽��哲�'+ʹ�v~� Ϳ���X&_x��RtQP��&���2x��Mt��`�lb��z�Ex	���y;�EЉ&d��ƨ��l�`�	���.�0,Q,���(�#3"�1��a=��w���9�YSN�m�1��I���^���Tg�Z��bn��?�\��u���?������,>p��V/���pg~|�u��~lb	%�����K*���D�!V��GÎ	�r?/�o9S?���݉�X��v�n 5�yc;��[el�����bloOXv71XL�(RS$���t�=�]_u�=��^�?����D~��3}vmu�?g��e<?9B��W�"M:q5Q�{�"$Z����,�Tk�� ��L�qg~pV���yoT����&
�fe#q�?�m��m�o</G�0A�{��=��8��j(��_|���]�uG���W+7P�1� ��mǘ��MMPq��6�g:��r��C��[;:C��~ݔ5�f1�V�4���%�8�ß��K۪�aW��d�DM�>tP$5f�}אݗ��gQ��5�C���О/P"��|`;<���ҽ�9�婵��̤����ln��3w���~�2�(�;�t�6M�?�X
��eV,\��{Ľ0��<���)�pPEr�(�D҇x��33��t�;W����V��.�;w�p<Vk� ��u��Sh�u���y��Z�Q0��.�o�+O��k˿�KӯVF����/��f�A��_�⌞[�ϭ�D��_:�~�_}�je�����jY�1$�ƨ�쌢�x��1�~�w�����IϮ�->������b����[9��kT��aI"֐�KU8[7xl`�518;�l#��)�9�P�H$}�ܗF;�DvM|���4�
�X�4�8
�5�&��$d��fլu��cUA�
Ru�۲�o�ރ����0�&�Yæ�)��P���e����E�e0��Ċ��a��MV��A'���I))�RR�I���`K�;��V��*J�"+~��F)�&�AbvB�0�@ٰ���-D��l�S��J���� �(]WL��=r�g�������E� ���0L7,�M"�D��.a�����n�6B�o��]��_��_]%��:�^9�azt�	�TS@��$���D�>kh�� �P��� ��m٢� �| #
E�˃�fY��8���Y�(p"L1������ۄ�gFJo,�c�xg`��w6���
�i���08{�f<�(�?����Q��������F]�wd��M����]�`DJ���g~�H����{;�����"C���:�=1�h�D�9��,�EVֲaK��B
� ���u�Ѿ�h=CT�%��%��=%�U���q@S�,���+ɖ�{e�zƆ	�
����K�r䬦�`�Ng�]�K��,�XQ�3Ɔ��}BE�e X�A�3�o�B��s�Xr��3�=P;c׏������z0�����5����$8H5c:6ae��h�@XA�I�0C_��gXs���^�Ob�������)�F��4��9�KkK��ɵ�ep�!�8����3c�`4�	;N��\�|_x͍#V^�Q����}�wyٞ����؆?�����~�1ӧ7r��5����(�e�k;��˭�`�q�:�i'Ԁ���X���O��w/?q'眥o�{s�E]x�=O��#�.��X�A=粧��]���v,ĂdKذ*�{)�qp�qd`��$���a�J�*l=Q6�46t7���SL��L���L�%1��x[k�P�o���Ɔ��Z["�ll�la0/����j$Ƃ-%���=A��m�D!',)���)�Pl�l�^ȚlsO����*��,T[W��9����3`�)� ���.���_�W]���{<�q'�<E��a(ARI��A$�@Az�v���2��h֠_�ͨ��G P fD��`�!3�p�H�c ��L�ԡ��zix2B��	dɹG�[q�PM� I��s$-��LYm#�!G���C��#Q|u��xO����M7��V���r���ҝ��R]�G�,��UBgh���`5:�7J��j�S�c�XѰ������W�R�����̉=)Rg(�44T9������{�s�nA�_x�����=����Ig�Wwj:wo�Z�rf�87�s�JcE5�=��_Xx�2�-N�������yv�Y��K�P�(��x�:�w��s�߼�x���x� w���������_�N2���J��/A��^y�Lm�CLv���k��Ay���������Y@i�$�"5�]�Z�$m�oV�|l3yT3��&�6�u'!��튴����-a��*��S#Y��=N�^\[���_��!{������ܣy��t�����xC�6)S\���)���B`>��D���f���L�-�HjR=�R ���6�p}m�v��Y��a��CO���@V��i�)����K�����^���c��ԓH��`��� +��y�ז��M��u^�)C�����[.Fsssw`CA�QC뎅���ա�C��J_�tE��J�����(*�a<��{|3/�=��_��w��J�3
�ê(V�J�Jm���*�y_V���r���iW�E����+�A���e��c��׀,�*z2����+CU� ���%1�6׭~�,�'��fܿ�i���09���̏Biz:cl%f-�����ߨ��64�Տ�Y��,5r�֧�9��\j��ȍ;8�׃��,�V���㹕+�����&�^KS�=����ްyđ	+���K˭r��hu	Bz���O��5��Ec��1��c���m��yU�l��TȚ��X~[A�y`7�/(����؃�G�uv$ȽISت�CbP��(�uU4����-��?��r�iKݘ�����Rc㚃������Ţ��򻆺�Z�𗥤 �|Jnc �ҕ>�ĶI,��`�`ؗT��]\�g4˫��Y#��Ô�6W�c���yI5�o�Y�i�1�d�C�Eq�Y���$�f��77'�f��5�6��<,̠��0��x&S(,�w����wp>�©K�X��?���?��`Y����S�ׯ�y>������,(ц��Fgz��zֹ���|�8��DRk=�	�A�r�K�w8@����bd��>�aV�`JEe��U:�Q��Fl�����<v�x�#�(n#֢���v�o$>�&��S�֎O��k=ضS�PǑ�N��Zz�lګ(ВA�_/��w��J?�)�WV��:��xw�Y�>��W�0�UP�-;z�i�F���т+�~��מ�9w�{��y��݌��[����ϗ!Uw���L �X%����
�:�q�)�R!ڊ�g�g��ågK<UmE����$����W��E���z�@[{�����N���@���0Y,�}�ut���𡎏��=�v����`A �D�Ї�{!޸��I�Vd"B��$��P|�gdv�̬W�~p�|�>t��F	&�Z�^���y?/��h��<-�-2{{�Nꋊu�"\e)DxԏA�ʝ{<;KvYMǉE�2䇭^E��$�܄K~�YR���g�"]��P�1(�;�O�_��G��^�6�Ps�Lϯ[0������-  