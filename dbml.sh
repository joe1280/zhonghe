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
�5m�Wdbml.sh �VkOA���׵h�i��*MM�&��&� 	���/w�W���4��!�J����F�<��tg����춅
h�$����=s�>��~n��9���{=��ݸw�ņ-��?�$�/w^�}� _5ԧ���F¢�A�X�3�8���p�6�`��D�x��32�e��r��罞�`�z�i0h��>�$k�K+X�� ���|�'b`��u��S�tի逶 W���c�������oF�jnK�Ih��$��l��J%w�~<�^t��U6^���J��E�����V�S�_��{��]ugyk^�55�B��4�Z.��"�%���k�~*[Q2����Ug�Níc���ҷ�>��v�+�JR��+��N��'���:�C"�xiں���>KPsq���N0?,�oh�K���3Aw7b^�}8��67�������sO���V��S	ZP���PY��}[�ˇim�p]D��2�ʩ�{<K2SJj��Ii�Ie#���kُj.A>e�1$|�����jc�aT\��"�B�T&.8l����@ ��>Y�v,aq{Q�x����z���Q��ǨߏL,�{]v�F&�����%��z"�Ymw�(���"I�%I4�� ���_�|-!����S�	2��,�
�fhƨ�7�k|S{�),dϠS�2<-�B4I&�	Ő3�i��:ji���v�쥚�j�������%ӫ��֜Y�o���n�^��V��7J<A������P�"^���2V�e-`�u��?�^�qS��f�)�| ��f/h(IrBI��\Z]�>����3���Fa�g�K�hZ��$��sv����ʒ.&՗��8QJ*KI����Z�p�|<��H>��{�0�
�~����	�)D��/G%��d�I��ڝ�sO ��KO�=8���I�Y0X����QWo�9� �>��
  