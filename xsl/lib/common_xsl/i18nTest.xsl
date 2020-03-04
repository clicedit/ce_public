<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:i_d="http://internal/data" version="1.0">

<xsl:output indent="yes"/>
    <xsl:include href="i18n_labels.xsl"/>
    <xsl:include href="i18n_xsl.xsl"/>

    <!-- #H4# TEMPLATES -->

    <xsl:template match="/">
        <test>
            <t1>
                <xsl:call-template name="getLabel">
                    <xsl:with-param name="aVal">yes</xsl:with-param>
                    <xsl:with-param name="aLang">fr</xsl:with-param>
                </xsl:call-template>
            </t1>
            <t2>
                <xsl:call-template name="dbg-i18n"/>
            </t2>
        </test>
    </xsl:template>
</xsl:stylesheet>
