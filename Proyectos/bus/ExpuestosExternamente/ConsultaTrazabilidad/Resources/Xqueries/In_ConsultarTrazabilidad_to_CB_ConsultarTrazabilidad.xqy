xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/consultatrazabilidad/consultartrazabilidad/v1";
(:: import schema at "../Schemas/Legacy/CB_CT_ConsultarTrazabilidad.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/consultatrazabilidad/consultartrazabilidad/v1";
(:: import schema at "../Schemas/EE_CT_ConsultarTrazabilidad.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarTrazabilidad) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarTrazabilidad) ::)) as element() (:: schema-element(ns2:entradaConsultarTrazabilidad) ::) {
    <ns2:entradaConsultarTrazabilidad>
        <ns2:modulo>{fn:data($payloadRequest/ns1:modulo)}</ns2:modulo>
        <ns2:criterioBusqueda>{fn:data($payloadRequest/ns1:criterioBusqueda)}</ns2:criterioBusqueda>
        <ns2:valorCriterioBusqueda>{fn:data($payloadRequest/ns1:valorCriterioBusqueda)}</ns2:valorCriterioBusqueda>
        
    </ns2:entradaConsultarTrazabilidad>
};

local:func($payloadRequest)