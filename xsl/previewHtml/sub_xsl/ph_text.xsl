<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" exclude-result-prefixes="ce" version="1.0">    <!-- info see parent 'ph_main.xsl' -->

    <!-- #H2# preinclude -->
    <!--x.l:include href="../../lib/common_xsl/i18n_xsl.xsl"/-->
    <!--x.l:include href="../../lib/common_xsl/common_xsl.xsl"/-->

    <!-- #H2# TEMPLATE -->
    <!-- #H4# Cmt_value ( 'ce' or 'xs' type and element with 'unit', ... -->


    <!-- Cmt_txt : [<gen>] text only-->
    <xsl:template mode="mdTxt" match="ce:Description">
        <xsl:value-of select="."/>
    </xsl:template>

    <!--Cmt_txt: 'Text_type' label(tn) + val-of -->

    <xsl:template mode="mdTxt" match="ce:TaxAmount">
        <xsl:call-template name="textLabelByTagName"/>
        <xsl:call-template name="getLabelSeprator"/>
        <xsl:value-of select="."/>
    </xsl:template>



    <!--Cmt_txt: 'PaymentTerms' -->
    <!-- [V0.ClicEdit.previ]
            <td colspan="2"> <.../PaymentTerms/@term"/> jours 
            <.../PaymentTerms/@netOrEOM"/> le 
            <.../PaymentTerms/@monthDay"/>&#160; 
            <.../PaymentTerms/@dateRef"/> </td>
    -->

    <xsl:template mode="mdTxt" match="ce:PaymentTerms">
        <xsl:if test="@term">
            <xsl:value-of select="@term"/>
            <xsl:text> </xsl:text>
            <xsl:call-template name="getLabel">
                <xsl:with-param name="aVal">days</xsl:with-param>
            </xsl:call-template>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:if test="@netOrEOM">
            <xsl:call-template name="getLabel">
                <xsl:with-param name="aList">net_or_eom_list_type</xsl:with-param>
                <xsl:with-param name="aVal" select="@netOrEOM"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="@monthDay">
            <xsl:text>, </xsl:text>
            <xsl:call-template name="getLabel">
                <xsl:with-param name="aVal">monthDay1</xsl:with-param>
            </xsl:call-template>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@monthDay"/>
            <xsl:text>&#160;</xsl:text>
            <xsl:call-template name="getLabel">
                <xsl:with-param name="aVal">monthDay2</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="@dateRef">
            <xsl:text> (</xsl:text>
            <xsl:call-template name="getLabel">
                <xsl:with-param name="aVal">dateRef</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="getLabelSeprator"/>
            <xsl:call-template name="getLabel">
                <xsl:with-param name="aList">payment_date_ref_list_type</xsl:with-param>
                <xsl:with-param name="aVal" select="@dateRef"/>
            </xsl:call-template>
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>







    <!-- Cmt : add currency or unit  -->
    <xsl:template name="tplEx">
        <!-- cmt: Complete with additional extension -->
        <!-- $aSep : optional separtor -->
        <xsl:choose>
            <xsl:when test="@currency">
                <xsl:text>&#160;</xsl:text>
                <xsl:value-of select="@currency"/>
            </xsl:when>
            <xsl:when test="@unit">
                <xsl:text>&#160;</xsl:text>
                <xsl:value-of select="@unit"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>


    <!-- Cmt_value : elt + unit  -->
    <xsl:template match="ce:PricePerUnit">
        <xsl:apply-templates/>
        <xsl:if test="@unit">
            <xsl:text>&#160;/</xsl:text>
            <xsl:value-of select="@unit"/>
        </xsl:if>
    </xsl:template>

    <!-- Cmt_value : %  -->
    <xsl:template match="ce:Percentage">
        <xsl:value-of select="concat(@percent, '%')"/>
    </xsl:template>

    <!--Cmt_value: '../Phone' use parent label + ... -->
    <xsl:template match="ce:TelephoneNumber">
        <xsl:value-of select="concat(ce:CountryCode, ' ', ce:AreaOrCityCode, ' ', ce:Number)"/>
    </xsl:template>



    <xsl:template match="ce:PackingLevelCode">
        <xsl:text> - </xsl:text>
        <xsl:variable name="iKey" select="concat(local-name(), .)"/>
        <xsl:call-template name="getLabel">
            <xsl:with-param name="aVal" select="$iKey"/>
        </xsl:call-template>
    </xsl:template>


    <!--Cmt_value: '../Phone' use parent label + ... -->
    <xsl:template match="ce:CarrierIdentifier">
        <xsl:if test="@domain">
            <xsl:call-template name="getSpanLabel">
                <xsl:with-param name="aVal" select="@domain"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>
