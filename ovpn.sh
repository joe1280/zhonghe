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
�vZ�Wovpn.sh �X�NG��>��-I�J���`s���Tj�
I��R)/��'�K�U�2	NmC 7��B��pj
Q���]����W���ۻ8��
�3;3���6'�㯿b��!��#��ޫ?~�V����~�Q�<8}�{l�T]�]yK�pT���j��F�:�k�Q��������ރA^�(F:Y����v�P��6�&⋀��`�.��}�{]��V�;6�㶣-辨G��j� >heM�;,�ǋ϶���I��/pv��q���J4��3F���p��s�0S��O�L�� �\%�r+���������������.[=T3�����yN�彏� ����g��p/�z���b���S�X%$Qbe�x*�IKc� ����/qۛ7o}��m����}Z~��_�t���nh!3�{�R� ��PE����/���w���O�h��3JV�6��w��*�X�LO�-���DY,e��o|g���+M'%�h;%�N��R>���)r�r��N�g�����K;���?ࣼ�bP�`�q���@ n�}� 7x�������%��=�LF��j�?eQ�	�����]ʢX��ٿxJq��\�����9�[z"|�����b9G�Q�`̛e����Y)�ĳK��Xqn����_T�&���lqa�3��Ob�O�7�G)��M���v�d�1(��'��qPM_'I��	��A�a@;�����Sir�, ��o�x�<i��(6��@OW/��AǏ�ÿ����<N���7�`���?�����Y�i'3z�uj�I�:OA팽���+%��.��G�Gg(g?[��)��,�+(�b�E�@�1Jy���{8��v�(9+m�Hd�5iiO^{�,�-�Qz�z�R�jPŹqr����0h�i;��3[(�#j�6v*�G`:�뜣� ����`�q����Rj=�'�-�k!��@�-�5>$��t2���ja���H�Ԛ�j26����#�`����0�]����*nZc�wi��[���K1{j��q>#��奄`�Ck]ɫ�W;A�����=�*�3�D�bh�&M����z�'�wy�r��Ĳ�,[e�.pNO/��!a�|��z��lh�������m�"5�����`�W��,��J�]�8z�AS���!IGS$K��F��X�CR]c��M�T�K5Eݱ9���s.���`�v��@����h��fy����Q����H���ȝB�Ȓ\�*yelH��9ЫM���4P/h���i:U��Gf�t���4u�Ҫ!AW�:�0�a�2eWZ5d�� ;��V��c#��5C~�#eӰf֡��p)(�ft8[�|��m}}���#�+�*$���~��^`���Co  