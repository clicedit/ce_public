<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- ==== INCLUSION ==== -->
    <!--x.l:include href="i18n_xsl.xsl"-->


    <!-- #H4# TEMPLATES -->
    <xsl:template name="getDate">
        <xsl:param name="aVal"/>
        <!-- extract dateTime or date prefix -->
        <xsl:choose>
            <xsl:when test="string-length($aVal) &gt; 9">
                <xsl:value-of select="substring($aVal, 1, 10)"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- in: payloadId="2019-07-23T07:58:20+01:00.MYPROCESS ID.222@wm-ce-qualif" -->
                <xsl:value-of select="substring-before($aVal, 'T')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template name="getDateFormated">
        <xsl:param name="aVal"/>
        <xsl:variable name="vDatePart">
            <xsl:call-template name="getDate">
                <xsl:with-param name="aVal" select="$aVal"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="'' != $vDatePart and 'fr' = $vLg">
                <!-- out : 'DD/MM/YYYY' -->
                <xsl:value-of select="concat(substring($vDatePart, 9, 2), '/', substring($vDatePart, 6, 2), '/', substring($vDatePart, 1, 4))"/>
            </xsl:when>
            <xsl:when test="'' != $vDatePart">
                <!-- out : 'MM DD YYYY' -->
                <xsl:value-of select="concat(substring($vDatePart, 6, 2), ' ', substring($vDatePart, 9, 2), ' ', substring($vDatePart, 1, 4))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$aVal"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
        
    <xsl:template name="getSpanLabel">
        <xsl:param name="aList"/>
        <xsl:param name="aVal"/>
        <span class="font-weight-bold">
            <xsl:call-template name="getLabel">
                <xsl:with-param name="aList" select="$aList"/>
                <xsl:with-param name="aVal" select="$aVal"/>
            </xsl:call-template>
            <xsl:call-template name="getLabelSeprator"/>
        </span>
    </xsl:template>

    <xsl:template name="getLabelSeprator">
        <xsl:choose>
            <xsl:when test="'fr' = $vLg">
                <xsl:text> : </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>: </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
