for $tmt in //document//treatment[ancestor::document[count(//treatment) = 1]]

let $treatmentId := string($tmt/ancestor::document/@docId)

let $tname :=  ($tmt//subSubSection[@type = 'nomenclature'][not(preceding::subSubSection[@type = 'nomenclature'])]//taxonomicName)[1]

let $pages := concat($tmt/@pageNumber, '-', $tmt/@lastPageNumber)

let $doi := string($tmt/ancestor::document/@ID-DOI)

let $zenodo := string($tmt/ancestor::document/@ID-Zenodo-Dep)

let $pubdate := $tmt/ancestor::document//*:detail[@type='pubDate']/*:number

(: where $tmt/ancestor::document[count(descendant::treatment) = 1] :)

return

<treatment_data>
<treatment-id>{$treatmentId}</treatment-id>
<title>{string($tmt/ancestor::document/@docTitle)}</title>
<page>{$pages}</page>
<doi>{$doi}</doi>
<zenodo-id>{$zenodo}</zenodo-id>
<pubdate>{$pubdate/text()}</pubdate>
<article-title>{$tmt/ancestor::document/*:mods/*:titleInfo/*:title/text()}</article-title>
<journal-title>{$tmt/ancestor::document/*:mods/*:relatedItem[@type = 'host']/*:titleInfo/*:title/text()}</journal-title>
<journal-volume>{$tmt/ancestor::document/*:mods/*:relatedItem[@type = 'host']/*:part/*:detail[@type = 'volume']/*:number/text()}</journal-volume>
<journal-issue>{$tmt/ancestor::document/*:mods/*:relatedItem[@type = 'host']/*:part/*:detail[@type = 'issue']/*:number/text()}</journal-issue>
<authorityName>{string($tname/@authorityName)}</authorityName>
<authorityYear>{string($tname/@authorityYear)}</authorityYear>
<kingdom>{string($tname/@kingdom)}</kingdom>
<phylum>{string($tname/@phylum)}</phylum>
<order>{string($tname/@order)}</order>
<family>{string($tname/@family)}</family>
<genus>{string($tname/@genus)}</genus>
<species>{string($tname/@species)}</species>
<status>{string($tname/@status)}</status>
<rank>{string($tname/@rank)}</rank>

{
 for $aut in $tmt/ancestor::document/*:mods//*:name[*:role/*:roleTerm = 'Author']
 
 return
    <treatmentAuthor>{normalize-space($aut//*:namePart/text())}</treatmentAuthor>
}
{
  for $mc in $tmt//materialsCitation
return
<material>
<collectionCode>{string($mc/@collectionCode)}</collectionCode>
<specimenCount-female>{string($mc/@specimenCount-female)}</specimenCount-female>
<specimenCount-male>{string($mc/@specimenCount-male)}</specimenCount-male>
<specimenCount>{string($mc/@specimenCount)}</specimenCount>
<specimenCode>{string($mc/@specimenCode)}</specimenCode>
<typeStatus>{string($mc/@typeStatus)}</typeStatus>
<collectingCountry>{string($mc/@collectingCountry)}</collectingCountry>
<collectingRegion>{string($mc/@collectingRegion)}</collectingRegion>
<collectingMunicipality>{string($mc/@collectingMunicipality)}</collectingMunicipality>
<collectingCounty>{string($mc/@collectingCounty)}</collectingCounty>
<location>{string($mc/@location)}</location>
<locationDeviation>{string($mc/@locationDeviation)}</locationDeviation>
<determinerName>{string($mc/@determinerName)}</determinerName>
<collectorName>{string($mc/@collectorName)}</collectorName>
<collectingDate>{string($mc/@collectingDate)}</collectingDate>
<collectedFrom>{string($mc/@collectedFrom)}</collectedFrom>
<collectingMethod>{string($mc/@collectingMethod)}</collectingMethod>
<latitude>{string($mc/@latitude)}</latitude>
<longitude>{string($mc/@longitude)}</longitude>
<elevation>{string($mc/@elevation)}</elevation>
<httpUri>{string($mc/@httpUri)}</httpUri>
</material>
}
{
  
  for $tmtCit in $tmt//treatmentCitation
  
  return
  <treatmentCitation>
  <treatmentCitationTaxonName>{($tmtCit/ancestor::treatmentCitationGroup//taxonomicName)[1]//text()}</treatmentCitationTaxonName>
  <treatmentCitationText>{$tmtCit//text()}</treatmentCitationText>
  </treatmentCitation>
}
</treatment_data>