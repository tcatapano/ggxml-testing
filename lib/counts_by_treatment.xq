for $tmt in //treatment

return 

concat($tmt/ancestor::document/@docId, '|',
count($tmt/ancestor::document/*:mods//*:name[*:role/*:roleTerm = 'Author']), '|',
count($tmt//materialsCitation), '|', 
count($tmt//treatmentCitation), '|',
count($tmt//figureCitation), '|',
count($tmt//bibRefCitation), '|',
count($tmt/preceding::treatment)
)