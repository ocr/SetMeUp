:syntax region crestStatement start=/.*__Crest/ end=/;/ contains=crestLineParams
:syntax region crestLineParams start=/Crest.*(\d\+, \d\+, \d\+, /hs=e end=/\d\+[),]/ contained
:highlight crestLineParams ctermfg=0
:highlight crestStatement ctermfg=6

:syntax region mirageStatement start=/.*__mirage/ end=/;/
:highlight mirageStatement ctermfg=6
