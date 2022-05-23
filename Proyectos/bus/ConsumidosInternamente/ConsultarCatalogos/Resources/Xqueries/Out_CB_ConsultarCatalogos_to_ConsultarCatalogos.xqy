xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/consultacatalogos/consultarcatalogos/v1";
(:: import schema at "../Schemas/Legacy/CB_CC_ConsultarCatalogos.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ci/consultacatalogos/consultarcatalogos/v1";
(:: import schema at "../Schemas/CI_CC_ConsultarCatalogos.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarCatalogos) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarCatalogos) ::)) as element() (:: schema-element(ns2:salidaConsultarCatalogos) ::) {
    <ns2:salidaConsultarCatalogos>
       
        <ns2:catalogos>
            {
                for $catalogo in $payloadResponse/*:catalogos/ns1:catalogo
                return 
                <ns2:catalogo>
                    <ns2:codigo>{fn:data($catalogo/*:codigo)}</ns2:codigo>
                    <ns2:nombre>{fn:data($catalogo/*:nombre)}</ns2:nombre></ns2:catalogo>
            }
        </ns2:catalogos>
        <ns2:codigoMensaje>{fn:data($payloadResponse/*:codigoMensaje)}</ns2:codigoMensaje>
        <ns2:descripcionMensaje>{fn:data($payloadResponse/*:descripcionMensaje)}</ns2:descripcionMensaje>
    </ns2:salidaConsultarCatalogos>
};

local:func($payloadResponse)