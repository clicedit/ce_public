<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:i_d="http://internal/data" xmlns:exslt="http://exslt.org/common" exclude-result-prefixes="xsi ce i_d exslt" version="1.0">

    <!--
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:i_d="http://internal/data" xmlns:exslt="http://exslt.org/common" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0">
-->
    <!-- info see parent 'ph_main.xsl' -->

    <!-- #H2# preinclude -->
    <!--x.l:include href="../../lib/common_xsl/i18n_xsl.xsl"/-->
    <!--x.l:include href="../../lib/common_xsl/common_xsl.xsl"/-->

    <!-- #H2# TEMPLATES GEN  -->

    <!-- #H4# tpl error or mdNYI -->

    <xsl:template name="errorIfHasChild">
        <xsl:if test="0 &lt; count(*)">
            <error msg="{concat('has ', count(*), 'children not displayed')}">
                <xsl:if test="contains($pDebug, '_error_')">
                    <xsl:copy-of select="*"/>
                </xsl:if>
            </error>
        </xsl:if>
    </xsl:template>

    <!-- Cmt : Not Yet Implemented -->

    <xsl:template mode="mdNYI" match="*">
        <xsl:value-of select="concat(local-name(), ': ', .)"/>
        <div class="notYetImplemented">

            <!-- 
                <xsl:text>XXXX</xsl:text>
-->
            <error msg="TODO" tag="{local-name()}"/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>


    <!-- #H4# tpl label  -->

    <xsl:template name="textLabelByTagName">
        <xsl:call-template name="getLabel">
            <xsl:with-param name="aVal" select="local-name()"/>
        </xsl:call-template>
        <xsl:text> </xsl:text>
    </xsl:template>

    <xsl:template name="labelByTagName">
        <xsl:call-template name="getSpanLabel">
            <xsl:with-param name="aVal" select="local-name()"/>
        </xsl:call-template>
    </xsl:template>

    <!-- #H4# tpl attribut  -->

    <xsl:template mode="mdAttOpt" match="@*">
        <!-- nothing in empty attribut -->
        <xsl:if test="'' != .">
            <xsl:call-template name="labelByTagName"/>
            <xsl:value-of select="."/>
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>


    <!-- #H4# tpl loop  -->

    <xsl:template name="nLoop">
        <xsl:param name="aSep"/>
        <xsl:comment>
<xsl:value-of select="concat('nLoop(aSep:', $aSep, ')')"/>
</xsl:comment>
        <xsl:for-each select="*">
            <xsl:choose>
                <xsl:when test="'!br' = $aSep">
                    <div class="br">
                        <xsl:apply-templates/>
                    </div>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                    <xsl:if test="position() &lt; last()">
                        <xsl:copy-of select="$aSep"/>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="nLoopVal">
        <!-- nLoopVal() equivalent to nLoop() except not for '*'(elements) but for one '$aVal'(attribut,...) -->
        <xsl:param name="aVal"/>
        <xsl:param name="aSep"/>
        <xsl:choose>
            <xsl:when test="'!br' = $aSep">
                <div class="br">
                    <xsl:copy-of select="$aVal"/>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$aVal"/>
                <xsl:if test="position() &lt; last()">
                    <xsl:copy-of select="$aSep"/>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template name="nLoopTxt">
        <xsl:call-template name="nLoop">
            <xsl:with-param name="aSep" select="', '"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="nLoopBr">
        <xsl:call-template name="nLoop">
            <xsl:with-param name="aSep" select="'!br'"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="nLoopBrVal">
        <xsl:param name="aVal"/>
        <xsl:call-template name="nLoopVal">
            <xsl:with-param name="aVal" select="$aVal"/>
            <xsl:with-param name="aSep" select="'!br'"/>
        </xsl:call-template>
    </xsl:template>



    <xsl:template name="nLoopOn">
        <!--Cmt: $aEltNameLst !elt_1!elt_2! -->
        <xsl:param name="aEltNameLst"/>
        <xsl:param name="aSep"/>
        <xsl:comment>
