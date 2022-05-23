xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/entregaproducto/obtenerrecibocaja/v1";
(:: import schema at "../Schemas/Legacy/CB_EP_ObtenerReciboCaja.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/entregaproducto/obtenerrecibocaja/v1";
(:: import schema at "../Schemas/EE_EP_ObtenerReciboCaja.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaObtenerReciboCaja) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaObtenerReciboCaja) ::)) as element() (:: schema-element(ns2:entradaObtenerReciboCaja) ::) {
    <ns2:entradaObtenerReciboCaja>
        <ns2:NIR>{fn:data($payloadRequest/ns1:NIR)}</ns2:NIR>
        <ns2:ReferenciaPago>{fn:data($payloadRequest/ns1:ReferenciaPago)}</ns2:ReferenciaPago>
    </ns2:entradaObtenerReciboCaja>
};

local:func($payloadRequest)