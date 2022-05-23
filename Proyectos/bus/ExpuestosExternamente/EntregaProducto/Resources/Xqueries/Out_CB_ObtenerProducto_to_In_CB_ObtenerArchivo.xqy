xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/entregaproducto/obtenerproducto/v1";
(:: import schema at "../Schemas/Legacy/CB_EP_ObtenerProducto.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/co/busquedadocumentos/obtenerarchivo/v1";
(:: import schema at "../Schemas/Legacy/CO_BD_ObtenerArchivo.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:salidaObtenerProducto) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:salidaObtenerProducto) ::)) as element() (:: schema-element(ns2:entradaObtenerArchivo) ::) {
    <ns2:entradaObtenerArchivo>
        <ns2:dDocName>{fn:data($payloadRequest/ns1:docName)}</ns2:dDocName>
        <ns2:dID>{fn:data($payloadRequest/ns1:dID)}</ns2:dID>
    </ns2:entradaObtenerArchivo>
};

local:func($payloadRequest)
