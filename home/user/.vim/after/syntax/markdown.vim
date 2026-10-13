unlet! b:current_syntax
syntax include @Toml syntax/toml.vim
syntax region tomlFrontmatter start=/\%^+++$/ end=/^+++$/ keepend contains=@Toml

unlet! b:current_syntax
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml

