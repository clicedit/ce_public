<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:i_d="http://internal/data" xmlns:exslt="http://exslt.org/common" exclude-result-prefixes="ce i_d exslt" version="1.0">
    <!--
======= <labels> validation with "i18n_xsd.xsd":
xmlns="http://internal/data" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://internal/data i18n_xsd.xsd" 
-->
    <xsl:variable name="vLabels_out">
        <labels xmlns="http://internal/data" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://internal/data i18n_xsd.xsd">
            <!--cmt:  use default namespace "http://internal/data" -->
            <!-- [PREFIX: FOR, REMARKS] -->

            <!-- yes/no  -->
            <lb k="yes">
                <en>yes</en>
                <fr>oui</fr>
            </lb>
            <lb k="no">
                <en>no</en>
                <fr>non</fr>
            </lb>

            <!-- common MAN -->
            <lb k="Identifier">
                <!-- Identifiant interne pour : PostalAddress/@name, ... -->
                <en>Identifier</en>
                <fr>Identifiant</fr>
            </lb>

            <!-- common MAN see "Clic.EDIt_referentiels.xlsx" -->
            <lb l="net_or_eom_list_type" k="net">
                <!-- jour indiqué -->
                <en>net</en>
                <fr>net</fr>
            </lb>
            <lb l="net_or_eom_list_type" k="eom">
                <en>eom</en>
                <fr>fin de mois</fr>
            </lb>

            <!-- common date MAN //TODO -->
            <lb k="orderDate">
                <en>order date</en>
                <fr>date de la commande</fr>
            </lb>
            <lb k="invoiceDate">
                <en>invoice date</en>
                <fr>date de facturation</fr>
            </lb>
            <lb k="dueDate">
                <en>due date</en>
                <fr>date d'échéance</fr>
            </lb>
            <lb k="documentDate">
                <en>document date</en>
                <fr>date du document</fr>
            </lb>
            <lb k="endDate">
                <en>endDate</en>
            </lb>
            <lb k="startDate">
                <en>start date</en>
            </lb>

            <lb k="requestedDeliveryDate">
                <en>requested ddelivery date</en>
            </lb>
            <lb k="expectedDeliveryDate">
                <en>expected delivery date</en>
            </lb>
            <lb k="realDeliveryDate">
                <en>real delivery date</en>
            </lb>

            <lb k="requestedShipmentDate">
                <en>requested shipment date</en>
            </lb>
            <lb k="realShippingDate">
                <en>real shipping date</en>
            </lb>

            <lb k="statusRequestDate">
                <en>status request date</en>
            </lb>
            <lb k="statusResponseDate">
                <en>status response date</en>
            </lb>

            <!-- [dt_ : Document Title]  -->
            <lb k="dt_ack" m="acknowledgment">
                <en>Acknowledgment</en>
                <fr>Acquittement</fr>
            </lb>
            <lb k="dt_OrderRequest">
                <en>Order</en>
                <fr>Commande</fr>
            </lb>
            <lb k="dt_OrderRequestResponse">
                <en>Order response_</en>
                <fr>Retour commande_</fr>
            </lb>
            <lb k="dt_InvoiceDetailRequest">
                <en>Invoice</en>
                <fr>Facture</fr>
            </lb>
            <lb k="dt_InvoiceDetailRequestResponse">
                <en>Invoice response_</en>
                <fr>Retour facture_</fr>
            </lb>
            <!-- navigation -->
            <lb l="nav" k="OrderRequest_Item">
                <en>Items_</en>
                <fr>Items_</fr>
            </lb>
            <lb l="nav" k="ItemOut">
                <en>ItemOut_</en>
                <fr>Livraison_</fr>
            </lb>
            <lb l="nav" k="InvoiceDetailSummary">
                <en>Summary</en>
                <fr>Récapitualitf</fr>
            </lb>
            <!-- -->
            <lb k="orderDate">
                <en>Order date</en>
                <fr>Date commande</fr>
            </lb>
            <lb k="orderType">
                <en>Order Type</en>
                <fr>Type de commande</fr>
            </lb>
            <!-- -->
            <lb k="ot_regular" m=" orderType value">
                <en>regular</en>
                <fr>commande unitaire classique </fr>
            </lb>
            <lb k="ot_release" m=" orderType value">
                <en>commande liée à un contrat cadre ou à une commande ouverte</en>
                <fr/>
            </lb>
            <lb k="ot_blanket" m=" orderType value">
                <en>blanket</en>
                <fr>commande ouverte (création)</fr>
            </lb>

            <lb k="type">
                <en>Type</en>
                <fr>Type</fr>
            </lb>
            <lb k="type_new">
                <en>new</en>
                <fr>création</fr>
            </lb>
            <lb k="type_delete">
                <en>delete</en>
                <fr>suppression</fr>
            </lb>
            <lb k="type_update">
                <en>update</en>
                <fr>modification</fr>
            </lb>
            <lb k="type_replace">
                <en>replace</en>
                <fr>nouvelle commande de remplacement</fr>
            </lb>
            <!-- -->
            <lb k="shipComplete">
                <en>Ship Complete</en>
                <fr>Livraison unique</fr>
            </lb>
            <!-- -->
            <lb k="From">
                <en>From</en>
                <fr>De</fr>
            </lb>
            <lb k="To">
                <en>To</en>
                <fr>A</fr>
            </lb>
            <lb k="Buyer">
                <en>Buyer</en>
                <fr>Acheteur</fr>
            </lb>
            <lb k="BillTo">
                <en>BillTo</en>
                <fr>Facturé à</fr>
            </lb>
            <lb k="Phone">
                <en>Phone</en>
                <fr>De</fr>
            </lb>
            <lb k="IdReference">
                <en>Reference</en>
                <fr>Réference</fr>
            </lb>
            <lb k="Extrinsic">
                <en>External reference</en>
                <fr>Réference externe</fr>
            </lb>
            <lb k="unknownRole">
                <en>Undefined Role</en>
                <fr>Role non défini</fr>
            </lb>
            <!-- -->
            <lb k="InvoiceInstructions">
                <en>InvoiceInstructions</en>
                <fr>Mode de règlement_</fr>
            </lb>
            <lb k="DeliveryPeriod">
                <en>DeliveryPeriod</en>
                <fr>Période de livraison_</fr>
            </lb>

            <lb k="PaymentTerms">
                <en>Payment Terms</en>
                <fr>Conditions de payment</fr>
            </lb>

            <lb k="Quantity">
                <en>Quantity</en>
                <fr>Quantité</fr>
            </lb>
            <lb k="PricePerUnit">
                <en>Price Per Unit</en>
                <fr>Prix unitaire</fr>
            </lb>

            <lb k="UnitOfMeasure">
                <en>Unit Of Measure</en>
                <fr>Unité</fr>
            </lb>
            <lb k="days">
                <en>days</en>
                <fr>jours</fr>
            </lb>
            <lb k="l">
                <en>days</en>
                <fr>jours</fr>
            </lb>
            <lb k="monthDay1">
                <en> </en>
                <fr>le</fr>
            </lb>
            <lb k="monthDay2">
                <en>month day_ </en>
                <fr>du mois</fr>
            </lb>
            <lb k="dateRef">
                <en>reference date_</en>
                <fr>date de référence_</fr>
            </lb>
            <lb k="Partial delivery">
                <en>Partial delivery_</en>
                <fr>Livraison partielle_</fr>
            </lb>
            <lb k="Complete delivery">
                <en>Complete delivery_</en>
                <fr>Livraison complete_</fr>
            </lb>
            <lb k="requestedDeliveryDate1">
                <en>delivey for_</en>
                <fr>livraison pour le</fr>
            </lb>
            <lb k="requestedShipmentDate">
                <en>requested shipment date_</en>
                <fr>date d'expédition</fr>
            </lb>
            <lb k="ShipTo">
                <en>Ship To</en>
                <fr>Destinataire</fr>
            </lb>
            <lb k="CarrierIdentifier">
                <en>Carrier Identifier</en>
                <fr>Transporteur_</fr>
            </lb>
            <lb k="Tolerances">
                <en>Tolerances</en>
                <fr>Tolerances_</fr>
            </lb>
            <lb k="Packing">
                <en>Packing</en>
                <fr>Mode de livraison</fr>
            </lb>
            <lb k="GrainDirection">
                <en>Grain Direction</en>
                <fr>GrainDirection_</fr>
            </lb>
            <lb k="SheetSize">
                <en>Size</en>
                <fr>Dimension_</fr>
            </lb>
            <!--  -->
            <lb k="ReelWidth">
                <en>ReelWidth</en>
                <fr>La laize de la bobine</fr>
            </lb>
            <lb k="ReelDiameter">
                <en>ReelDiameter</en>
                <fr>Le diamètre de la bobine</fr>
            </lb>
            <lb k="ReelLength">
                <en>ReelLength</en>
                <fr>La longueur de la bobine</fr>
            </lb>
            <lb k="CoreDiameter">
                <en>CoreDiameter</en>
                <fr>Le diamètre du mandrin</fr>
            </lb>
            <lb k="MaxCoreDiameter">
                <en>MaxCoreDiameter</en>
                <fr>Le diamètre maximum du mandrin</fr>
            </lb>
            <lb k="MaxReelWeight">
                <en>MaxReelWeight</en>
                <fr>Le poids maximum de la bobine</fr>
            </lb>
            <!--  -->

            <lb k="PackingLevelCode0">
                <en>external_</en>
                <fr>externe</fr>
            </lb>
            <lb k="PackingLevelCode1">
                <en>middle_</en>
                <fr>intermédiaire</fr>
            </lb>
            <lb k="PackingLevelCode2">
                <en>internal</en>
                <fr>interne</fr>
            </lb>
            <!--  -->
            <lb k="UnitWeight">
                <en>Unit weight</en>
                <fr>Poid unitaire</fr>
            </lb>
            <lb k="TotalWeight">
                <en>Total weight</en>
                <fr>Poid total</fr>
            </lb>
            <!--  -->
            <lb k="Section">
                <en>Section_</en>
                <fr>Cahier_</fr>
            </lb>

            <lb l="SpecSections" k="SheetSize">
                <en>SheetSize_</en>
                <fr>Format utile de la feuille</fr>
            </lb>
            <lb k="SheetSize">
                <en>SheetSize_</en>
                <fr>SheetSize_</fr>
            </lb>

            <lb k="TotalAmount">
                <en>Total Amount</en>
                <fr>Montant total</fr>
            </lb>

            <lb k="Tax">
                <en>Tax</en>
                <fr>Taxe</fr>
            </lb>
            <lb k="TaxableAmount">
                <en>Taxable amount</en>
                <fr>Montant taxable</fr>
            </lb>
            <lb k="TaxAmount">
                <en>Tax amount</en>
                <fr>Montant taxe</fr>
            </lb>
            <lb k="GrossAmount">
                <en>Gross amount</en>
                <fr>Montant brut</fr>
            </lb>
            <lb k="NetAmount">
                <en>Net amount</en>
                <fr>Montant net</fr>
            </lb>
            <lb k="DueAmount">
                <en>Due amount</en>
                <fr>Montant dû</fr>
            </lb>
            <lb k="AdditionalMeasureDetail">
                <en>Additional measure detail</en>
                <fr>Données additionelles</fr>
            </lb>
            <lb k="foo">
                <en>foo</en>
                <fr>bidon</fr>
            </lb>
            <!-- [/ce/Schema/xsd/ref/ClicEdit_codelists.xsd] -->
            <!--CodeLists_type-->
            <lb l="CodeLists_type" k="01E-RREAD" s="xsd">
                <en>Rereading</en>
                <fr>RELECTURE TOG</fr>
            </lb>
            <lb l="CodeLists_type" k="01E-COPYEDIT" s="xsd">
                <en>Copy Editing</en>
                <fr>PREPARATION DE COPIE</fr>
            </lb>
            <lb l="CodeLists_type" k="01E-ICO" s="xsd">
                <en>Iconography</en>
                <fr>ICONOGRAPHIE</fr>
            </lb>
            <lb l="CodeLists_type" k="01E-EREVIEW" s="xsd">
                <en>Editorial Review</en>
                <fr>RELECTURE EDITORIALE</fr>
            </lb>
            <lb l="CodeLists_type" k="01E-IDX" s="xsd">
                <en>Indexing</en>
                <fr>INDEXATION</fr>
            </lb>
            <lb l="CodeLists_type" k="01E-RW" s="xsd">
                <en>Rewriting</en>
                <fr>REWRITTING</fr>
            </lb>
            <lb l="CodeLists_type" k="01E-TRANS" s="xsd">
                <en>Translation</en>
                <fr>TRADUCTION</fr>
            </lb>
            <lb l="CodeLists_type" k="01L-LAYCREA" s="xsd">
                <en>Layout Creation</en>
                <fr>CREATION MAQUETTE</fr>
            </lb>
            <lb l="CodeLists_type" k="01L-TYPRO" s="xsd">
                <en>Typesetting Protocol</en>
                <fr>Création protocole typo</fr>
            </lb>
            <lb l="CodeLists_type" k="01L-ILLCREA" s="xsd">
                <en>Illustration Creation</en>
                <fr>CREATION ILLUSTRATIONS</fr>
            </lb>
            <lb l="CodeLists_type" k="01L-ILLCREA-TYPE" s="xsd">
                <en>Illustration Type : artistic / technical / carto</en>
                <fr>Type d'illustrations : artistic / technical / carto</fr>
            </lb>
            <lb l="CodeLists_type" k="01L-ILLCREA-LVL" s="xsd">
                <en>illustration Complexity Level</en>
                <fr>Illustrations niveau difficulté</fr>
            </lb>
            <lb l="CodeLists_type" k="01P-SCAN" s="xsd">
                <en>Scanning</en>
                <fr>SCAN</fr>
            </lb>
            <lb l="CodeLists_type" k="01P-SCAN-TYPE" s="xsd">
                <en>Scanning Type : trait / simili / quadri</en>
                <fr>Type de scan : trait / simili / quadri</fr>
            </lb>
            <lb l="CodeLists_type" k="01P-ADD" s="xsd">
                <en>Adding Graphic Material</en>
                <fr>AJOUT DE MATIERE</fr>
            </lb>
            <lb l="CodeLists_type" k="01P-ADD-LVL" s="xsd">
                <en>Graphic Adding Complexity Level</en>
                <fr>Ajout matière niveau difficuté</fr>
            </lb>
            <lb l="CodeLists_type" k="01P-CROP" s="xsd">
                <en>Cropping</en>
                <fr>DETOURAGE</fr>
            </lb>
            <lb l="CodeLists_type" k="01P-CROP-LVL" s="xsd">
                <en>Cropping Complexity Level</en>
                <fr>Détourage niveau difficuté</fr>
            </lb>
            <lb l="CodeLists_type" k="01P-CONV" s="xsd">
                <en>Image Conversion</en>
                <fr>CONVERSION IMAGE</fr>
            </lb>
            <lb l="CodeLists_type" k="01P-COLWORK" s="xsd">
                <en>Color Work</en>
                <fr>RETOUCHE CHROMIE</fr>
            </lb>
            <lb l="CodeLists_type" k="01P-COLWORK-LVL" s="xsd">
                <en>Color Work Complexity Level</en>
                <fr>Retouche niveau difficuté</fr>
            </lb>
            <lb l="CodeLists_type" k="01P-CV" s="xsd">
                <en>Cover Engraving</en>
                <fr>COUVERTURE</fr>
            </lb>
            <lb l="CodeLists_type" k="01P-HR" s="xsd">
                <en>HR Color Proof</en>
                <fr>EPREUVE COULEUR HAUTE DÉFINITION</fr>
            </lb>
            <lb l="CodeLists_type" k="01P-HR-FT" s="xsd">
                <en>HR Format Color Proof</en>
                <fr>Epreuve format</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-PRODSET" s="xsd">
                <en>Production Setup</en>
                <fr>PARAMETRAGE CHAINE DE PRODUCTION</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-INPUT" s="xsd">
                <en>Input (Data Acquisition)</en>
                <fr>Saisie</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-INPUT-QL" s="xsd">
                <en>Input quality : Simple / Double</en>
                <fr>Qualité de saisie : Simple / Double</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-OCR" s="xsd">
                <en>OCR</en>
                <fr>OCR</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-OCR-QL" s="xsd">
                <en>OCR quality : Simple / Double</en>
                <fr>OCR qualité : Simple / Double</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-TRANSCR" s="xsd">
                <en>Transcription</en>
                <fr>Transcription</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-TRANSCR-FT" s="xsd">
                <en>Input Transcription Format</en>
                <fr>Transcription format d'entrée</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-STYLING" s="xsd">
                <en>Word Styling</en>
                <fr>Stylage Word</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-XML" s="xsd">
                <en>XML Structuration</en>
                <fr>Structuration XML</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-INPUTDB" s="xsd">
                <en>Database Input</en>
                <fr>Entrée dans BDD</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-IDX" s="xsd">
                <en>Index Data Typesetting</en>
                <fr>POSE D'ENTREES D'INDEX</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-IDX-IN" s="xsd">
                <en>Index Data Input Type</en>
                <fr>POSE D'ENTREES D'INDEX - Origine</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-IDXOUT" s="xsd">
                <en>Index Extraction</en>
                <fr>EXTRACTION D'INDEX</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-LINK" s="xsd">
                <en>Data Links Typesetting</en>
                <fr>POSE DE LIENS OU REFERENCES</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-TABLE" s="xsd">
                <en>Table Work</en>
                <fr>COMPOSITION DE TABLEAUX</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-TABLE-LVL" s="xsd">
                <en>Table Work Difficulty Level : Simple / Complex</en>
                <fr>COMPOSITION DE TABLEAUX niveau difficulté : Simple / Complex</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-FORM" s="xsd">
                <en>Formulary Typesetting</en>
                <fr>COMPOSITION FORMULAIRE</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-MATH" s="xsd">
                <en>Math Typesetting</en>
                <fr>CREATION DE FORMULES MATHEMATIQUES</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-MATH-LVL" s="xsd">
                <en>Math Typesetting Difficulty Level</en>
                <fr>CREATION DE FORMULES MATHEMATIQUES niveau difficulté</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-BARCODE" s="xsd">
                <en>Barcode Creation</en>
                <fr>CREATION DE CODES BARRE</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-COLLATE" s="xsd">
                <en>Collating</en>
                <fr>COLLATIONNEMENT</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-MEP" s="xsd">
                <en>Page Make-Up</en>
                <fr>MISE EN PAGE</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-MEP-IN" s="xsd">
                <en>Page Make-Up Input Type</en>
                <fr>MISE EN PAGE - Origine</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-REDUC" s="xsd">
                <en>Homothetic Reduction</en>
                <fr>REDUCTION HOMOTHÉTIQUE</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-IMG" s="xsd">
                <en>Image Integration</en>
                <fr>INTEGRATION IMAGE</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-BPROOF" s="xsd">
                <en>Black Proof</en>
                <fr>EPREUVE NOIR</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-BPROOF-FT" s="xsd">
                <en>Black Proof Format : A4, A3</en>
                <fr>EPREUVE NOIR Format : A4, A3</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-CPROOF" s="xsd">
                <en>Color Proof</en>
                <fr>EPREUVE COULEUR</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-CPROOF-FT" s="xsd">
                <en>Color Proof Format : A4, A3</en>
                <fr>EPREUVE COULEUR Format : A4, A3</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-PUBREV" s="xsd">
                <en>Publisher Revision</en>
                <fr>CORRECTIONS AUTEUR</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-PUBREV-FT" s="xsd">
                <en>Publisher Revision type</en>
                <fr>CORRECTIONS AUTEUR Type</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-PPROOF" s="xsd">
                <en>Press Proof</en>
                <fr>CORRECTIONS AUTEUR Type</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-PDFP" s="xsd">
                <en>PDF Print</en>
                <fr>CORRECTIONS AUTEUR Type</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-UPDATE" s="xsd">
                <en>Update</en>
                <fr>MISE A JOUR</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-UPDATE-FT" s="xsd">
                <en>Update Input Format</en>
                <fr>MISE A JOUR Format d'entrée</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-CONV" s="xsd">
                <en>File Conversion : mepToWord, mepToXml, wordToXml, xmlToWord, xmlToHtml, other</en>
                <fr>TRANSFORMATIONS DE FICHIERS : mepToWord, mepToXml, wordToXml, xmlToWord, xmlToHtml, other</fr>
            </lb>
            <lb l="CodeLists_type" k="01T-CONV-FT" s="xsd">
                <en>File Conversion Format</en>
                <fr>TRANSFORMATIONS DE FICHIERS Format</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-PDFLR" s="xsd">
                <en>Low Res PDF</en>
                <fr>PDF basse définition</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-CSS" s="xsd">
                <en>CSS Development</en>
                <fr>DEVELOPPEMENT CSS</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-CD" s="xsd">
                <en>CD Mastering</en>
                <fr>RÉALISATION MASTER (CD/DVD/USB)</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-EPUBPLUS" s="xsd">
                <en>Ebook Enhancement</en>
                <fr>ENRICHISSEMENT EPUB</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-EPUBPLUSD" s="xsd">
                <en>Enhanced Epub</en>
                <fr>epub enrichi</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-EPUBPROOF" s="xsd">
                <en>EPUB Reflow Proof</en>
                <fr>epub reflow épreuve</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-EPUBPROOF-LVL" s="xsd">
                <en>EPUB Reflow Proof Difficulty Level : standard / specific</en>
                <fr>epub reflow épreuve niveau difficultés : standard / specific</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-EPUBRE" s="xsd">
                <en>EPUB Reflow</en>
                <fr>epub reflow</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-EPUBRE-LVL" s="xsd">
                <en>EPUB Reflow Difficulty Level : standard / specific</en>
                <fr>epub reflow niveau difficultés : standard / specific</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-EPUBRE-SRC" s="xsd">
                <en>EPUB Reflow Source</en>
                <fr>epub reflow source</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-EPUBFIX" s="xsd">
                <en>Fixed Layout Epub</en>
                <fr>epub fixed layout</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-EPUBFIX-OUT" s="xsd">
                <en>Fixed Layout Epub output Format : image / html</en>
                <fr>epub fixed layout mode de sortie : image / html</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-EPUBFIX-SRC" s="xsd">
                <en>EPUB Fixed Layout Source</en>
                <fr>epub reflow source</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-MOBI" s="xsd">
                <en>Mobi</en>
                <fr>Mobi</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-MOBI-OUT" s="xsd">
                <en>Mobi Output Format : reflow / fixedLayout</en>
                <fr>Mobi mode de sortie : reflow / fixedLayout</fr>
            </lb>
            <lb l="CodeLists_type" k="01D-PDFWEB" s="xsd">
                <en>Web PDF</en>
                <fr>GENERATION PDF WEB</fr>
            </lb>
            <lb l="CodeLists_type" k="01S-CV" s="xsd">
                <en>Cover book Scannning</en>
                <fr>Numérisation - Couverture</fr>
            </lb>
            <lb l="CodeLists_type" k="01S-BOOK" s="xsd">
                <en>Bookblock Scanning From Print</en>
                <fr>Numérisation - intérieur d'après original imprimé</fr>
            </lb>
            <lb l="CodeLists_type" k="01S-IMG" s="xsd">
                <en>Bookblock Scanning From Image PDF</en>
                <fr>Numérisation - intérieur d'après pdf image</fr>
            </lb>
            <lb l="CodeLists_type" k="01S-TXT" s="xsd">
                <en>Bookblock Scanning From Text PDF</en>
                <fr>Numérisation - intérieur d'après pdf texte</fr>
            </lb>
            <lb l="CodeLists_type" k="01F-OUT" s="xsd">
                <en>Flash Output</en>
                <fr>FLASHAGE</fr>
            </lb>
            <lb l="CodeLists_type" k="01A-ARCHIVE" s="xsd">
                <en>Archiving</en>
                <fr>ARCHIVAGE</fr>
            </lb>
            <lb l="CodeLists_type" k="01A-ARCHIVE-LVL" s="xsd">
                <en>Archiving level</en>
                <fr>ARCHIVAGE niveau</fr>
            </lb>
            <lb l="CodeLists_type" k="01A-RECOVER" s="xsd">
                <en>Archive Recovery</en>
                <fr>DESARCHIVAGE</fr>
            </lb>
            <lb l="CodeLists_type" k="OTHER" s="xsd">
                <fr>Possibilité d'indiquer un service autre</fr>
            </lb>
            <!-- [ce/Schema/xsd/ref/ClicEdit_enums.xsd] -->

            <!-- payment_date_ref_list_type  MAN-->
            <lb l="payment_date_ref_list_type" k="orderDate">
                <en>order date</en>
                <fr>la date de la commande</fr>
            </lb>
            <lb l="payment_date_ref_list_type" k="invoiceDate">
                <en>invoice date</en>
                <fr>la date de facturation</fr>
            </lb>



            <!-- movement_operation_list_type  MAN -->
            <lb l="movement_operation_list_type" k="in_out">
                <en>in/out_</en>
                <fr>entrée/sortie_</fr>
            </lb>
            <lb l="movement_operation_list_type" k="correction">
                <en>correction</en>
                <fr>rectification_</fr>
            </lb>

            <!-- technical_status_list_type  MAN-->

            <lb s="xsd" l="technical_status_list_type" k="200">
                <en>The server was able to execute the request or deliver it to the final recipient. The returned Response might contain application warnings or errors: the Request itself generated no errors or warnings, however, this status does not reflect any errors or warnings that might be generated afterward by the application itself. You will receive no further status updates, unless an error occurs during later processing.</en>
            </lb>
            <lb s="xsd" l="technical_status_list_type" k="400">
                <en>Request unacceptable to the server, although it parsed correctly.</en>
            </lb>
            <lb s="xsd" l="technical_status_list_type" k="401">
                <en>Credentials provided in the Request (the Sender element) were not recognized by the server.</en>
            </lb>
            <lb s="xsd" l="technical_status_list_type" k="403">
                <en>The user has insufficient privileges to execute this Request.</en>
            </lb>
            <lb s="xsd" l="technical_status_list_type" k="404">
                <en>The requested order was not found on this server.</en>
            </lb>
            <lb s="xsd" l="technical_status_list_type" k="406">
                <en>Request unacceptable to the server, likely due to a parsing failure.</en>
            </lb>
            <lb s="xsd" l="technical_status_list_type" k="450">
                <en>The server does not implement the particular Request. For example, invoicing or the requested operation might not be supported.</en>
            </lb>
            <lb s="xsd" l="technical_status_list_type" k="500">
                <en>Server was unable to complete the Request.</en>
            </lb>
            <lb s="xsd" l="technical_status_list_type" k="560">
                <en>For example, a server might be down for maintenance. The client should retry later.</en>
            </lb>



            <!--contact_role_list_type-->
            <lb l="contact_role_list_type" k="endUser" s="xsd">
                <en>Final user / Main contact</en>
                <fr>Contact principal</fr>
            </lb>
            <lb l="contact_role_list_type" k="purchasingAgent" s="xsd">
                <en>Contact details about the purchasing agent.</en>
                <fr>Responsable des achats.</fr>
            </lb>
            <lb l="contact_role_list_type" k="customerService" s="xsd">
                <en>Customer service.</en>
                <fr>Service client.</fr>
            </lb>
            <lb l="contact_role_list_type" k="technicalSupport" s="xsd">
                <en>Technical support contact.</en>
                <fr>Support technique.</fr>
            </lb>
            <lb l="contact_role_list_type" k="buyerAccountingService" s="xsd">
                <en>Buyer accounting service, for invoicing.</en>
                <fr>Comptabilité Acheteur.</fr>
            </lb>
            <lb l="contact_role_list_type" k="supplierAccountingService" s="xsd">
                <en>Supplier accounting service, for invoicing.</en>
                <fr>Comptabilité Fournisseur.</fr>
            </lb>
            <lb l="contact_role_list_type" k="buyerProjectManager" s="xsd">
                <en>Buyer project manager.</en>
                <fr>Chef de projet Acheteur</fr>
            </lb>
            <lb l="contact_role_list_type" k="supplierProjectManager" s="xsd">
                <en>Supplier project manager.</en>
                <fr>Chef de projet Fournisseur</fr>
            </lb>
            <lb l="contact_role_list_type" k="sales" s="xsd">
                <en>Sales.</en>
                <fr>Commercial</fr>
            </lb>
            <lb l="contact_role_list_type" k="edition" s="xsd">
                <en>Contact details about the edition, to distinct publisher for a same customer</en>
                <fr>Editeur</fr>
            </lb>
            <lb l="contact_role_list_type" k="carrierCorporate" s="xsd">
                <en>Carrrier corporate.</en>
                <fr>Transporteur</fr>
            </lb>
            <lb l="contact_role_list_type" k="manufacturingManager" s="xsd">
                <en>Manufacturing Manager / Production Director.</en>
                <fr>responsable/directeur de fabrication ou de production</fr>
            </lb>
            <lb l="contact_role_list_type" k="manufacturer" s="xsd">
                <en>Manufacturer</en>
                <fr>Fabricant</fr>
            </lb>
            <lb l="contact_role_list_type" k="headOffice" s="xsd">
                <en>Head Office</en>
                <fr>Siège social</fr>
            </lb>
            <lb l="contact_role_list_type" k="administrator" s="xsd">
                <en>Administrator</en>
                <fr>Administrateur</fr>
            </lb>
            <lb l="contact_role_list_type" k="otherRole" s="xsd">
                <en>Other</en>
                <fr>Divers</fr>
            </lb>
            <lb l="contact_role_list_type" k="supplierCorporate" s="xsd">
                <en>Supplier Corporate</en>
                <fr>"Fournisseur Corporatif"</fr>
            </lb>
            <lb l="contact_role_list_type" k="supplierAccount" s="xsd">
                <en>Supplier Account</en>
                <fr>Compte Founisseur</fr>
            </lb>
            <lb l="contact_role_list_type" k="buyerCorporate" s="xsd">
                <en>Buyer Corporate</en>
                <fr>"Acheteur Corporatif"</fr>
            </lb>
            <lb l="contact_role_list_type" k="buyerAccount" s="xsd">
                <en>Buyer Account</en>
                <fr>Compte acheteur</fr>
            </lb>
            <!--order_admin_status_list_type-->
            <lb l="order_admin_status_list_type" k="new" s="xsd">
                <en>New order</en>
                <fr>Commande nouvelle</fr>
            </lb>
            <lb l="order_admin_status_list_type" k="active" s="xsd">
                <en>Order accepted</en>
                <fr>Commande active/acceptée</fr>
            </lb>
            <lb l="order_admin_status_list_type" k="canceled" s="xsd">
                <en>Order canceled</en>
                <fr>Commande annulée</fr>
            </lb>
            <lb l="order_admin_status_list_type" k="refused" s="xsd">
                <en>Order refused</en>
                <fr>Commande refusée</fr>
            </lb>
            <lb l="order_admin_status_list_type" k="closed" s="xsd">
                <en>Order closed</en>
                <fr>Commande terminée</fr>
            </lb>
            <!--order_prod_status_list_type-->
            <lb l="order_prod_status_list_type" k="not_inproduction" s="xsd">
                <en>Not in production</en>
                <fr>Production non lancée</fr>
            </lb>
            <lb l="order_prod_status_list_type" k="inproduction" s="xsd">
                <en>In production</en>
                <fr>En production</fr>
            </lb>
            <lb l="order_prod_status_list_type" k="closed" s="xsd">
                <en>Production closed</en>
                <fr>Production terminée</fr>
            </lb>
            <!--ship_status_list_type-->
            <lb l="ship_status_list_type" k="not_shipped" s="xsd">
                <en>Not shipped</en>
                <fr>Non expédiée</fr>
            </lb>
            <lb l="ship_status_list_type" k="shipped" s="xsd">
                <fr>Expédition envoyée</fr>
            </lb>
            <lb l="ship_status_list_type" k="delivered" s="xsd">
                <en>Shipped</en>
                <fr>Expédition livrée</fr>
            </lb>
            <!--order_invoice_status_list_type-->
            <lb l="order_invoice_status_list_type" k="not_invoiced" s="xsd">
                <en>Not invoiced</en>
                <fr>Commande non facturée</fr>
            </lb>
            <lb l="order_invoice_status_list_type" k="invoiced" s="xsd">
                <en>Invoiced</en>
                <fr>Commande facturée</fr>
            </lb>
            <lb l="order_invoice_status_list_type" k="partially_invoiced" s="xsd">
                <en>Partially invoiced</en>
                <fr>Commande partiellement facturée</fr>
            </lb>
            <!--invoice_status_list_type-->
            <lb l="invoice_status_list_type" k="new" s="xsd">
                <en>New invoice</en>
                <fr>Facture nouvelle</fr>
            </lb>
            <lb l="invoice_status_list_type" k="validated" s="xsd">
                <en>Invoice Validated</en>
                <fr>Facture validée</fr>
            </lb>
            <lb l="invoice_status_list_type" k="waiting_amendmend" s="xsd">
                <en>Invoice Waiting amendmend</en>
                <fr>Facture en attente de régularisation</fr>
            </lb>
            <lb l="invoice_status_list_type" k="paid" s="xsd">
                <en>Invoice Paid</en>
                <fr>Facture règlée</fr>
            </lb>
            <!--credit_status_list_type-->
            <lb l="credit_status_list_type" k="new" s="xsd">
                <en>New credi</en>
                <fr>Avoir nouveau</fr>
            </lb>
            <lb l="credit_status_list_type" k="validated" s="xsd">
                <en>Credit Validated</en>
                <fr>Avoir validé</fr>
            </lb>
            <lb l="credit_status_list_type" k="waiting_amendmend" s="xsd">
                <en>Credit Waiting amendmend</en>
                <fr>Avoir en attente de régularisation</fr>
            </lb>
        </labels>
    </xsl:variable>

    <xsl:variable name="vLabels" select="exslt:node-set($vLabels_out)/i_d:labels"/>

    <!--ByFileXml x.l:variable name="vLabels" select="document('i18n_xml.xml')/i_d:labels"/-->

</xsl:stylesheet>
