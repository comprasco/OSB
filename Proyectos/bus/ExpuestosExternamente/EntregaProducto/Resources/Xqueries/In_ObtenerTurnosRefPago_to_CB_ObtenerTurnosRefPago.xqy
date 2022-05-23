xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/entregaproducto/obtenerturnosrefpago/v1";
(:: import schema at "../Schemas/Legacy/CB_EP_ObtenerTurnosRefPago.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/entregaproducto/obtenerturnosrefpago/v1";
(:: import schema at "../Schemas/EE_EP_ObtenerTurnosRefPago.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaObtenerTurnosRefPago) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaObtenerTurnosRefPago) ::)) as element() (:: schema-element(ns2:entradaObtenerTurnosRefPago) ::) {
    <ns2:entradaObtenerTurnosRefPago>
        <ns2:ReferenciaPago>{fn:data($payloadRequest/ns1:ReferenciaPago)}</ns2:ReferenciaPago>
        
    </ns2:entradaObtenerTurnosRefPago>
};

local:func($payloadRequest)