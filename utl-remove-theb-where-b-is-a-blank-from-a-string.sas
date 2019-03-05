                                                                                                                                   
Remove THEb where b is a blank from a string                                                                                       
                                                                                                                                   
Note the use ot transtrn and trimn in this solution                                                                                
                                                                                                                                   
github                                                                                                                             
https://tinyurl.com/y4hxvuxv                                                                                                       
https://github.com/rogerjdeangelis/utl-remove-theb-where-b-is-a-blank-from-a-string                                                
                                                                                                                                   
SAS Forum                                                                                                                          
https://tinyurl.com/y59kc24t                                                                                                       
https://communities.sas.com/t5/SAS-Programming/remove-the-THE-from-the-variable-which-end-in-THE-and-start-with/m-p/540545         
                                                                                                                                   
*_                   _                                                                                                             
(_)_ __  _ __  _   _| |_                                                                                                           
| | '_ \| '_ \| | | | __|                                                                                                          
| | | | | |_) | |_| | |_                                                                                                           
|_|_| |_| .__/ \__,_|\__|                                                                                                          
        |_|                                                                                                                        
;                                                                                                                                  
                                                                                                                                   
                                                                                                                                   
data have;                                                                                                                         
  infile datalines dlm=',' truncover;                                                                                              
  informat HRM $50.;                                                                                                               
input HRM ;                                                                                                                        
datalines;                                                                                                                         
THKDNAWTHE                                                                                                                         
COIOMMOO THE                                                                                                                       
THEDONNWWW                                                                                                                         
THE DOCMESSC                                                                                                                       
THE DOCMESS THE                                                                                                                    
THEIMLEMTHE                                                                                                                        
run;                                                                                                                               
                                                                                                                                   
*            _               _                                                                                                     
  ___  _   _| |_ _ __  _   _| |_                                                                                                   
 / _ \| | | | __| '_ \| | | | __|                                                                                                  
| (_) | |_| | |_| |_) | |_| | |_                                                                                                   
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                  
                |_|                                                                                                                
;                                                                                                                                  
                                                                                                                                   
WORK.HAVE total obs=6    OUTPUT                                                                                                    
                       | RULES  (note the lenght of string is 50 so padded with blanks)                                            
 HRM                   |                                                                                                           
                       |                                                                                                           
 THKDNAWTHE            | THKDNAW      ==> remove THEb on the end                                                                   
 COIOMMOO THE          | COIOMMOO     ==> remove THEb on the end                                                                   
 THEDONNWWW            | THEDONNWWW   ==> remove THEb no change                                                                    
 THE DOCMESSC          | DOCMESSC     ==> remove THEb at the start                                                                 
 THE DOCMESS THE       | DOCMESS      ==> remove both THEb                                                                         
 THEIMLEMTHE           | THEIMLEM     ==> keep first THE (no following blank)                                                      
                       |                  and remove the second THEb                                                               
                       |                                                                                                           
*          _       _   _                                                                                                           
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                                
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                                                               
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                              
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                              
                                                                                                                                   
;                                                                                                                                  
                                                                                                                                   
data want;                                                                                                                         
   set have;                                                                                                                       
   hrm=transtrn(hrm,"THE ",trimn(""));                                                                                             
run;                                                                                                                               
                                                                                                                                   
                                                                                                                                   
                                                                                                                                   
