# Ref

- https://github.com/pandoc/lua-filters/tree/master/minted
- https://pandoc.org/filters.html
- `man pandoc | rg lua-filter`

# Compile without Makefile

```sh
pandoc 20231159xxx.{md,yaml} --lua-filter minted.lua -t latex  -o 20231159xxx.tex --template swfulabreport

latexmk 20231159xxx
```

