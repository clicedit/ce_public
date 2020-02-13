<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:i_d="http://internal/data" xmlns:exslt="http://exslt.org/common" exclude-result-prefixes="xsi ce i_d exslt" version="1.0">
    <!--
#fic: ce_previewHtml.xsl
#usage: Use XSLT Engine 'Saxon 6.x' to be compatible with browser <?xml-stylesheet type="text/xsl" href="file:///../../xsl/previewHtml/ce_previewHtml.xsl""?>
#syntaxe: cmd: ce_bash.bash xslSyntaxe
-->
    <xsl:output method="html" indent="yes"/>

    <!-- [test] 
    <xsl:include href="./sub_xsl/ph_main.xsl"/>
    <xsl:include href="./sub_xsl/ph_main.i.min.xsl"/>
    <xsl:include href="../_test.ign.i18n/test_browser_xsl.xsl"/>
    -->

    <xsl:include href="./sub_xsl/ph_main.xsl"/>

</xsl:stylesheet>
