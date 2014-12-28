scriptencoding utf-8

if exists( 'g:ctags_auto_enable' )
    finish
end
let g:ctags_auto_enable = 1


command! TagGenerate call ctags_auto#generate()
command! SetTags     call ctags_auto#set_tags()

function! ctags_auto#set_tags()
    let s:tag_file_path = ctags_auto#get_tags_file_path()

    if filereadable( s:tag_file_path )

        if &tags == ""
            let tag_list_str = s:tag_file_path
        else
            let tag_list_str = &tags . "," . s:tag_file_path
        endif

        let &tags = tag_list_str
    endif
endfunction

call ctags_auto#set_tags()
