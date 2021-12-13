/* rexx                              */
'cls'
call SysSleep(2)
say ''
say 'zowe changemanzmf promote package-promote -p MARB000101 --pl 1 --pn NORMAL'
say ''
call SysSleep(2)
input_file  = 'zmf/promote.json'
do while lines(input_file) \= 0
   line = linein(input_file)
   say line
end /* do while */
exit