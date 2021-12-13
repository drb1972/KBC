/* rexx                              */
'cls'
call SysSleep(2)
say ''
say 'zowe changemanzmf checkin component-checkin -t COBOL -p MARB000101'
say ''
call SysSleep(2)
input_file  = 'zmf/checkin.json'
do while lines(input_file) \= 0
   line = linein(input_file)
   say line
end /* do while */
exit