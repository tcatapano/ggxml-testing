<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://www.ascc.net/xml/schematron">
    <sch:pattern name="document level">
        <sch:rule id="document attrs" context="document">
            <sch:assert test="normalize-space(string(@docTitle))">ERROR: A treatment document must have a <sch:name/> element with a docTitle attribute</sch:assert>
            <sch:assert test="normalize-space(@lastPageNumber)">WARNING: Treatment <sch:name/> element does not have a lastPageNumber attribute</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern name="illegal nesting">
        <sch:rule  context="treatment">
            <sch:report test="descendant::treatment">ERROR a <sch:name/> element should not contain another <sch:name/> element </sch:report>
        </sch:rule>
        <sch:rule context="materialsCitation">
            <sch:report test="descendant::materialsCitation">ERROR a <sch:name/> element should not contain another <sch:name/> element </sch:report>
        </sch:rule>
        <sch:rule context="treatmentCitation">
            <sch:report test="descendant::treatmentCitation">ERROR a <sch:name/> element should not contain another <sch:name/> element </sch:report>
        </sch:rule>
        <sch:rule context="figureCitation">
            <sch:report test="descendant::figureCitation">ERROR a <sch:name/> element should not contain another <sch:name/> element </sch:report>
        </sch:rule>
        <sch:rule context="bibRefCitation">
            <sch:report test="descendant::bibRefCitation">ERROR a <sch:name/> element should not contain another <sch:name/> element </sch:report>
        </sch:rule>
    </sch:pattern>
</sch:schema>