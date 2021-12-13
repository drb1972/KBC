/* rexx                              */
'cls'
call SysSleep(2)
say ''
say 'zowe changemanzmf build component-build -c MARBLE29 -t COBOL -p MARB000101'
say ''
call SysSleep(2)
input_file  = 'zmf/build.json'
do while lines(input_file) \= 0
   line = linein(input_file)
   say line
end /* do while */
exit