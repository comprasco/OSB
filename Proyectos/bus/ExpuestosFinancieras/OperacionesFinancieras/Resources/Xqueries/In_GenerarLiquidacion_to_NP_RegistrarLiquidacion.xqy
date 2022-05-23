xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/np/operacionesfinancieras/registrarliquidacion/v2";
(:: import schema at "../Schemas/Legacy/NP_OF_RegistrarLiquidacion.xsd" ::)

declare variable $numeroReferencia as xs:string external;
declare variable $nir as xs:string external;
declare variable $valorTotalServicio as xs:string external;
declare variable $fechaVencimiento as xs:string external;
declare variable $fechaLiquidacion as xs:string external;
declare variable $canalOrigenServicio as xs:string external;

declare function local:func($numeroReferencia as xs:string,
                            $nir as xs:string,
                            $valorTotalServicio as xs:string,
                            $fechaVencimiento as xs:string,
                            $fechaLiquidacion as xs:string,
                            $canalOrigenServicio as xs:string) as element() (:: schema-element(ns1:entradaRegistrarLiquidacion) ::) {
    <ns1:entradaRegistrarLiquidacion>
        
        <ns1:numeroReferencia>{fn:data($numeroReferencia)}</ns1:numeroReferencia>
        <ns1:nir>{fn:data($nir)}</ns1:nir>
        <ns1:valorTotalServicio>{fn:data($valorTotalServicio)}</ns1:valorTotalServicio>
        <ns1:fechaLiquidacion>{fn:data($fechaLiquidacion)}</ns1:fechaLiquidacion>
        <ns1:fechaVencimiento>{fn:data($fechaVencimiento)}</ns1:fechaVencimiento>
        <ns1:canalOrigenServicio>{fn:data($canalOrigenServicio)}</ns1:canalOrigenServicio>
    </ns1:entradaRegistrarLiquidacion>
};

local:func($numeroReferencia, $nir, $valorTotalServicio, $fechaVencimiento, $fechaLiquidacion,$canalOrigenServicio)