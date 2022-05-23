xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/consultacatalogos/consultarcatalogos/v1";
(:: import schema at "../Schemas/Legacy/CB_CC_ConsultarCatalogos.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/consultacatalogos/consultarcatalogos/v1";
(:: import schema at "../Schemas/EE_CC_ConsultarCatalogos.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarCatalogos) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarCatalogos) ::)) as element() (:: schema-element(ns2:entradaConsultarCatalogos) ::) {
    <ns2:entradaConsultarCatalogos>
        <ns2:modulo>{fn:data($payloadRequest/ns1:modulo)}</ns2:modulo>
        <ns2:catalogo>{fn:data($payloadRequest/ns1:catalogo)}</ns2:catalogo>
        <ns2:parametro>{fn:data($payloadRequest/ns1:parametro)}</ns2:parametro>
        
    </ns2:entradaConsultarCatalogos>
};

local:func($payloadRequest)