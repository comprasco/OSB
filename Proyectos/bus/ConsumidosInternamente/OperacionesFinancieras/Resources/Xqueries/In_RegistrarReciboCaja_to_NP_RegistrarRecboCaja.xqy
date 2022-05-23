xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ci/operacionesfinancieras/registrarrecibocaja/v2";
(:: import schema at "../Schemas/CI_OF_RegistrarReciboCaja.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/np/operacionesfinancieras/registrarrecibocaja/v2";
(:: import schema at "../Schemas/Legacy/NP_OF_RegistrarReciboCaja.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaRegistrarReciboCaja) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaRegistrarReciboCaja) ::)) as element() (:: schema-element(ns2:entradaRegistrarReciboCaja) ::) {
    <ns2:entradaRegistrarReciboCaja>
        <ns2:numeroReferencia>{fn:data($payloadRequest/ns1:numeroReferencia)}</ns2:numeroReferencia>
        <ns2:fechaHoraRecibo>{fn:data($payloadRequest/ns1:fechaHoraRecibo)}</ns2:fechaHoraRecibo>
        
    </ns2:entradaRegistrarReciboCaja>
};

local:func($payloadRequest)