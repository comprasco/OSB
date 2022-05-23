xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/operacionesfinancieras/obtenerclavepdfliquidacion/v2";
(:: import schema at "../Schemas/Legacy/CB_OF_ObtenerClavePDFLiquidacion.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/obtenerpdfliquidacion/v2";
(:: import schema at "../Schemas/EF_OF_ObtenerPDFLiquidacion.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaObtenerPDFLiquidacion) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaObtenerPDFLiquidacion) ::)) as element() (:: schema-element(ns2:entradaObtenerClavePDFLiquidacion) ::) {
    <ns2:entradaObtenerClavePDFLiquidacion>
        <ns2:numeroReferencia>{fn:data($payloadRequest/ns1:numeroReferencia)}</ns2:numeroReferencia>
        
    </ns2:entradaObtenerClavePDFLiquidacion>
};

local:func($payloadRequest)