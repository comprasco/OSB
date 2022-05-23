xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/entregaproducto/verificarproducto/v1";
(:: import schema at "../Schemas/Legacy/CB_EP_VerificarProducto.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/entregaproducto/verificarproducto/v1";
(:: import schema at "../Schemas/EE_EP_VerificarProducto.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaVerificarProducto) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaVerificarProducto) ::)) as element() (:: schema-element(ns2:salidaVerificarProducto) ::) {
    <ns2:salidaVerificarProducto>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
       
    </ns2:salidaVerificarProducto>
};

local:func($payloadResponse)