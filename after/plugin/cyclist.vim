call cyclist#add_listchar_option_set('limited', {
      \ 'conceal': '┊',
      \ 'eol': '↲',
      \ 'extends': '<',
      \ 'nbsp': '␣',
      \ 'precedes': '>',
      \ 'tab': '» ',
      \ 'trail': '·',
      \ })

call cyclist#add_listchar_option_set('busy', {
      \ 'conceal': '┊',
      \ 'eol': '↲',
      \ 'extends': '☛',
      \ 'nbsp': '☠',
      \ 'precedes': '☚',
      \ 'space': '␣',
      \ 'tab': '»·',
      \ 'trail': '-',
      \ })

call cyclist#activate_listchars('limited')
