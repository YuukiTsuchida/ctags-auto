scriptencoding utf-8

" .gitのあるディレクトリを取得する
function! ctags_auto#get_project_root()
    let top = vimproc#system2("git rev-parse --show-toplevel")
    if v:shell_error == 0
        return substitute( top, "\n", "", "g")
    endif
    return ''
endfunction

" タグファイルのパスを取得
function! ctags_auto#get_tags_file_path()
    let project_top_dir = ctags_auto#get_project_root()
    if project_top_dir == ""
        " 空文字なら何もしない
        echo( ".git not found" )
        return ""
    endif

    let tags_file_full_path = project_top_dir . "/tags"
    return tags_file_full_path
endfunction

" タグファイルを生成する
function! ctags_auto#generate()
    let project_top_dir = ctags_auto#get_project_root()
    if project_top_dir == ""
        " 空文字なら何もしない
        echo( ".git not found" )
        return ""
    endif

    let tags_file_full_path = project_top_dir . "/tags"

    let ctags_command = "ctags --append=no -f " . tags_file_full_path . " -R " . project_top_dir 
    echo( ctags_command )
    let t = system( ctags_command )
endfunction


