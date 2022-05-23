xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/impuestosgobernaciones/notificarpago/v1";
(:: import schema at "../Schemas/Legacy/CB_IG_NotificarPago.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/impuestosgobernaciones/notificarpago/v1";
(:: import schema at "../Schemas/EE_IG_NotificarPago.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaNotificarPago) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaNotificarPago) ::)) as element() (:: schema-element(ns2:entradaNotificarPago) ::) {
    <ns2:entradaNotificarPago>
        <ns2:idTramite>{fn:data($payloadRequest/idTramite)}</ns2:idTramite>
        <ns2:reciboPago>{fn:data($payloadRequest/reciboPago)}</ns2:reciboPago>
        <ns2:fechaPago>{fn:data($payloadRequest/fechaPago)}</ns2:fechaPago>
        <ns2:referenciaPago>{fn:data($payloadRequest/referenciaPago)}</ns2:referenciaPago>
        <ns2:valorTotalPago>{fn:data($payloadRequest/valorTotalPago)}</ns2:valorTotalPago>
    </ns2:entradaNotificarPago>
};

local:func($payloadRequest)