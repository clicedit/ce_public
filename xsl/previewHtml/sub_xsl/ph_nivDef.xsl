<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" exclude-result-prefixes="ce" version="1.0">
    <!-- info see parent 'ph_main.xsl' -->

    <!-- #H2# preinclude -->
    <!--x.l:include href="../../lib/common_xsl/i18n_xsl.xsl"/-->
    <!--x.l:include href="../../lib/common_xsl/common_xsl.xsl"/-->
    <!--x.l:include href="./ph_loop.xsl"/-->
    <!--x.l:include href="./ph_inline.xsl"/-->

    <!-- #H2# TEMPLATES GEN  -->
    <!-- #H4# tpl niv def  -->
    <!-- ================= -->

    <!-- ==== NIV0 : Empty ...-->
    <xsl:template name="tplEmptyCell">
        <xsl:text>&#160;</xsl:text>
    </xsl:template>

    <!-- ==== NIV10 : TEXT -->
    <xsl:template name="n10">
        <xsl:comment>
[n10]</xsl:comment>
        <xsl:apply-templates/>
        <xsl:call-template name="errorIfHasChild"/>
        <xsl:comment>
[/n10]</xsl:comment>

    </xsl:template>

    <!-- Cmt txt:  trad(.) -->
    <xsl:template name="n11">
        <xsl:comment>
[n11]</xsl:comment>

        <xsl:call-template name="getLabel">
            <xsl:with-param name="aVal" select="."/>
        </xsl:call-template>
        <xsl:call-template name="errorIfHasChild"/>
        <xsl:comment>
[/n11]</xsl:comment>

    </xsl:template>


    <!-- Cmt txt:  . + unit -->
    <xsl:template name="n13">
        <xsl:comment>
[n13]</xsl:comment>
        <xsl:apply-templates/>
        <xsl:call-template name="tplEx"/>
        <xsl:call-template name="errorIfHasChild"/>
        <xsl:comment>
[/n13]</xsl:comment>
    </xsl:template>


    <!-- Cmt txt:  . + ' ' -->
    <xsl:template name="n14">
        <xsl:comment>
[n14]</xsl:comment>
        <xsl:apply-templates/>
        <xsl:text> </xsl:text>
        <xsl:call-template name="errorIfHasChild"/>
        <xsl:comment>
[/n14]</xsl:comment>
    </xsl:template>


    <!-- Cmt_value 'Quantity_type' : @quantity + unit  -->
    <xsl:template mode="md_n10" match="*">
        <!--cmt add @currency or @unit  -->
        <xsl:value-of select="."/>
        <xsl:call-template name="tplEx"/>
        <xsl:if test="'' != @tolerance">
            <xsl:text> </xsl:text>
            <xsl:call-template name="getLabel">
                <xsl:with-param name="aVal" select="@tolerance"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    

    <!-- ==== NIV20 LIGNE :span.libelle + content (sans BR) -->
    <xsl:template name="n20">
        <xsl:comment>
[n20]</xsl:comment>
        <xsl:call-template name="labelByTagName"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates/>
        <xsl:comment>
[/n20]</xsl:comment>

    </xsl:template>

    <!-- Cmt line :  -->
    <xsl:template name="n22">
        <xsl:comment>
[n22]</xsl:comment>

        <xsl:call-template name="n24"/>
        <xsl:comment>
[/n22]</xsl:comment>

    </xsl:template>

    <!-- Cmt line : lab(.) + apply  -->
    <xsl:template name="n23">
        <xsl:comment>
[n23]</xsl:comment>

        <xsl:call-template name="getLabel">
            <xsl:with-param name="aVal" select="."/>
        </xsl:call-template>
        <xsl:apply-templates/>
        <xsl:comment>
[/n23]</xsl:comment>

    </xsl:template>


    <!-- Cmt: lab + ($aTxt)? + trad(.) -->
    <xsl:template name="n24">
        <xsl:param name="aTxt"/>
        <xsl:comment>
[n24]</xsl:comment>

        <xsl:call-template name="labelByTagName"/>
        <xsl:copy-of select="$aTxt"/>
        <xsl:call-template name="getLabel">
            <xsl:with-param name="aVal" select="."/>
        </xsl:call-template>
        <xsl:call-template name="errorIfHasChild"/>
        <xsl:comment>
[/n24]</xsl:comment>

    </xsl:template>


    <!-- Cmt line : lab + trad($aTxt)? + apply -->
    <xsl:template name="n26">
        <xsl:param name="aTxt"/>
        <xsl:comment>
[n26]</xsl:comment>

        <xsl:call-template name="labelByTagName"/>
        <xsl:choose>
            <xsl:when test="'' != $aTxt">
                <xsl:call-template name="getSpanLabel">
                    <xsl:with-param name="aVal" select="$aTxt"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
        <xsl:apply-templates/>
        <xsl:call-template name="errorIfHasChild"/>
        <xsl:comment>
[/n26]</xsl:comment>

    </xsl:template>


    <!-- Cmt line : $aTxt? + apply (without lab) -->
    <xsl:template name="n28">
        <xsl:param name="aTxt"/>

        <xsl:comment>
[n28]</xsl:comment>
        <xsl:copy-of select="$aTxt"/>
        <xsl:apply-templates/>
        <xsl:comment>
