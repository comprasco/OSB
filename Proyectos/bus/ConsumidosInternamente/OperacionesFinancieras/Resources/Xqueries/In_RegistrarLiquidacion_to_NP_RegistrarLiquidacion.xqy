xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ci/operacionesfinancieras/registrarliquidacion/v2";
(:: import schema at "../Schemas/CI_OF_RegistrarLiquidacion.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/np/operacionesfinancieras/registrarliquidacion/v2";
(:: import schema at "../Schemas/Legacy/NP_OF_RegistrarLiquidacion.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaRegistrarLiquidacion) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaRegistrarLiquidacion) ::)) as element() (:: schema-element(ns2:entradaRegistrarLiquidacion) ::) {
    <ns2:entradaRegistrarLiquidacion>
        <ns2:numeroReferencia>{fn:data($payloadRequest/ns1:numeroReferencia)}</ns2:numeroReferencia>
        <ns2:nir>{fn:data($payloadRequest/ns1:nir)}</ns2:nir>
        <ns2:valorTotalServicio>{fn:data($payloadRequest/ns1:valorTotalServicio)}</ns2:valorTotalServicio>
        <ns2:fechaLiquidacion>{fn:data($payloadRequest/ns1:fechaLiquidacion)}</ns2:fechaLiquidacion>
        <ns2:fechaVencimiento>{fn:data($payloadRequest/ns1:fechaVencimiento)}</ns2:fechaVencimiento>
        {
            if ($payloadRequest/ns1:canalOrigenServicio)
            then <ns2:canalOrigenServicio>{fn:data($payloadRequest/ns1:canalOrigenServicio)}</ns2:canalOrigenServicio>
            else ()
        }
       
    </ns2:entradaRegistrarLiquidacion>
};

local:func($payloadRequest)