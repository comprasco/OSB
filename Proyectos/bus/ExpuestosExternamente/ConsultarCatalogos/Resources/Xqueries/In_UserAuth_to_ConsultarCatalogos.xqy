xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/consultacatalogos/consultarcatalogos/v1";
(:: import schema at "../Schemas/Legacy/CB_CC_ConsultarCatalogos.xsd" ::)

declare variable $user as xs:string external;
declare function local:func($user as xs:string) as element() (:: schema-element(ns1:entradaConsultarCatalogos) ::) {
    <ns1:entradaConsultarCatalogos>
        <ns1:modulo>BUS</ns1:modulo>
        <ns1:catalogo>USUARIO_CONVENIO</ns1:catalogo>
        <ns1:parametro>{fn:data($user)}</ns1:parametro>
    </ns1:entradaConsultarCatalogos>
};

local:func($user)
