<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://www.ascc.net/xml/schematron">
    <sch:pattern name="">
        <sch:rule id="treatment cardinality" context="document">
            <sch:report test="count(//treatment) &gt; 1">
                ERROR: A treatment document should not have more than 1 treatment element
            </sch:report>
            <sch:assert test="normalize-space(string(@docTitle))">ERROR: A treatment document must have a <sch:name/> element with a docTitle attribute</sch:assert>
            <sch:assert test="normalize-space(@lastPageNumber)">WARNING: Treatment <sch:name/> element does not have a lastPageNumber attribute</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>