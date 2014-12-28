" tagsの設定
" gitのルートに存在するtagsを取得する

if exists( 'g:ctags_auto_enable' )
    finish
end

let g:ctags_auto_enable = 1

function! tagauto#set_tag_dir()
    let top = system("git rev-parse --show-toplevel")
    echo top
    if v:shell_error == 0
        echo ( top . "/tags" )
        echo join([top, '/tags'], '' )
        set tags=top
    endif
endfunction
