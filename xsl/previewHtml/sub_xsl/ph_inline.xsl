<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:i_d="http://internal/data" exclude-result-prefixes="ce i_d" version="1.0">
    <!-- info see parent 'ph_main.xsl' -->

    <!-- #H2# preinclude -->
    <!--x.l:include href="../../lib/common_xsl/i18n_xsl.xsl"/-->
    <!--x.l:include href="../../lib/common_xsl/common_xsl.xsl"/-->
    <!--x.l:include href="./ph_loop.xsl"/-->

    <!-- #H2# TEMPLATE -->


    <!-- #H4# Cmt_inlineDiv :description + div.detail -->
    <xsl:template name="descriptionAndDetails">
        <xsl:apply-templates mode="mdTxt" select="ce:Description"/>
        <div class="ce_stDetail">
            <xsl:apply-templates mode="mdInlineBr" select="*[local-name() != 'Description']"/>
        </div>
    </xsl:template>




    <!-- #H4# Cmt_inlineBr : mode "inline + br" or "Suffix br"  -->
    <xsl:template mode="mdSuffBr" match="*">
        <xsl:apply-templates select="."/>
        <br/>
    </xsl:template>

    <xsl:template match="@payloadID | @documentId | @documentDate | @quantity">
        <xsl:value-of select="."/>
        <br/>
    </xsl:template>


    <!-- #H4# Cmt_inline no label -->
    <!-- Cmt inline no label -->
    <xsl:template match="ce:Comment | ce:Description | ce:ExemptReason | ce:OrderDesc | ce:Reason">
        <xsl:call-template name="tplHtmlLike">
            <xsl:with-param name="aVal" select="."/>
        </xsl:call-template>
    </xsl:template>


    <!--Cmt: [<gen>] label(eltName) + inlineBr -->
    <xsl:template match="ce:TaxAmount | ce:CountryCode | ce:AreaOrCityCode | ce:Number | ce:PaperBrandName | ce:PaperSupply | ce:PaperQuality">
        <xsl:call-template name="labelByTagName"/>
        <xsl:call-template name="nLoopBr"/>
    </xsl:template>


    <!--Cmt: [<gen>] label(eltName) + apply-self + Br -->
    <xsl:template match="ce:Version | ce:UserAgent | ce:ShippingMark | ce:PaperLabel | ce:PaperShade | ce:InternalId">
        <xsl:call-template name="labelByTagName"/>
        <xsl:value-of select="."/>
        <br/>
    </xsl:template>


    <!-- #H4# Cmt_inline -->

    <!--Cmt_inline [<gen>] : label(eltName) + apply* -->
    <xsl:template match="ce:GrainDirection | ce:NumberOfSections | ce:NumberOfWorks | ce:SuppliedBy | ce:StitchingDetails | ce:WrappingType | ce:Tolerances | ce:Title | ce:Subtitle | ce:Collection | ce:NumberOfPages | ce:Imposition">
        <xsl:call-template name="labelByTagName"/>
        <xsl:apply-templates/>
    </xsl:template>


    <!--Cmt_inline [<gen>] -->
    <xsl:template match="ce:GrossAmount | ce:InvoiceDetailDiscount | ce:NetAmount | ce:DueAmount">
        <xsl:if test="not(parent::ce:InvoiceDetailSummary)">
            <xsl:call-template name="labelByTagName"/>
        </xsl:if>
        <xsl:apply-templates/>
    </xsl:template>


    <!--Cmt_inline [<gen>] : label(eltName) + md_n10 -->
    <xsl:template match="ce:OrderedQuantity | ce:Quantity | ce:UnitPerPallet | ce:QuantityPerPacking | ce:QuantityVarianceNote">
        <xsl:call-template name="labelByTagName"/>
        <xsl:apply-templates select="." mode="md_n10"/>
    </xsl:template>


    <!--Cmt_inline [<txt>] 'xs:boolean' : ', '? +  textLabel(eltName)  -->
    <xsl:template match="ce:StapleType | ce:StapleColor | ce:NumberOfStaples | ce:PaperSplitting | ce:WrappingFlaps | ce:CoEditionRunOn | ce:GluedHinge | ce:Creasing | ce:Bookblock | ce:Cover | ce:ManualOperation | ce:Paperback">
        <xsl:choose>
            <xsl:when test="position() > 1">
                <xsl:text>, </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text> </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name="textLabelByTagName"/>
        <xsl:apply-templates/>
    </xsl:template>


    <!-- Cmt_inline : label(eltName) + label(.)  -->
    <xsl:template match="ce:ReadingDirection | ce:BindingDirection | ce:Orientation | ce:CoEditionRunOn | ce:VersionEdition | ce:InkType | ce:PrintingTechnology | ce:PaperShape | ce:CoEditionRunOn | ce:ExistingTool | ce:StickerForm | ce:StickerGlue | ce:StickerApparence | ce:PaperShape">
        <xsl:call-template name="labelByTagName"/>
        <xsl:text> </xsl:text>
        <xsl:call-template name="getLabel">
            <xsl:with-param name="aVal" select="string(.)"/>
        </xsl:call-template>
    </xsl:template>




    <!--Cmt: label(eltName) + use content 'ce:Description' or useTags -->
    <xsl:template match="ce:Amalgam">
        <xsl:call-template name="labelByTagName"/>
        <xsl:call-template name="descriptionAndDetails"/>
    </xsl:template>


    <!--Cmt: 'ce:Environment'  label(eltName) + loop.Carbon.sep -->
    <xsl:template match="ce:Environment">
        <xsl:call-template name="labelByTagName"/>
        <xsl:for-each select="ce:Carbon">
            <xsl:if test="1 = position()">
                <xsl:call-template name="textLabelByTagName"/>
            </xsl:if>
            <xsl:value-of select="concat(., ' ', @unit)"/>
            <xsl:if test="position() &lt; last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>


    <!-- #H4# mode normal as inline -->

    <!-- Cmt_inlineBr [BookComponentBloc| ...] 'ce:SpecSections_type' : loop Sections -->
    <xsl:template match="ce:SpecSections">
       <xsl:apply-templates/> 
    </xsl:template>


    <!-- Cmt_mdInlineBr : 'Packing_type' : pckCode (Desc) \n quanty ShpMrk.. -->
    <xsl:template match="ce:Packing">
        <div class="br">
            <xsl:call-template name="labelByTagName"/>
            <xsl:call-template name="getLabel">
                <xsl:with-param name="aVal" select="ce:PackingCode"/>
            </xsl:call-template>
            <xsl:apply-templates select="ce:PackingLevelCode"/>
            <xsl:if test="'' != ce:Description">
                <xsl:text> (</xsl:text>
                <xsl:apply-templates mode="mdTxt" select="ce:Description"/>
                <xsl:text>)</xsl:text>
            </xsl:if>
            <br/>
            <xsl:apply-templates select="ce:QuantityPerPacking"/>
            <div class="ce_stDetail">
                <xsl:call-template name="nLoopExceptBr">
                    <xsl:with-param name="aExcept">!PackingCode!PackingLevelCode!Description!QuantityPerPacking!</xsl:with-param>
                </xsl:call-template>
            </div>
        </div>
    </xsl:template>


    <!-- Cmt: AttachDetails_type : label(URL ) + ./URL + detail -->
    <xsl:template match="ce:AttachDetails">
        <xsl:call-template name="nLoopAndDetailBr">
            <xsl:with-param name="aDetailList">!URL!</xsl:with-param>
        </xsl:call-template>
    </xsl:template>



    <!-- Cmt_inline : 'ce:Dimension_type' : label(eltName) + @type + Lenght.unit x Widht.unit -->
    <xsl:template match="ce:SheetSize | ce:OverallFormat | ce:TrimmedSize | ce:Overflow">
        <xsl:call-template name="labelByTagName"/>
        <xsl:if test="@type">
            <xsl:text> </xsl:text>
            <xsl:value-of select="@type"/>
        </xsl:if>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="ce:Length"/>
        <xsl:text> x </xsl:text>
        <xsl:apply-templates select="ce:Width"/>
    </xsl:template>

    <!-- Cmt : 'DateInfo_type' : label(@type) + frm(@date) -->
    <xsl:template match="ce:DateInfo">
        <xsl:call-template name="getSpanLabel">
            <xsl:with-param name="aVal" select="@type"/>
        </xsl:call-template>
        <xsl:call-template name="getDateFormated">
            <xsl:with-param name="aVal" select="@date"/>
        </xsl:call-template>
    </xsl:template>



    <!-- Cmt_inline : Authors -->
    <xsl:template match="ce:Authors">
        <xsl:call-template name="labelByTagName"/>
        <xsl:for-each select="ce:Author">
            <xsl:value-of select="."/>
            <xsl:if test="position() &lt; last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <!-- Cmt_inline : 'Percentage_type' : label(tagName) +  text(@percent) -->
    <xsl:template match="ce:InkCoverage">
        <xsl:call-template name="labelByTagName"/>
        <xsl:value-of select="@percent"/>
    </xsl:template>


    <!-- Cmt_line  'ce:Measure_type' : label(eltName)  + . +  @unit  -->
    <xsl:template match="ce:PaperWeight | ce:PaperBulk | ce:PaperThickness | ce:PaperAllocation | ce:ReelWidth | ce:ReelLength | ce:ReelDiameter | ce:FrontFlapWitdh | ce:BackFlapWitdh | ce:TopFlapHeight | ce:BottomFlapHeight | ce:PackingWeight | ce:MaxPackingHeight | ce:MaxPackingWeight | ce:BoardWidth | ce:FrontFoamPaddingBulk | ce:RearFoamPaddingBulk | ce:Measurement">
        <xsl:call-template name="labelByTagName"/>
        <xsl:value-of select="."/>
        <xsl:call-template name="tplEx"/>
    </xsl:template>


    <!-- Cmt_inline  'ce:Certification_type' : label(eltName)  + bool(certified) +  .  -->
    <xsl:template match="ce:PaperCertification">
        <xsl:call-template name="labelByTagName"/>
        <xsl:choose>
            <xsl:when test="'' = @certified or 'yes' = @certified">
                <!-- nothing --> </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="getLabel">
                    <xsl:with-param name="aVal" select="NotCertified"/>
                </xsl:call-template>
                <xsl:text> </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="."/>
    </xsl:template>

    <!-- Cmt_inline 'ce:Folding_type' :  -->
    <xsl:template match="ce:Folding">
        <xsl:call-template name="getLabel">
            <xsl:with-param name="aVal" select="normalize-space(.)"/>
        </xsl:call-template>
        <xsl:for-each select="ce:FoldingType">
            <xsl:value-of select="."/>
            <xsl:if test="position() &lt; last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:if test="true() = @everFolded">
            <xsl:text> </xsl:text>
            <xsl:call-template name="getLabel">
                <xsl:with-param name="aVal" select="@everFolded"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


    <!-- #H4# Cmt_inlineLi or inlineDiv ... -->

    <!-- #H4# Cmt_inlineLi or inlineDiv ... -->

    <!-- Cmt_inlineLi 'SpecPapers_type' : label + loop.Paper -->
    <xsl:template match="ce:SpecPapers">
        <xsl:call-template name="labelByTagName"/>
        <ol>
            <xsl:for-each select="ce:Paper">
                <li>
                    <xsl:apply-templates select="*"/>
                </li>
            </xsl:for-each>
        </ol>
    </xsl:template>


    <!-- Cmt_inlineLi [niv] : 'ce:SpecColours_type' : label(eltName) + text(@date) -->
    <xsl:template match="ce:SpecColours">
        <xsl:call-template name="getSpanLabel">
            <xsl:with-param name="aVal" select="local-name()"/>
        </xsl:call-template>
        <xsl:for-each select="ce:Colour">
            <xsl:choose>
                <xsl:when test="'' != @location or 'both' = @location">
                    <!-- nothing : both = default --> </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@location"/>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="concat(ce:TotalNumberOfColours, ' + ', ce:NumberOfSpotColours)"/>

            <xsl:for-each select="ce:ColourReferences/ce:ColourRef">
                <xsl:if test="position() = 1 or @type != preceding-sibling::ce:ColourRe/@type">
                    <xsl:value-of select="@type"/>
                    <xsl:text> </xsl:text>
                </xsl:if>
                <xsl:value-of select="."/>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <!-- Cmt_inlineLi : 'SpecFiles_type' : label(tagName) + loop(Resource) list text(@date) -->
    <xsl:template match="ce:SpecFiles">
        <xsl:call-template name="labelByTagName"/>
        <ul>
            <xsl:for-each select="ce:Resource">
                <li>
                    <xsl:apply-templates select="."/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>


    <!--Cmt_inlineLi 'ce:Finishs_type'  -->
    <xsl:template match="ce:FinishsBloc | ce:FinishsEndpapers | ce:FinishsLooseInsert | ce:FinishsJacket | ce:FinishsSticker | ce:FinishsBinding">
        <xsl:call-template name="labelByTagName"/>
        <ul>
            <xsl:for-each select="ce:SpecialFinish">
                <li>
                    <xsl:call-template name="descriptionAndDetails"/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>


    <!-- #H4#  ref  -->

    <xsl:template name="lst_IdReference">
        <xsl:for-each select="ce:IdReference">
            <xsl:apply-templates select="."/>
            <br/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="ce:IdReference | ce:ItemReference | ce:DocumentReference">
        <xsl:call-template name="getSpanLabel">
            <xsl:with-param name="aList" select="local-name()"/>
            <xsl:with-param name="aVal" select="@domain"/>
        </xsl:call-template>
        <xsl:value-of select="@identifier"/>
    </xsl:template>

    <xsl:template name="lst_Extrinsic">
        <xsl:for-each select="ce:Extrinsic">
            <xsl:apply-templates select="."/>
            <br/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="ce:Extrinsic">
        <span class="font-italic">
            <xsl:call-template name="getSpanLabel">
                <xsl:with-param name="aList" select="local-name()"/>
                <xsl:with-param name="aVal" select="@name"/>
            </xsl:call-template>
            <xsl:value-of select="."/>
        </span>
    </xsl:template>


    <!--Cmt_inlineBr: [detail[niv]] 'TaxDetail'  -->
    <xsl:template match="ce:TaxDetail">
        <xsl:call-template name="textLabelByTagName"/>
        <xsl:call-template name="getLabelSeprator"/>
        <!--
