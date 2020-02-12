<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" exclude-result-prefixes="ce" version="1.0">
    <!-- info see parent 'ph_main.xsl' -->

    <!-- #H2# preinclude -->
    <!--x.l:include href="../../lib/common_xsl/i18n_xsl.xsl"/-->
    <!--x.l:include href="../../lib/common_xsl/common_xsl.xsl"/-->

    <!-- #H2# TEMPLATE -->

    <!-- #H4# contextual sub-template -->

    <xsl:template name="refIntExt_mdRow">
        <!--Cmt: [@ ce:IdReference|ce:Extrinsic, parent level] -->
        <div class="row border">
            <div class="col-6">
                <xsl:call-template name="lst_IdReference"/>
            </div>
            <div class="col-6">
                <xsl:call-template name="lst_Extrinsic"/>
            </div>
        </div>
    </xsl:template>


    <xsl:template name="DescriptionAndDetail_mdRow">
        <xsl:param name="aDisplayTags">!Description!</xsl:param>
        <xsl:for-each select="*">
            <xsl:choose>
                <xsl:when test="contains($aDisplayTags, concat('!', local-name(), '!'))">
                    <xsl:apply-templates mode="mdRow" select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <div class="row border ce_stDetail">
                        <div class="col-12">
                            <xsl:call-template name="nLoopExceptBr">
                                <xsl:with-param name="aExcept" select="$aDisplayTags"/>
                            </xsl:call-template>
                        </div>
                    </div>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>


    <!-- #H4#  mdRow : div/@class=row -->

    <!--Cmt_Row: 'ce:longString_type' -->
    <xsl:template mode="mdRow" match="ce:Personalization | ce:Description | ce:OrderDesc | ce:RegularizationReason">
        <div class="row border">
            <div class="col-12">
                <xsl:call-template name="labelByTagName"/>
                <br/>
                <xsl:call-template name="break">
                    <xsl:with-param name="text" select="."/>
                </xsl:call-template>
            </div>
        </div>
    </xsl:template>




    <xsl:template mode="mdRow" match="ce:Comment | ce:Penalties | ce:OrderDesc ">
        <div class="row border">
            <div class="col-12">
                <xsl:call-template name="labelByTagName"/>
                <br/>
                <xsl:call-template name="tplHtmlLike">
                    <xsl:with-param name="aVal" select="."/>
                </xsl:call-template>
            </div>
        </div>
    </xsl:template>


    <xsl:template name="buyerBillTo_mdRow">
        <!-- Cmt: [OrderRequestHeader] Buyer + BillTo  -->
        <div class="row">
            <div class="col-6 border">
                <xsl:apply-templates select="./ce:Buyer[1]" mode="mdHeader"/>
            </div>
            <div class="col-6 border">
                <xsl:apply-templates select="./ce:BillTo[1]" mode="mdHeader"/>
            </div>
        </div>
    </xsl:template>


    <!--Cmt_Row:  -->
    <xsl:template mode="mdRow" match="ce:Total">
        <div class="row">
            <div class="col-3">
                <xsl:call-template name="getSpanLabel">
                    <xsl:with-param name="aVal">Total</xsl:with-param>
                </xsl:call-template>
            </div>
            <div class="col-9">
                <xsl:apply-templates select="./ce:Money"/>
            </div>
        </div>
    </xsl:template>


    <!--Cmt_Row: 'ce:Tax_type' -->
    <xsl:template mode="mdRow" match="ce:Tax">
        <div class="row">
            <div class="col-3">
                <xsl:apply-templates mode="mdTxt" select="ce:Description"/>
            </div>
            <div class="col-9">
                <xsl:apply-templates select="ce:Money"/>
                <div class="ce_stDetail">
                    <xsl:call-template name="nLoopExceptBr">
                        <xsl:with-param name="aExcept">!Description!Money!</xsl:with-param>
                    </xsl:call-template>
                </div>
            </div>
        </div>
    </xsl:template>


    <!--Cmt_Row: 'ce:Text_type' -->
    <xsl:template mode="mdRow" match="ce:TermOfSales | ce:FlatPlanDescription">
        <div class="row">
            <div class="col-12">
                <xsl:call-template name="labelByTagName"/>
                <br/>
                <xsl:call-template name="tplHtmlLike">
                    <xsl:with-param name="aVal" select="."/>
                </xsl:call-template>
            </div>
        </div>
    </xsl:template>




    <!-- Cmt_RowOrInline 'OrderReference_type' -->
    <xsl:template match="ce:OrderReference">
        <xsl:choose>
            <xsl:when test="parent::ce:OrderDetails">
                <xsl:apply-templates mode="md_n40" select="." />
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates mode="mdRow" select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template mode="mdRow" match="ce:DocumentReference | ce:OrderReference | ce:InvoiceReference | ce:MasterAgreementReference | ce:QuotationReference | ce:CreditReference">
        <div class="row justify-content-between">
            <div class="col-6">
                <span class="font-weight-bold">
                    <xsl:call-template name="textLabelByTagName"/>
                    <xsl:text> </xsl:text>
                </span>
                <xsl:if test="@documentType">
                    <xsl:call-template name="getSpanLabel">
                        <xsl:with-param name="aList">document_type_list_type</xsl:with-param>
                        <xsl:with-param name="aVal" select="@documentType"/>
                    </xsl:call-template>
                </xsl:if>
            </div>
            <div class="col-6">
                <div>
                    <xsl:apply-templates select="@payloadId"/>
                </div>
                <div>
                    <xsl:apply-templates select="@documentId"/>
                </div>
                <div>
                    <xsl:apply-templates select="@documentDate"/>
                </div>
            </div>
        </div>
    </xsl:template>


    <!-- Cmt_Row 'OrderStatus_Status' -->
    <xsl:template mode="mdRow" match="ce:OrderStatus">
        <div class="row">
            <div class="col-12">
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>



    <!-- Cmt_Row 'Sheet_type' -->
    <xsl:template mode="mdRow" match="ce:Sheet">
        <div class="row">
            <div class="col-3">
                <xsl:apply-templates select="ce:GrainDirection"/>
            </div>
            <div class="col-9">
                <xsl:apply-templates select="ce:SheetSize"/>
            </div>
        </div>
    </xsl:template>

    <!-- Cmt_Row 'Reel_type' -->
    <xsl:template mode="mdRow" match="ce:Reel">
        <div class="row">
            <div class="col-2">
                <xsl:apply-templates select="ce:ReelWidth"/>
            </div>
            <div class="col-2">
                <xsl:if test="ce:ReelDiameter">
                    <xsl:apply-templates select="ce:ReelDiameter"/>
                </xsl:if>
            </div>
            <div class="col-2">
                <xsl:if test="ce:ReelLength">
                    <xsl:apply-templates select="ce:ReelLength"/>
                </xsl:if>
            </div>
            <div class="col-2">
                <xsl:if test="ce:CoreDiameter">
                    <xsl:apply-templates select="ce:CoreDiameter"/>
                </xsl:if>
            </div>
            <div class="col-2">
                <xsl:if test="ce:MaxCoreDiameter">
                    <xsl:apply-templates select="ce:MaxCoreDiameter"/>
                </xsl:if>
            </div>
            <div class="col-2">
                <xsl:if test="ce:MaxReelWeight">
                    <xsl:apply-templates select="ce:MaxReelWeight"/>
                </xsl:if>
            </div>
        </div>
    </xsl:template>


    <!-- Cmt_Row 'Packing_type' -->
    <xsl:template mode="mdRow" match="ce:GeneralPaperPacking">
        <div class="row">
            <div class="col-3">
                <span class="font-weight-bold">
                    <xsl:call-template name="textLabelByTagName"/>
                </span>
            </div>
            <div class="col-9">
                <xsl:value-of select="./ce:Description"/>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <xsl:apply-templates select="ce:PackingCode"/>
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="ce:PackingLevelCode"/>
            </div>
            <div class="col-3">
                <xsl:apply-templates select="ce:ShippingMark"/>
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="ce:QuantityPerPacking"/>

                <xsl:text>&#160;(</xsl:text>
                <xsl:call-template name="getLabel">
                    <xsl:with-param name="aVal" select="'WrappingType'"/>
                </xsl:call-template>
                <xsl:call-template name="getLabelSeprator"/>
                <xsl:apply-templates select="ce:WrappingType"/>
            </div>
            <div class="col-3">
                <xsl:call-template name="getLabel">
                    <xsl:with-param name="aVal" select="'UnitPerPallet'"/>
                </xsl:call-template>
                <xsl:apply-templates select="ce:UnitPerPallet"/>
                <xsl:text>&#160;(</xsl:text>
                <xsl:call-template name="getLabel">
                    <xsl:with-param name="aVal" select="'WrappingType'"/>
                </xsl:call-template>
                <xsl:call-template name="getLabelSeprator"/>
                <xsl:apply-templates select="ce:WrappingType"/>
            </div>
            <div class="col-3">
                <xsl:apply-templates select="ce:PackingWeight"/>
                <xsl:apply-templates select="ce:MaxPackingHeight"/>
                <xsl:apply-templates select="ce:MaxPackingWeight"/>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <xsl:call-template name="break">
                    <xsl:with-param name="text" select="ce:QuantityVarianceNote"/>
                </xsl:call-template>
            </div>
            <div class="col-6">
                <xsl:call-template name="break">
                    <xsl:with-param name="aVal" select="ce:Comments"/>
                </xsl:call-template>
            </div>
        </div>
        <xsl:call-template name="refIntExt_mdRow"/>
    </xsl:template>

    <!-- Cmt_push_row 'ce:BookSpecGeneral_type' -->
    <xsl:template match="ce:BookSpecGeneral">
        <div class="row">
            <div class="col-12">
                <xsl:call-template name="nLoopExceptBr">
                    <xsl:with-param name="aExcept">!FlatPlanDescription!InkSpecification!ImpositionDesc!Comment!IdReference!Extrinsic!</xsl:with-param>
                </xsl:call-template>
            </div>
        </div>
        <xsl:apply-templates select="ce:FlatPlanDescription" mode="mdRow"/>
        <xsl:apply-templates select="ce:InkSpecification" mode="mdRow"/>
        <xsl:apply-templates select="ce:ImpositionDesc" mode="mdRow"/>
        <xsl:apply-templates select="ce:Comment" mode="mdRow"/>
        <xsl:call-template name="refIntExt_mdRow"/>

    </xsl:template>


    <!-- Cmt_row 'ce:BookComponentBase_type'  label(tagName + @type?) inlineBr + row(Personalization|Comment) -->
    <xsl:template match="ce:BookComponentBloc | ce:BookComponentCover | ce:BookComponentEndpapers | ce:BookComponentLooseInsert | ce:BookComponentJacket | ce:BookComponentSticker | ce:BookComponentStrip">
        <div class="row border">
            <div class="col-4">
                <xsl:apply-templates select="@id" mode="mdInlineBr"/>
                <xsl:apply-templates select="@quantity"/>
            </div>
            <div class="col-8">
                <xsl:call-template name="labelByTagName"/>
                <xsl:if test="@type">
                    <xsl:text> -  </xsl:text>
                    <xsl:call-template name="getLabel">
                        <xsl:with-param name="aVal" select="string(@type)"/>
                    </xsl:call-template>
                </xsl:if>
            </div>
        </div>
        <div class="row border">
            <div class="col-12">
                <xsl:call-template name="nLoopExceptBr">
                    <xsl:with-param name="aExcept">!Personalization!Comment!</xsl:with-param>
                </xsl:call-template>
            </div>
        </div>
        <xsl:apply-templates mode="mdRow" select="ce:Personalization | ce:Comment"/>
    </xsl:template>


    <!-- Cmt_Row 'BookBinding_type' comment + desciption + detail(others) -->
    <xsl:template match="ce:BookBinding">
        <div class="row border">
            <div class="col-12">
                <xsl:call-template name="labelByTagName"/>
                <xsl:text> - </xsl:text>
                <xsl:call-template name="getLabel">
                    <xsl:with-param name="aList" select="@type"/>
                </xsl:call-template>
            </div>
        </div>
        <xsl:call-template name="DescriptionAndDetail_mdRow">
            <xsl:with-param name="aDisplayTags">!Comment!Description!</xsl:with-param>
        </xsl:call-template>
        <!-- tocheck bb -->
    </xsl:template>


    <!-- Cmt_Row 'BookBinding_type/ServicesBinding/Service*' label(tagName) + apply -->
    <xsl:template match="ce:ServiceRoundedCorners | ce:ServiceDieCutting | ce:ServiceCoverStamping | ce:ServiceCoverEmbossing | ce:ServiceMottle | ce:ServiceGilding | ce:ServiceJacketLaying | ce:ServiceStripLaying | ce:ServiceStickerLaying | ce:ServiceInsertOperation | ce:ServiceCdOperation | ce:ServiceBookletBinding">
        <div class="row border">
            <div class="col-12">
                <xsl:call-template name="labelByTagName"/>
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>


    <!-- Cmt_Row 'BookBinding_type/ServicesBinding' label(tagName) apply -->
    <xsl:template match="ce:ServicesBinding">
        <!-- doc: Prestations complémentaires  -->
        <div class="row border bg-secondary text-white">
            <div class="col-12">
                <xsl:call-template name="labelByTagName"/>
            </div>
        </div>
        <xsl:apply-templates mode="mdRow">
            <!-- tocheck sb --> </xsl:apply-templates>
    </xsl:template>



    <xsl:template mode="mdRow" match="ce:PaymentTerms">
        <div class="row">
            <div class="col-3">
                <xsl:call-template name="getSpanLabel">
                    <xsl:with-param name="aVal">PaymentTerms</xsl:with-param>
                </xsl:call-template>
            </div>
            <div class="col-9">
                <xsl:apply-templates mode="mdTxt" select="."/>
            </div>
        </div>
    </xsl:template>



    <!--Cmt:  'ItemOutAdjust_type' -->
    <xsl:template mode="mdRow" match="ce:ItemOut">
        <div class="row">
            <div class="col-4">
                <xsl:apply-templates select="@itemOutId"/>
            </div>
            <div class="col-4">
                <xsl:apply-templates select="@requestedDeliveryDate"/>
            </div>
            <div class="col-4">
                <xsl:apply-templates select="@requestedShipmentDate"/>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <xsl:for-each select="ce:ShipmentItems/ce:ShipmentItem">
                    <!--Cmt:  'ShipmentItemAdjust_type' -->
                    <xsl:value-of select="concat('[', ce:ItemId/ce:LineItemId/@identifier, ']')"/>
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="getSpanLabel">
                        <xsl:with-param name="aVal">Quantity</xsl:with-param>
                    </xsl:call-template>
                    <xsl:apply-templates select="ce:Quantity" mode="md_n10"/>
                    <br/>
                    <xsl:call-template name="lst_IdReference"/>
                    <br/>
                </xsl:for-each>
            </div>
        </div>
        <xsl:apply-templates mode="mdRow" select="ce:Comment"/>
        <xsl:call-template name="refIntExt_mdRow"/>
    </xsl:template>

    <!-- Cmt mdRow encapsulation -->
    <xsl:template mode="mdRow" match="ce:InvoiceStatus | ce:CreditStatus | ce:AdministrativeStatus | ce:ProductionStatus | ce:OrderInvoiceStatus">
        <div class="row">
            <div class="col-12">
                <xsl:apply-templates select="."/>
            </div>
        </div>
    </xsl:template>
    
    <!-- Cmt mdRow to "mode normal" -->
    <xsl:template mode="mdRow" match="ce:OtherStatus">
        <xsl:apply-templates select="."/>
    </xsl:template>
                
</xsl:stylesheet>
