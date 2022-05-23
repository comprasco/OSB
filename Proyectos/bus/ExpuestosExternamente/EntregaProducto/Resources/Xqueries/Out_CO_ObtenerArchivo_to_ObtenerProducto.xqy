xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/co/busquedadocumentos/obtenerarchivo/v1";
(:: import schema at "../Schemas/Legacy/CO_BD_ObtenerArchivo.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/entregaproducto/obtenerproducto/v1";
(:: import schema at "../Schemas/EE_EP_ObtenerProducto.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaObtenerArchivo) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaObtenerArchivo) ::)) as element() (:: schema-element(ns2:salidaObtenerProducto) ::) {
    <ns2:salidaObtenerProducto>
        <ns2:archivo>{fn:data($payloadResponse/ns1:archivo)}</ns2:archivo>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
        
    </ns2:salidaObtenerProducto>
};

local:func($payloadResponse)