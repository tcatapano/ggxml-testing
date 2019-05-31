<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mods="http://www.loc.gov/mods/v3" version="1.0" exclude-result-prefixes="mods">
    <xsl:output method="xml" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:apply-templates select="//treatment[1]"/>
    </xsl:template>

    <xsl:template match="treatment">
        <treatment-md>

            <!-- metadata from document root node -->
            <xsl:apply-templates select="ancestor::document"/>

            <!-- bibliographic metadata from mods -->
            <xsl:apply-templates select="ancestor::document//mods:mods"/>

            <!-- 
                "primary" taxon name data from first descendant taxonomicName in
                  first descendant subSubSection of type "nomenclature" 
            -->
            <xsl:apply-templates
                select="(subSubSection[@type = 'nomenclature'][not(preceding::subSubSection[@type = 'nomenclature'])]//taxonomicName)[1]"/>

            <!-- process each descendant materialsCitation -->
            <xsl:apply-templates select="//materialsCitation"/>

        </treatment-md>

    </xsl:template>

    <xsl:template match="document">
        <treatment-id>
            <xsl:value-of select="@docId"/>
        </treatment-id>
        <title>
            <xsl:value-of select="normalize-space(@docTitle)"/>
        </title>
        <page>
            <xsl:value-of select="@pageNumber"/>
            <xsl:if test="@pageNumber != @lastPageNumber">
                <xsl:text>-</xsl:text>
                <xsl:value-of select="@lastPageNumber"/>
            </xsl:if>
        </page>
        <doi>
            <xsl:value-of select="@ID-DOI"/>
        </doi>
        <zenodo-id>
            <xsl:value-of select="@ID-Zenodo-Dep"/>
        </zenodo-id>
    </xsl:template>

    <xsl:template match="mods:mods">
        <pubdate>
            <xsl:choose>
                <xsl:when test="//mods:detail[@type = 'pubDate']/mods:number">
                    <xsl:value-of select="//mods:detail[@type = 'pubDate']/mods:number"/> 
                </xsl:when>
                <xsl:otherwise>
                   <xsl:value-of select="mods:relatedItem[@type = 'host']/mods:part/mods:date"/>
                    <xsl:text>-12-31</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            
        </pubdate>
        <article-title>
            <xsl:value-of select="normalize-space(mods:titleInfo/mods:title/text())"/>
        </article-title>
        <journal-title>
            <xsl:value-of select="mods:relatedItem[@type = 'host']/mods:titleInfo/mods:title/text()"
            />
        </journal-title>
        <journal-volume>
            <xsl:value-of
                select="mods:relatedItem[@type = 'host']/mods:part/mods:detail[@type = 'volume']/mods:number/text()"
            />
        </journal-volume>
        <journal-issue>
            <xsl:value-of
                select="mods:relatedItem[@type = 'host']/mods:part/mods:detail[@type = 'issue']/mods:number/text()"
            />
        </journal-issue>
    </xsl:template>


    <xsl:template match="taxonomicName">
        <authorityYear>
            <xsl:value-of select="@authorityYear"/>
        </authorityYear>
        <kingdom>
            <xsl:value-of select="@kingdom"/>
        </kingdom>
        <phylum>
            <xsl:value-of select="@phylum"/>
        </phylum>
        <order>
            <xsl:value-of select="@order"/>
        </order>
        <family>
            <xsl:value-of select="@family"/>
        </family>
        <genus>
            <xsl:value-of select="@genus"/>
        </genus>
        <species>
            <xsl:value-of select="@species"/>
        </species>
        <status>
            <xsl:value-of select="@status"/>
        </status>
        <rank>
            <xsl:value-of select="@rank"/>
        </rank>
        <authorityName>
            <xsl:value-of select="@authorityName"/>
        </authorityName>
    </xsl:template>

    <xsl:template match="materialsCitation">
        <material-citation>
            <collectionCode>
                <xsl:value-of select="@collectionCode"/>
            </collectionCode>
            <specimenCount-female>
                <xsl:value-of select="@specimenCount-female"/>
            </specimenCount-female>
            <specimenCount-male>
                <xsl:value-of select="@specimenCount-male"/>
            </specimenCount-male>
            <specimenCount>
                <xsl:value-of select="@specimenCount"/>
            </specimenCount>
            <specimenCode>
                <xsl:value-of select="@specimenCode"/>
            </specimenCode>
            <typeStatus>
                <xsl:value-of select="@typeStatus"/>
            </typeStatus>
            <collectingCountry>
                <xsl:value-of select="@collectingCountry"/>
            </collectingCountry>
            <collectingRegion>
                <xsl:value-of select="@collectingRegion"/>
            </collectingRegion>
            <collectingMunicipality>
                <xsl:value-of select="@collectingMunicipality"/>
            </collectingMunicipality>
            <collectingCounty>
                <xsl:value-of select="@collectingCounty"/>
            </collectingCounty>
            <location>
                <xsl:value-of select="@location"/>
            </location>
            <locationDeviation>
                <xsl:value-of select="@locationDeviation"/>
            </locationDeviation>
            <determinerName>
                <xsl:value-of select="@determinerName"/>
            </determinerName>
            <collectorName>
                <xsl:value-of select="@collectorName"/>
            </collectorName>
            <collectingDate>
                <xsl:value-of select="@collectingDate"/>
            </collectingDate>
            <collectedFrom>
                <xsl:value-of select="@collectedFrom"/>
            </collectedFrom>
            <collectingMethod>
                <xsl:value-of select="@collectingMethod"/>
            </collectingMethod>
            <latitude>
                <xsl:value-of select="@latitude"/>
            </latitude>
            <longitude>
                <xsl:value-of select="@longitude"/>
            </longitude>
            <elevation>
                <xsl:value-of select="@elevation"/>
            </elevation>
            <httpUri>
                <xsl:value-of select="@httpUri"/>
            </httpUri>
        </material-citation>
    </xsl:template>

</xsl:stylesheet>
