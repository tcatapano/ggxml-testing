for $tmt in //treatment

return 

concat($tmt/ancestor::document/@docId, '|',
count($tmt//materialsCitation), '|', 
count($tmt//treatmentCitation), '|',
count($tmt//figureCitation), '|',
count($tmt//bibRefCitation)
)