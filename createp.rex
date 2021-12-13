/* rexx                              */
'cls'
call SysSleep(2)
say ''
say 'zowe changemanzmf create package -a MARB --createmethod 1'
say ''
call SysSleep(2)
input_file  = 'zmf/createp.json'
do while lines(input_file) \= 0
   line = linein(input_file)
   say line
end /* do while */
exit