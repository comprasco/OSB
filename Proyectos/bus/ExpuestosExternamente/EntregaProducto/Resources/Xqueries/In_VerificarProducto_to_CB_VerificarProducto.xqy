xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/entregaproducto/verificarproducto/v1";
(:: import schema at "../Schemas/Legacy/CB_EP_VerificarProducto.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/entregaproducto/verificarproducto/v1";
(:: import schema at "../Schemas/EE_EP_VerificarProducto.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaVerificarProducto) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaVerificarProducto) ::)) as element() (:: schema-element(ns2:entradaVerificarProducto) ::) {
    <ns2:entradaVerificarProducto>
        <ns2:CodigoVerificacion>{fn:data($payloadRequest/ns1:CodigoVerificacion)}</ns2:CodigoVerificacion>
        
    </ns2:entradaVerificarProducto>
};

local:func($payloadRequest)