<x.l:apply-templates select="*[local-name() != 'TaxAmount']"/>
<x.l:apply-templates mode="mdTxt" select="ce:TaxAmount"/>        
-->
        <xsl:apply-templates select="*"/>
    </xsl:template>

    <!--Cmt_inlineBr: [niv] '' -->
    <xsl:template match="ce:PostalAddress">
        <xsl:param name="aName"/>
        <address>
            <xsl:if test="'' != @name">
                <xsl:call-template name="nLoopBrVal">
                    <xsl:with-param name="aVal">
                        <xsl:call-template name="getSpanLabel">
                            <xsl:with-param name="aVal">Identifier</xsl:with-param>
                      </xsl:call-template>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="@name"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:if>
            <xsl:call-template name="nLoopBr"/>
        </address>
    </xsl:template>

    <!--Cmt_inlineBr: '' -->
    <xsl:template match="ce:ShipStatus">
        <xsl:if test="'' != @itemOutId or '' != @trackingId">
            <div class="br">
                <xsl:call-template name="labelByTagName"/>
                <br/>
                <span class="ml-4 pl-4">&#160;</span>
                <xsl:apply-templates mode="mdAttOpt" select="@*"/>
            </div>
        </xsl:if>
    </xsl:template>


</xsl:stylesheet>
