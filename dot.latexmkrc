$pdf_mode = 5; $postscript_mode = $dvi_mode = 0;
$xelatex = 'xelatex -interaction=nonstopmode -synctex=1 -8bit --shell-escape %O %S';

$bibtex_use = 1;
$biber = 'biber --debug %O %S';

$pdf_previewer = "start xdg-open";

$clean_ext = '%R.run.xml %R.synctex.gz %R.auxlock %R.ent %R.lol %R.vrb %R.nav %R.tdo %R.xdv %R.lox %R.snm _minted-%R';
