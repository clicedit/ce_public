<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:i_d="http://internal/data" exclude-result-prefixes="ce i_d" version="1.0">
    <!-- info see parent 'ph_main.xsl' -->

    <xsl:template match="ce:Response/ce:Status">
        <div class="container mt-6 pt-6">
            <div class="row border bg-secondary text-white align-items-center">
                <div class="col-2">
                    <xsl:value-of select="@code"/>
                </div>
                <div class="col-10">
                    <xsl:choose>
                        <xsl:when test="@text">
                            <xsl:value-of select="@text"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aList" select="'technical_status_list_type'"/>
                                <xsl:with-param name="aVal" select="@code"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </div>
            <xsl:apply-templates mode="mdRow" select="ce:Details"/>
        </div>
    </xsl:template>

</xsl:stylesheet>
