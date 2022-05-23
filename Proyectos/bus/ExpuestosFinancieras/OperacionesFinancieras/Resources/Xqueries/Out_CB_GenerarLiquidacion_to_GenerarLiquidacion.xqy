xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/operacionesfinancieras/generarliquidacion/v2";
(:: import schema at "../Schemas/Legacy/CB_OF_GenerarLiquidacion.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/generarliquidacion/v2";
(:: import schema at "../Schemas/EF_OF_GenerarLiquidacion.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaGenerarLiquidacion) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaGenerarLiquidacion) ::)) as element() (:: schema-element(ns2:salidaGenerarLiquidacion) ::) {
    <ns2:salidaGenerarLiquidacion>
        <ns2:numeroReferencia>{fn:data($payloadResponse/*:numeroReferencia)}</ns2:numeroReferencia>
        <ns2:nir>{fn:data($payloadResponse/*:nir)}</ns2:nir>
        <ns2:fechaLiquidacion>{fn:data($payloadResponse/*:fechaLiquidacion)}</ns2:fechaLiquidacion>
        <ns2:fechaVencimiento>{fn:data($payloadResponse/*:fechaVencimiento)}</ns2:fechaVencimiento>
        <ns2:valorTotalServicio>{fn:data($payloadResponse/*:valorTotalServicio)}</ns2:valorTotalServicio>
        <ns2:serviciosLiquidados>
            {
                for $servicioLiquidado in $payloadResponse/*:serviciosLiquidados/*:servicioLiquidado
                return 
                <ns2:servicioLiquidado>
                    <ns2:tipoServicio>{fn:data($servicioLiquidado/*:tipoServicio)}</ns2:tipoServicio>
                    <ns2:subtipoServicio>{fn:data($servicioLiquidado/*:subtipoServicio)}</ns2:subtipoServicio>
                    <ns2:cantidadSolicitada>{fn:data($servicioLiquidado/*:cantidadSolicitada)}</ns2:cantidadSolicitada>
                    <ns2:valorServicio>{fn:data($servicioLiquidado/*:valorServicio)}</ns2:valorServicio></ns2:servicioLiquidado>
            }
        </ns2:serviciosLiquidados>
        <ns2:codigoMensaje>{fn:data($payloadResponse/*:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/*:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/*:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
        
        
    </ns2:salidaGenerarLiquidacion>
};

local:func($payloadResponse)