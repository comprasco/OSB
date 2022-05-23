xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ci/operacionesfinancieras/registraranulacion/v2";
(:: import schema at "../Schemas/CI_OF_RegistrarAnulacion.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/np/operacionesfinancieras/registraranulacion/v2";
(:: import schema at "../Schemas/Legacy/NP_OF_RegistrarAnulacion.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaRegistrarAnulacion) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaRegistrarAnulacion) ::)) as element() (:: schema-element(ns2:entradaRegistrarAnulacion) ::) {
    <ns2:entradaRegistrarAnulacion>
        <ns2:numeroReferencia>{fn:data($payloadRequest/ns1:numeroReferencia)}</ns2:numeroReferencia>
        
    </ns2:entradaRegistrarAnulacion>
};

local:func($payloadRequest)