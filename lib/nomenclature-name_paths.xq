for $tmt in //treatment

let $nm := ($tmt//subSubSection[@type = 'nomenclature'][not(preceding::subSubSection[@type = 'nomenclature'])]//taxonomicName)[1]

return

concat(string($nm/ancestor::treatment[1]/@LSID), '|', path($nm), '|', normalize-space($nm))