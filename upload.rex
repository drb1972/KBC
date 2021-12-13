/* rexx                              */
/* Upload Cobol Program to CUST029.BRIGHT.MARBLES.COBOL */

'cls'
call read_config
call upload
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
   say ' DEVLIB  = 'devlib 
   say '------------------------'
return

upload:
   say '' 
   say '------------------------'
   say '  UPLOAD SOURCE PROGRAM 'program
   say '------------------------'
   command = 'zowe zos-files upload file-to-data-set "'program'.cbl" "'devlib'('program')"'   
   interpret "'"command"'"

return
