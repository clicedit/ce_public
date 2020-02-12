<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" exclude-result-prefixes="ce" version="1.0">    <!-- info see parent 'ph_main.xsl' -->

    <!-- #H2# preinclude see 'ph_main.xsl'/'# common inclusion' -->

    <!-- #H2# TEMPLATE -->


    <xsl:template name="tplStatusRequest">
        <xsl:if test="starts-with($i_doc_type, 'dt_Status')">
            <xsl:for-each select="./ce:Request/ce:StatusRequest|./ce:Request/ce:StatusResponse">
                <!-- Cmt docHeader  -->                
                
                <!--Cmt: [//] Contact Liste par catagories :   -->
                <div id="contactList" class="container border-top">
                    <xsl:call-template name="tplContactList_multiCol"/>
                </div>
                
                <!-- Cmt docBody push mdRow  -->
                <div class="container border">
                    <xsl:apply-templates mode="mdRow" select="*[local-name() != 'Contact']"/>
                </div>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
