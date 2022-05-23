xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/entregaproducto/obtenerproducto/v1";
(:: import schema at "../Schemas/Legacy/CB_EP_ObtenerProducto.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/entregaproducto/obtenerproducto/v1";
(:: import schema at "../Schemas/EE_EP_ObtenerProducto.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaObtenerProducto) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaObtenerProducto) ::)) as element() (:: schema-element(ns2:entradaObtenerProducto) ::) {
    <ns2:entradaObtenerProducto>
        <ns2:Turno>{fn:data($payloadRequest/ns1:Turno)}</ns2:Turno>
        <ns2:CodigoVerificacion>{fn:data($payloadRequest/ns1:CodigoVerificacion)}</ns2:CodigoVerificacion>
        <ns2:ReferenciaPago>{fn:data($payloadRequest/ns1:ReferenciaPago)}</ns2:ReferenciaPago>
        
    </ns2:entradaObtenerProducto>
};

local:func($payloadRequest)