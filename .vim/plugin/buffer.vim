function! s:BufferList()
    set hidden
    buffers
    echo 'Chose a Buffer to Jump to: '
    let marks = nr2char(getchar())
    redraw
    execute 'buffer ' . marks
    set nohidden
endfunction

function! s:BufferKill()
    set hidden
    buffers
    echo 'Chose a Buffer to kill: '
    let marks = nr2char(getchar())
    redraw
    execute 'bdelete ' . marks
    set nohidden
endfunction

command! BufferJumpList call s:BufferList()
command! BufferKillList call s:BufferKill()
