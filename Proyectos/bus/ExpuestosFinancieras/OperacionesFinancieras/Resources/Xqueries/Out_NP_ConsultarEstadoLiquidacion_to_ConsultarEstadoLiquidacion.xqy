xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/consultarestadoliquidacion/v2";
(:: import schema at "../Schemas/EF_OF_ConsultarEstadoLiquidacion.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/np/operacionesfinancieras/consultarestadoliquidacion/v2";
(:: import schema at "../Schemas/Legacy/NP_OF_ConsultarEstadoLiquidacion.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarEstadoLiquidacion) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarEstadoLiquidacion) ::)) as element() (:: schema-element(ns2:salidaConsultarEstadoLiquidacion) ::) {
    <ns2:salidaConsultarEstadoLiquidacion>
        <ns2:numeroReferencia>{fn:data($payloadResponse/*:numeroReferencia)}</ns2:numeroReferencia>
        {
            if ($payloadResponse/*:codigoTransaccionRecaudador)
            then <ns2:codigoTransaccionRecaudador>{fn:data($payloadResponse/*:codigoTransaccionRecaudador)}</ns2:codigoTransaccionRecaudador>
            else ()
        }
        <ns2:estadoTransaccion>{fn:data($payloadResponse/*:estadoTransaccion)}</ns2:estadoTransaccion>
        <ns2:codigoMensaje>{fn:data($payloadResponse/*:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/*:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/*:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
        
        
    </ns2:salidaConsultarEstadoLiquidacion>
};

local:func($payloadResponse)