[/n28]</xsl:comment>
    </xsl:template>


    
    

    <xsl:template mode="md_n20" match="*">
        <xsl:call-template name="labelByTagName"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates mode="md_n10" select="."/>
    </xsl:template>


    <!-- ==== NIV30 : LIGNE + BR -->

    <!-- Cmt: DIS: lab + apply + br  -->
    <xsl:template name="n30">
        <xsl:comment>
<xsl:value-of select="concat('[n30] ', local-name())"/></xsl:comment>
        <div class="br">
            <xsl:call-template name="labelByTagName"/>
            <xsl:apply-templates/>
        </div>
        <xsl:comment>
[/n30]</xsl:comment>
    </xsl:template>


    <xsl:template name="n31">
        <xsl:param name="aTxt"/>

        <xsl:comment>
[n31]</xsl:comment>

        <xsl:call-template name="labelByTagName"/>
        <xsl:copy-of select="$aTxt"/>
        <xsl:apply-templates/>
        <xsl:comment>
[/n31]</xsl:comment>
    </xsl:template>





    <!-- Cmt lines by $aEltNodeLst : "c.:Society|c.:Department" -->
    <xsl:template name="n33">
        <!-- $aEltNodeList : input, list of tag with same elt -->
        <xsl:param name="aEltNodeLst"/>
        <xsl:param name="aSep" select="' '"/>

        <xsl:comment>
[n33]</xsl:comment>

        <xsl:for-each select="$aEltNodeLst">
            <xsl:choose>
                <xsl:when test="'!br' = $aSep">
                    <div class="br">
                        <xsl:if test="position() = 1">
                            <xsl:call-template name="labelByTagName"/>
                        </xsl:if>
                        <xsl:apply-templates select="."/>
                    </div>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="position() = 1">
                        <xsl:call-template name="labelByTagName"/>
                    </xsl:if>
                    <xsl:apply-templates select="."/>
                    <xsl:choose>
                        <xsl:when test="position() = last()">
                            <br/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:copy-of select="$aSep"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:comment>
[/n33]</xsl:comment>

    </xsl:template>


    <!-- Cmt line : n24 + br -->
    <xsl:template name="n34">
        <xsl:comment>
[n34]</xsl:comment>
        <div class="br">
            <xsl:call-template name="n24"/>
        </div>
        <xsl:comment>
[/n34]</xsl:comment>
    </xsl:template>


    <!-- Cmt line : $aTxt? + apply.br (without lab) -->
    <xsl:template name="n38">
        <xsl:param name="aTxt"/>

        <xsl:comment>
[n38]</xsl:comment>
        <div class="br">
            <xsl:copy-of select="$aTxt"/>
            <xsl:apply-templates/>
        </div>
        <xsl:comment>
[/n38]</xsl:comment>
    </xsl:template>


    <xsl:template mode="md_n30" match="*">
        <div class="br">
            <xsl:apply-templates mode="md_n20" select="."/>
        </div>
    </xsl:template>
    

    <!-- Cmt: niv4 or lines  -->
    <xsl:template name="n40">
        <xsl:param name="aTxt"/>
        <xsl:param name="aExcept"/>

        <xsl:comment>
[n40]</xsl:comment>

        <xsl:call-template name="labelByTagName"/>
        <xsl:copy-of select="$aTxt"/>
        <xsl:call-template name="nLoopAndDetailBr">
            <xsl:with-param name="aDetailList" select="$aExcept"/>
        </xsl:call-template>
        <xsl:comment>
[/n40]</xsl:comment>

    </xsl:template>

    <xsl:template name="n41">
        <xsl:param name="aTxt"/>
        <xsl:param name="aDetailList"/>

        <xsl:comment>
[n41]</xsl:comment>
        <xsl:call-template name="labelByTagName"/>
        <xsl:copy-of select="$aTxt"/>
        <xsl:call-template name="nLoopAndDetailBr">
            <xsl:with-param name="aDetailList" select="$aDetailList"/>
        </xsl:call-template>
        <xsl:comment>
[/n41]</xsl:comment>

    </xsl:template>


    <!-- ==== NIV40 : MULTILIGNES + details -->
    
    <xsl:template  mode="md_n40" match="@*">
        <div class="br" ce="aaaa">
            <xsl:call-template name="labelByTagName"></xsl:call-template>
            <xsl:value-of select="."/>
        </div>
    </xsl:template>
    
    <xsl:template  mode="md_n40" match="*">
        <div class="br">
        <xsl:call-template name="labelByTagName"/>
        </div>
        <xsl:apply-templates mode="md_n30"/>
    </xsl:template>


    <!-- ==== NIV50 : CELL-->
    <!-- Cmt: niv5 DIS: lab.s + $aTxt? + nLoopAndDetailTxt  -->
    <xsl:template name="n50">
        <xsl:param name="aTxt"/>
        <xsl:param name="aDetailList"/>
        <xsl:comment>
[n50]</xsl:comment>
        <span class="font-weight-bold">
            <xsl:call-template name="textLabelByTagName"/>
        </span>
        <xsl:copy-of select="$aTxt"/>
        <xsl:call-template name="nLoopAndDetailTxt">
            <xsl:with-param name="aDetailList" select="$aDetailList"/>
        </xsl:call-template>
        <xsl:comment>
[/n50]</xsl:comment>
    </xsl:template>

</xsl:stylesheet>