<xsl:value-of select="concat('nLoopOn(aSep:', $aSep, ', aEltNameLst:', $aEltNameLst, ')')"/>
</xsl:comment>

        <xsl:variable name="vSelectedElt">
            <xsl:for-each select="*">
                <xsl:if test="contains($aEltNameLst, concat('!', local-name(), '!'))">
                    <xsl:copy-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>


        <xsl:if test="contains($pDebug, '_loop_')">
            <dbg-sep>
                <xsl:copy-of select="$aSep"/>
            </dbg-sep>
            <dbg on="{$aEltNameLst}">
                <xsl:copy-of select="$vSelectedElt"/>
            </dbg>
        </xsl:if>

        <xsl:choose>
            <xsl:when test="'!br' = $aSep">
                <xsl:for-each select="*">
                    <xsl:if test="contains($aEltNameLst, concat('!', local-name(), '!'))">
                        <div class="br">
                            <xsl:apply-templates select="."/>
                        </div>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="function-available('exslt:node-set')">
                <xsl:for-each select="exslt:node-set($vSelectedElt)/*">
                    <xsl:apply-templates select="."/>
                    <xsl:if test="position() &lt; last()">
                        <xsl:copy-of select="$aSep"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <!-- IE, edge TODO -->
                <xsl:for-each select="*">
                    <xsl:if test="contains($aEltNameLst, concat('!', local-name(), '!'))">
                        <xsl:apply-templates/>
                        <xsl:if test="position() &lt; last()">
                            <xsl:copy-of select="$aSep"/>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template name="nLoopOnTxt">
        <!-- $aEltNameLst !elt_1!elt_2! -->
        <xsl:param name="aEltNameLst"/>
        <xsl:call-template name="nLoopOn">
            <xsl:with-param name="aEltNameLst" select="$aEltNameLst"/>
            <xsl:with-param name="aSep" select="', '"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="nLoopOnBr">
        <!-- $aEltNameLst !elt_1!elt_2! -->
        <xsl:param name="aEltNameLst"/>
        <xsl:call-template name="nLoopOn">
            <xsl:with-param name="aEltNameLst" select="$aEltNameLst"/>
            <xsl:with-param name="aSep" select="'!br'"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="nLoopExcept">
        <!-- $aExcept !elt_1!elt_2! -->
        <xsl:param name="aExcept"/>
        <xsl:param name="aSep"/>
        <xsl:comment>
<xsl:value-of select="concat('nLoopExcept(aSep:', $aSep, ', aExcept:', $aExcept, ')')"/>
</xsl:comment>

        <xsl:variable name="vSelectedElt">
            <xsl:for-each select="*">
                <xsl:if test="not(contains($aExcept, concat('!', local-name(), '!')))">
                    <xsl:copy-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:if test="contains($pDebug, '_loop_')">
            <dbg-sep>
                <xsl:copy-of select="$aSep"/>
            </dbg-sep>
            <dbg except="{$aExcept}">
                <xsl:copy-of select="$vSelectedElt"/>
            </dbg>
        </xsl:if>

        <xsl:choose>
            <xsl:when test="'!none' = $aSep">
                <xsl:for-each select="*">
                    <xsl:if test="not(contains($aExcept, concat('!', local-name(), '!')))">
                         <xsl:apply-templates select="."/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="'!br' = $aSep">
                <xsl:for-each select="*">
                    <xsl:if test="not(contains($aExcept, concat('!', local-name(), '!')))">
                        <div class="br" ce="nLoopExcept/for">
                            <xsl:apply-templates select="."/>
                        </div>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="function-available('exslt:node-set')">
                <xsl:for-each select="exslt:node-set($vSelectedElt)/*">
                    <xsl:apply-templates select="."/>
                    <xsl:choose>
                        <xsl:when test="position() &lt; last()">
                            <xsl:copy-of select="$aSep"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <!-- IE, edge TODO -->
                <xsl:for-each select="*">
                    <xsl:if test="not(contains($aExcept, concat('!', local-name(), '!')))">
                        <xsl:apply-templates/>
                        <xsl:if test="position() &lt; last()">
                            <xsl:copy-of select="$aSep"/>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template name="nLoopExceptTxt">
        <!-- $aExcept !elt_1!elt_2! -->
        <xsl:param name="aExcept"/>
        <xsl:call-template name="nLoopExcept">
            <!-- $aExcept !elt_1!elt_2! -->
            <xsl:with-param name="aExcept" select="$aExcept"/>
            <xsl:with-param name="aSep" select="', '"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="nLoopExceptBr">
        <!-- $aExcept !elt_1!elt_2! -->
        <xsl:param name="aExcept"/>
        <xsl:call-template name="nLoopExcept">
            <!-- $aExcept !elt_1!elt_2! -->
            <xsl:with-param name="aExcept" select="$aExcept"/>
            <xsl:with-param name="aSep" select="'!br'"/>
        </xsl:call-template>
    </xsl:template>


    <xsl:template name="nLoopAndDetailTxt">
        <!-- $aDetailList !elt_1!elt_2! -->
        <xsl:param name="aDetailList"/>

        <xsl:call-template name="nLoopExceptTxt">
            <xsl:with-param name="aExcept" select="$aDetailList"/>
        </xsl:call-template>

        <div class="ce_stDetail">
            <xsl:call-template name="nLoopOnTxt">
                <xsl:with-param name="aEltNameLst" select="$aDetailList"/>
            </xsl:call-template>
        </div>
    </xsl:template>

    <xsl:template name="nLoopAndDetailBr">
        <!-- $aDetailList !elt_1!elt_2! -->
        <xsl:param name="aDetailList"/>

        <xsl:call-template name="nLoopExceptBr">
            <xsl:with-param name="aExcept" select="$aDetailList"/>
        </xsl:call-template>

        <div class="ce_stDetail">
            <xsl:call-template name="nLoopOnBr">
                <xsl:with-param name="aEltNameLst" select="$aDetailList"/>
            </xsl:call-template>
        </div>
    </xsl:template>

</xsl:stylesheet>
