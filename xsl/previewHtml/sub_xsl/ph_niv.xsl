<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:i_d="http://internal/data" xmlns:exslt="http://exslt.org/common" extension-element-prefixes="exslt" exclude-result-prefixes="ce i_d" version="1.0">
    <!-- info see parent 'ph_main.xsl' -->

    <!-- #H2# preinclude -->
    <!--x.l:include href="../../lib/common_xsl/i18n_xsl.xsl"/-->
    <!--x.l:include href="../../lib/common_xsl/common_xsl.xsl"/-->
    <!--x.l:include href="./ph_loop.xsl"/-->
    <!--x.l:include href="./ph_nivDef.xsl"/-->

    <!-- #H4# tpl by [niv] or mode -->
    <!-- ================= -->

    <!-- ==== NIV10 : TEXT -->

    <xsl:template match="ce:Name">
        <xsl:call-template name="n10"/>
    </xsl:template>

    <xsl:template match="ce:TotalAmount">
        <xsl:call-template name="n10"/>
    </xsl:template>

    <!--Cmt 'xs:string' -->
    <xsl:template match="ce:Author">
        <xsl:call-template name="n10"/>
    </xsl:template>

    <!--Cmt '' -->
    <xsl:template match="ce:TaxableAmount | ce:UnitPrice | ce:SubtotalAmount">
        <xsl:call-template name="n10"/>
    </xsl:template>



    <!--Cmt 'wireo_material_list_type' -->
    <xsl:template match="ce:Material">
        <xsl:call-template name="n11"/>
    </xsl:template>
    <!--Cmt 'wireo_perfo_list_type' -->
    <xsl:template match="ce:PerfoType">
        <xsl:call-template name="n11"/>
    </xsl:template>
    <!--Cmt 'wireo_position_list_type' -->
    <xsl:template match="ce:Position">
        <xsl:call-template name="n11"/>
    </xsl:template>
    <!--Cmt 'wireo_type_list_type' -->
    <xsl:template match="ce:Type">
        <xsl:call-template name="n11"/>
    </xsl:template>

    <!--Cmt n11 : '_*_list_type' list traduction  -->
    <xsl:template match="ce:VarnishType | ce:VarnishFeature | ce:VarnishTechno | ce:PackingCode | ce:LaminationType">
        <xsl:call-template name="n11"/>
    </xsl:template>


    <!-- Cmt_value : text + unit  -->
    <xsl:template match="ce:Money | ce:Price | ce:PaperBasisWeight | ce:Length | ce:Width | ce:CoreDiameter | ce:MaxCoreDiameter | ce:MaxReelWeight | ce:UnitWeight | ce:TotalWeight">
        <xsl:call-template name="n13"/>
    </xsl:template>



    <xsl:template match="ce:Certification">
        <xsl:call-template name="n14"/>
    </xsl:template>

    <!-- ==== NIV20 LIGNE :span.libelle + content (sans BR) -->


    <xsl:template match="ce:ServiceIdValue | ce:Composition | ce:ItemDescriptionSupplier | ce:ItemDescriptionBuyer | ce:InitialStock | ce:FinalStock">
        <xsl:call-template name="n20"/>
    </xsl:template>

    <!--Cmt 'xs:boolean' -->
    <xsl:template match="ce:Bookblock | ce:CoEditionRunOn | ce:Cover | ce:Creasing | ce:GluedHinge | ce:ManualOperation | ce:PaperSplitting | ce:Paperback | ce:SelfEndpapers | ce:WrappingFlaps">
        <xsl:call-template name="n20"/>
    </xsl:template>

    <!--Cmt 'xs:boolean' -->
    <xsl:template match="ce:IsSewn">
        <xsl:call-template name="n22"/>
    </xsl:template>

    <!--Cmt '' -->
    <xsl:template match="ce:CargoVessel | ce:UnitCarrier | ce:Train | ce:FreightTrain | ce:Truck | ce:FreightTrainan | ce:Car | ce:Taxi | ce:Motor | ce:Ship">
        <xsl:call-template name="n22"/>
    </xsl:template>

    <xsl:template match="ce:BoardColor">
        <xsl:call-template name="n22"/>
    </xsl:template>



    <!--Cmt 'VarnishPercentage_type' -->
    <xsl:template match="ce:VarnishArea">
        <xsl:call-template name="n24">
            <xsl:with-param name="aTxt">
                <xsl:if test="@percent">
                    <xsl:value-of select="concat(' ', @percent, '% ')"/>
                </xsl:if>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- ==== NIV30 : LIGNE + BR -->

    <xsl:template match="ce:OtherStatus">
        <xsl:call-template name="n30"/>
    </xsl:template>

    <xsl:template match="ce:DeliveryItem/ce:OrderRequestPaperItem/ce:PaperBasisWeight | /ce:PaperItem/ce:PaperBasisWeight">
        <!-- dt_delivery | dt_mouvement -->
        <xsl:call-template name="n30"/>
    </xsl:template>

    <xsl:template match="ce:Society | ce:Department | ce:ShippingInstructions | ce:ComponentDescription | ce:Lamination | ce:ServiceFeature">
        <xsl:call-template name="n30"/>
    </xsl:template>

    <xsl:template match="ce:AttachmentReference | ce:DeliveryProof | ce:Resource">
        <!-- cmt 'AttachmentReference_type' -->
        <xsl:call-template name="n30"/>
    </xsl:template>

    <xsl:template match="ce:ProductDescription | ce:NumberOfSigns">
        <xsl:call-template name="n30"/>
    </xsl:template>



    <xsl:template match="ce:FrontEndpapersType | ce:BackEndpapersType | ce:SpineType">
        <xsl:call-template name="n30"/>
    </xsl:template>


    <xsl:template match="ce:Email | ce:Fax | ce:URL | ce:Protocol | ce:ResourceMode | ce:ResourceFormat | ce:Protocol | ce:Host | ce:Port | ce:Identity | ce:SharedSecret | ce:Checksum | ce:Size">
        <xsl:call-template name="n30"/>
    </xsl:template>

    <!--Cmt 'xs:string' -->
    <xsl:template match="ce:Air | ce:GildingRef | ce:Mail | ce:ShippingContractNumber | ce:UnknownRoute">
        <xsl:call-template name="n30"/>
    </xsl:template>


    <xsl:template match="ce:BankNationalId | ce:BankAccountName | ce:BankAccountNumber | ce:SwiftCode | ce:IbanCode">
        <xsl:call-template name="n30"/>
    </xsl:template>

    <xsl:template match="ce:PaymentPartner | ce:SupplierPartId | ce:BuyerPartId">
        <xsl:call-template name="n30"/>
    </xsl:template>


    <xsl:template match="ce:Sheet | ce:Reel">
        <xsl:choose>
            <xsl:when test="parent::ce:PaperItem">
                <!-- dt_mouvement -->
                <xsl:call-template name="n40"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="n30"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- Cmt_lines : 'ce:Plate_type' : label(eltName) + loop.children.br -->
    <xsl:template match="ce:Plate | ce:StitchingDetails | ce:SoftcoverDetails | ce:HardcoverDetails | ce:BookblockDetails | ce:IntegraDetails">
        <xsl:call-template name="n30"/>
    </xsl:template>

    <!-- Cmt_lines in 'delivery' -->
    <xsl:template match="ce:GeneralPaperPacking">
        <xsl:call-template name="n30"/>
    </xsl:template>


    <xsl:template match="ce:Section">
        <xsl:call-template name="n31">
            <xsl:with-param name="aTxt">
                <xsl:if test="@componentId">
                    <xsl:value-of select="concat(' [', @componentId, '] ')"/>
                </xsl:if>
                <br/>
                <xsl:text> </xsl:text>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ce:PaymentMethod">
        <xsl:call-template name="n31">
            <xsl:with-param name="aTxt">
                <xsl:value-of select="@value"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ce:ItemId">
        <xsl:call-template name="n31"/>
    </xsl:template>

    <xsl:template match="ce:InvoiceDetailItemReference">
        <xsl:call-template name="n28">
            <xsl:with-param name="aTxt">
                <xsl:if test="@lineNumber">
                    <xsl:value-of select="concat(' [', @lineNumber, '] ')"/>
                </xsl:if>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ce:Phone">
        <xsl:call-template name="n33">
            <xsl:with-param name="aEltNodeLst" select="ce:TelephoneNumber"/>
            <xsl:with-param name="aSep" select="', '"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="n33_CarrierIdentifier">
        <xsl:call-template name="n33">
            <xsl:with-param name="aEltNodeLst" select="ce:CarrierIdentifier"/>
            <xsl:with-param name="aSep" select="', '"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ce:TransportInformation">
        <xsl:call-template name="n31"/>
    </xsl:template>

    <xsl:template match="ce:InvoiceStatus | ce:CreditStatus | ce:AdministrativeStatus | ce:ProductionStatus | ce:OrderInvoiceStatus">
        <xsl:call-template name="n34"/>
    </xsl:template>

    <xsl:template match="ce:ProductDetail">
        <xsl:call-template name="n38">
            <xsl:with-param name="aTxt">
                <span class="font-weight-bold">
                    <xsl:value-of select="@type"/>
                    <xsl:call-template name="getLabelSeprator"/>
                </span>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- ==== NIV40 : MULTILIGNES + details -->

    <xsl:template match="ce:Flaps | ce:FlapsJacket | ce:FinishsCover | ce:FinishsStrip">
        <xsl:call-template name="n40"/>
    </xsl:template>

    <!-- Cmt_push_row 'ce:ServiceIdentifier_type' -->
    <xsl:template match="ce:ServiceIdentifier">
        <xsl:call-template name="n41">
            <xsl:with-param name="aTxt">
                <xsl:if test="@sequence">
                    <xsl:value-of select="concat(' [', @sequence, '] ')"/>
                </xsl:if>
                <br/>
                <xsl:text> </xsl:text>
            </xsl:with-param>
            <xsl:with-param name="aDetailList">!Description!ProductDetail!IdReference!Extrinsic!</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ce:PaymentTerms">
        <xsl:call-template name="n41">
            <xsl:with-param name="aTxt">
                <xsl:apply-templates mode="mdTxt" select="."/>
            </xsl:with-param>
            <xsl:with-param name="aDetailList">!InvoiceInstructions!Comment!IdReference!Extrinsic!</xsl:with-param>
        </xsl:call-template>
    </xsl:template>




    <!--Cmt 'Varnish_type' -->
    <xsl:template match="ce:Varnish">
        <xsl:call-template name="n41">
            <xsl:with-param name="aTxt">
                <xsl:if test="@percent">
                    <xsl:value-of select="concat(' ', @percent, '% ')"/>
                </xsl:if>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Cmt 'DocumentReference_type' -->
    <xsl:template mode="md_n40" match="ce:OrderReference">
        <div class="br">
            <xsl:call-template name="labelByTagName"/>
        </div>
        <xsl:apply-templates mode="md_n40" select="@*"/>
    </xsl:template>



    <!-- ==== NIV50 : CELL-->
    <xsl:template match="ce:Route">
        <xsl:call-template name="n50">
            <xsl:with-param name="aTxt">
                <xsl:if test="@startDate or @endDate">
                    <xsl:value-of select="concat(' [', @startDate, ' - ', @endDate, '] ')"/>
                </xsl:if>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!--Cmt 'WireoDetails_type' -->
    <xsl:template match="ce:WireoDetails">
        <xsl:call-template name="n50"/>
    </xsl:template>



    <!-- ==== TODO -->

    <!--Cmt '' -->
    <xsl:template match="ce:ServiceIdType">
        <xsl:call-template name="n20"/>
    </xsl:template>

</xsl:stylesheet>
