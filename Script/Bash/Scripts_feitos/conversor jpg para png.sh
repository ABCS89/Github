
CAMINHO_IMAGENS= """local do aquivo exemplo: ~/Downloads/imagens-livros"""

for [variável] in $@
do
    convert $CAMINHO_IMAGENS/$[variável].jpg $CAMINHO_IMAGENS/$[variável].png
done 