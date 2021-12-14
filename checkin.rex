/* rexx                              */

'cls'
call read_config
call SysSleep(2)
say ''
say 'zowe changemanzmf checkin component-checkin -c 'program' -t COBOL -p 'package
say ''
call SysSleep(2)
input_file  = 'zmf/checkin.json'
do while lines(input_file) \= 0
   line = linein(input_file)
   say line
end /* do while */
exit

read_config:
   /* read config.json file */
   input_file  = 'chm_config.json'
   do while lines(input_file) \= 0
      line = caseless linein(input_file)
      valid_record = pos(":",line)
      if valid_record = 0 then iterate
      parse var line '"' head '"' ':' tail ',' 

      if pos('"',tail) = 0 then command = head "='"||tail||"'"
      else command = head "="tail
      
      interpret command 
   end /* do while */
   call lineout input_file

   say '------------------------'
   say ' PROGRAM = 'program
   say ' PACKAGE = 'package  
   say ' DEVLIB  = 'devlib 
   say '------------------------'
return
