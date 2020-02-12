<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:i_d="http://internal/data" version="1.0">


    <!-- #H4# VARIABLES I18N -->
    <xsl:variable name="vLang">
        <!--cmt $vLang :document lang or user interface lang ? -->
        <xsl:choose>
            <xsl:when test="'' != /ce:ClicEdit/@lang">
                <xsl:value-of select="string(/ce:ClicEdit/@lang)"/>
            </xsl:when>
            <xsl:otherwise>fr</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="vLg">
        <!--cmt $vLg : 1st part on 2 chars -->
        <xsl:choose>
            <xsl:when test="string-length($vLang) &gt; 2">
                <xsl:value-of select="substring($vLang, 1, 2)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$vLang"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>


    <xsl:variable name="vLabels" select="document('i18n_xml.xml')/i_d:labels"/>

    <!-- #H4# TEMPLATES -->


    <xsl:template name="getLabel">
        <!--Cmt: $aList : for labels in list -->
        <xsl:param name="aList"/>

        <!--Cmt: $aVal : key -->
        <xsl:param name="aVal"/>
        
        <!--Cmt: $aLang : optional 'lang' parameter -->
        <xsl:param name="aLang"/>

        <!--Cmt: convert $aVal to string  -->
        <xsl:variable name="iKey" select="string($aVal)"/>

        <xsl:variable name="iLang">
            <xsl:choose>
                <xsl:when test="'' != $aLang">
                    <xsl:value-of select="$aLang"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$vLang"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="iLg" select="substring($iLang, 1, 2)"/>

        <xsl:variable name="getLabel_res">
            <xsl:choose>
                <xsl:when test="'' != $aList and $vLabels/i_d:lb[@l = $aList and @k = $iKey]/*[local-name() = $iLang]">
                    <xsl:value-of select="$vLabels/i_d:lb[@l = $aList and @k = $iKey]/*[local-name() = $iLang]"/>
                </xsl:when>
                <xsl:when test="'' != $aList and $vLabels/i_d:lb[@l = $aList and @k = $iKey]/*[local-name() = $iLg]">
                    <xsl:value-of select="$vLabels/i_d:lb[@l = $aList and @k = $iKey]/*[local-name() = $iLg]"/>
                </xsl:when>
                <xsl:when test="$vLabels/i_d:lb[@k = $iKey]/*[local-name() = $iLang]">
                    <xsl:value-of select="$vLabels/i_d:lb[@k = $iKey]/*[local-name() = $iLang]"/>
                </xsl:when>
                <xsl:when test="$vLabels/i_d:lb[@k = $iKey]/*[local-name() = $iLg]">
                    <xsl:value-of select="$vLabels/i_d:lb[@k = $iKey]/*[local-name() = $iLg]"/>
                </xsl:when>
                <xsl:when test="$vLabels/i_d:lb[@k = $iKey]/fr">
                    <xsl:value-of select="$vLabels/i_d:lb[@k = $iKey]/fr"/>
                </xsl:when>
                <xsl:when test="'' != $iKey">
                    <xsl:value-of select="$iKey"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Clef Vide</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:value-of select="$getLabel_res"/>
    </xsl:template>



    <xsl:template name="dbg-i18n">
        <pre title="test i18n">
        <dbg-vLabels>
            <xsl:copy-of select="$vLabels"/>
        </dbg-vLabels>
            <p>
                <xsl:call-template name="getLabel">
                    <xsl:with-param name="aLang">fr</xsl:with-param>
                    <xsl:with-param name="aList">credit_status_list_type</xsl:with-param>
                    <xsl:with-param name="aVal">new</xsl:with-param>
                </xsl:call-template>
            </p>
        </pre>
        
    </xsl:template>

</xsl:stylesheet>
