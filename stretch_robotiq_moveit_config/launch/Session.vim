let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/ros1_ws/stretch_ws/src/CS5478_HomeBot/stretch_ros/stretch_robotiq_moveit_config/launch
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +8 demo.launch
badd +19 demo_gazebo.launch
badd +21 ~/ros1_ws/stretch_ws/src/CS5478_HomeBot/stretch_ros/stretch_robotiq_moveit_config/config/ros_controllers.yaml
badd +10 ~/ros1_ws/stretch_ws/src/CS5478_HomeBot/stretch_ros/stretch_robotiq_moveit_config/config/fake_controllers.yaml
badd +0 ~/ros1_ws/stretch_ws/src/CS5478_HomeBot/stretch_ros/stretch_robotiq_moveit_config/launch
argglobal
%argdel
$argadd ~/ros1_ws/stretch_ws/src/CS5478_HomeBot/stretch_ros/stretch_robotiq_moveit_config/launch
edit ~/ros1_ws/stretch_ws/src/CS5478_HomeBot/stretch_ros/stretch_robotiq_moveit_config/config/ros_controllers.yaml
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
tcd ~/ros1_ws/stretch_ws/src/CS5478_HomeBot/stretch_ros/stretch_robotiq_moveit_config
argglobal
balt ~/ros1_ws/stretch_ws/src/CS5478_HomeBot/stretch_ros/stretch_robotiq_moveit_config/config/fake_controllers.yaml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 30 - ((22 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 30
normal! 020|
lcd ~/ros1_ws/stretch_ws/src/CS5478_HomeBot/stretch_ros/stretch_robotiq_moveit_config/launch
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
