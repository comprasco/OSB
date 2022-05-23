xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/entregaproducto/obtenerrecibocaja/v1";
(:: import schema at "../Schemas/Legacy/CB_EP_ObtenerReciboCaja.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/entregaproducto/obtenerrecibocaja/v1";
(:: import schema at "../Schemas/EE_EP_ObtenerReciboCaja.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaObtenerReciboCaja) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaObtenerReciboCaja) ::)) as element() (:: schema-element(ns2:salidaObtenerReciboCaja) ::) {
    <ns2:salidaObtenerReciboCaja>
        <ns2:archivo>{fn:data($payloadResponse/ns1:dID)}</ns2:archivo>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaObtenerReciboCaja>
};

local:func($payloadResponse)