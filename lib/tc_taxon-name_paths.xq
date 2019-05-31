for $tcg in //treatment//treatmentCitationGroup

let $tcname := ($tcg//taxonomicName)[1]

return
   
   
   
 
  concat(string($tcname/ancestor::treatment[1]/@LSID), '|', path($tcname), '|', normalize-space($tcname))
 
 


